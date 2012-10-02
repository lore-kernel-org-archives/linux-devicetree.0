From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH V2 0/3] Add clock framework for armada 370/XP
Date: Tue, 02 Oct 2012 09:10:13 +0200
Message-ID: <506A9355.1020101@free-electrons.com>
References: <1349125926-16144-1-git-send-email-gregory.clement@free-electrons.com>
 <20121002041736.21556.20051@nucleus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20121002041736.21556.20051@nucleus>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Ike Pan <ike.pan-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Ian Molton <ian.molton-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, David Marlin <dmarlin-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Jani Monoses <jani.monoses-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Dan Frazier <dann.frazier-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Eran Ben-Avi <benavi-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Li Li <li.li-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Leif Lindholm <leif.lindholm-5wv7dgnIgG8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chris Van Hoof <vanhoof-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Shadi Ammouri <shadi-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/02/2012 06:17 AM, Mike Turquette wrote:
> Quoting Gregory CLEMENT (2012-10-01 14:12:03)
>> Hello Mike,
>>
>> My first version didn't get many attention, so I guess it's too late
>> for 3.7! ;) I should have ping you earlier about this series. This
>> time was not lost, by using the cpu clock with SMP I found a bug and
>> fixed it. And I also improved the spelling and removed unnecessary
>> small piece of code thanks to the feed back of Andrew Lunn.
>>
> 
> My apologies for letting this one slip through the cracks.  I'm glad you
> fixed the bug though!
> 
> I'll give this a review once the -rc1 merge window is closed.

This time I will remind you as soon as -rc1 will be released ;)

I have an other patch set which will depend on this one. So I hope
this one will be merged early enough in your clk-3.8 branch.

Regards,
Gregory

> 
> Regards,
> Mike
> 
>> The purpose of this patch set is to add support for clock framework
>> for Armada 370 and Armada XP SoCs. All the support is done under the
>> directory drivers/clk/mvebu/ as the support for other mvebu SoCs was
>> in mind during the writing of the code.
>>
>> Two kinds of clocks are added:
>>
>> - The CPU clocks are only for Armada XP (which si multi-core)
>>
>> - The core clocks are clocks which have their rate fixed during
>>   reset.
>>
>> This patch set is based on the clk-3.7 branch of Mike Turquette as it
>> use the patch "clk: add of_clk_src_onecell_get() support" from Shawn
>> Guo.
>>
>> Many thanks to Thomas Petazzoni and Sebastian Hesselbarth for their
>> review and feedback. The device tree bindings were really improved
>> with the advices of Sebastian.
>>
>> Changelog:
>> V1 -> V2:
>>
>> - Improved the spelling and the wording of the documentation and the
>>   1st commit log
>> - Removed the "end_of_list" name which are unused here.
>> - Fix the cpu clock by using of_clk_src_onecell_get in the same way it
>>   was used for the core clocks
>>
>> Regards,
>>
>> Gregory CLEMENT (3):
>>   clk: mvebu: add armada-370-xp specific clocks
>>   clk: armada-370-xp: add support for clock framework
>>   clocksource: time-armada-370-xp converted to clk framework
>>
>>  .../devicetree/bindings/clock/mvebu-core-clock.txt |   40 +++
>>  .../devicetree/bindings/clock/mvebu-cpu-clock.txt  |   21 ++
>>  arch/arm/boot/dts/armada-370-db.dts                |    4 -
>>  arch/arm/boot/dts/armada-370-xp.dtsi               |    1 +
>>  arch/arm/boot/dts/armada-370.dtsi                  |   12 +
>>  arch/arm/boot/dts/armada-xp.dtsi                   |   48 +++
>>  arch/arm/mach-mvebu/Kconfig                        |    5 +
>>  arch/arm/mach-mvebu/armada-370-xp.c                |    8 +-
>>  arch/arm/mach-mvebu/common.h                       |    1 +
>>  drivers/clk/Makefile                               |    1 +
>>  drivers/clk/mvebu/Makefile                         |    2 +
>>  drivers/clk/mvebu/clk-core.c                       |  312 ++++++++++++++++++++
>>  drivers/clk/mvebu/clk-core.h                       |   19 ++
>>  drivers/clk/mvebu/clk-cpu.c                        |  155 ++++++++++
>>  drivers/clk/mvebu/clk-cpu.h                        |   19 ++
>>  drivers/clk/mvebu/clk.c                            |   36 +++
>>  drivers/clocksource/time-armada-370-xp.c           |   11 +-
>>  17 files changed, 685 insertions(+), 10 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/clock/mvebu-core-clock.txt
>>  create mode 100644 Documentation/devicetree/bindings/clock/mvebu-cpu-clock.txt
>>  create mode 100644 drivers/clk/mvebu/Makefile
>>  create mode 100644 drivers/clk/mvebu/clk-core.c
>>  create mode 100644 drivers/clk/mvebu/clk-core.h
>>  create mode 100644 drivers/clk/mvebu/clk-cpu.c
>>  create mode 100644 drivers/clk/mvebu/clk-cpu.h
>>  create mode 100644 drivers/clk/mvebu/clk.c
>>
>> -- 
>> 1.7.9.5
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 


-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
