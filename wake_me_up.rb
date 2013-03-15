class WakeMeUp
  def initialize(alarm_time, music = '/mount/data2/Songs/11.Mazhathullikal.mp3')
    @alarm_time = alarm_time
    @music = music
    @run = true
  end

  def its_time
    system("vlc #{@music} --volume 512")
  end

  def check_time
    while @run
      if Time.now >= @alarm_time
        its_time
        @run = false
      else
        sleep(@alarm_time - Time.now)
      end
    end
  end
end
@wake_me_up = WakeMeUp.new Time.new 2013, 03, 15, 6
@wake_me_up.check_time
