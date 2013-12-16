From: Alex Elder <alex.elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/3] clk: bcm281xx: add initial clock framework support
Date: Sun, 15 Dec 2013 18:22:20 -0600
Message-ID: <E566434B-F630-4AD3-91EC-BD5599767F2E@linaro.org>
References: <529F4B0F.2020801@linaro.org> <529F4B4F.4020405@linaro.org> <20131214235731.26321.53050@quantum> <52ADE93B.3070907@linaro.org>
Mime-Version: 1.0 (1.0)
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52ADE93B.3070907-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Tim Kryger <tim.kryger-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org" <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

I think I can prepare a series that puts my changes
before Tim's. Unless I have trouble doing that
I will send that out in a few hours.

                                        -Alex

> On Dec 15, 2013, at 11:39 AM, Alex Elder <alex.elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> 
>> On 12/14/2013 05:57 PM, Mike Turquette wrote:
>> Quoting Alex Elder (2013-12-04 07:33:35)
>>> +       return true;
>>> +}
>>> +
>>> +/* A bit position must be less than the number of bits in a 32-bit
>>> register. */
>> 
>> Hi Alex,
>> 
>> The patch is corrupt at line 634 and several other places below.  Did
>> you edit it manually? I'm happy with the series after reviewing it but
>> it cannot be applied. Can you fix the issue and send me a pull request?
>> 
>> Thanks,
>> Mike
> 
> First, yes I sent it manually (copy from the git-generated patch
> and paste into a mail message, and I'm sorry about that.  I have
> yet to set up my Linaro settings for "git-send-email" and I'll
> do that this week.
> 
> I have a v3 that has been updated to apply to v3.13-rc3 (there
> is no -rc4 yet).
> 
> I'm not sure how this works with the series of 8 patches from Tim
> Kryger that it depends on.  But here is a pull request for the
> version (including the prerequisites) based on 3.13-rc3.  (It is
> done manually again, so there are some line wraps...)
> 
> Thanks a lot for the review Mike.  I know you're a busy guy.
> 
>                    -Alex
> 
> The following changes since commit 374b105797c3d4f29c685f3be535c35f5689b30e:
> 
>  Linux 3.13-rc3 (2013-12-06 09:34:04 -0800)
> 
> are available in the git repository at:
> 
>  ssh://git-NTCfGDAuFurHbOjZJNBcug@public.gmane.org/people/alex.elder/linux.git
> review/bcm-kona-clocks-v3
> 
> for you to fetch changes up to cf62c29babf6068abf91588411704566812b7900:
> 
>  ARM: dts: bcm281xx: define real clocks (2013-12-13 10:40:21 -0600)
> 
> ----------------------------------------------------------------
> Alex Elder (3):
>      clk: bcm281xx: define kona clock binding
>      clk: bcm281xx: add initial clock framework support
>      ARM: dts: bcm281xx: define real clocks
> 
> Tim Kryger (8):
>      ARM: dts: Declare clocks as fixed on bcm11351
>      ARM: dts: Specify clocks for UARTs on bcm11351
>      Documentation: dt: kona-sdhci: Add clocks property
>      ARM: dts: Specify clocks for SDHCIs on bcm11351
>      mmc: sdhci-bcm-kona: Add basic use of clocks
>      Documentation: dt: kona-timer: Add clocks property
>      clocksource: kona: Add basic use of external clock
>      ARM: dts: Specify clocks for timer on bcm11351
> 
> .../devicetree/bindings/arm/bcm/kona-timer.txt     |    7 +-
> .../devicetree/bindings/clock/bcm-kona-clock.txt   |   93 ++
> .../devicetree/bindings/mmc/kona-sdhci.txt         |    4 +
> arch/arm/boot/dts/bcm11351.dtsi                    |  199 +++-
> drivers/clk/Kconfig                                |    1 +
> drivers/clk/Makefile                               |    1 +
> drivers/clk/bcm/Kconfig                            |    8 +
> drivers/clk/bcm/Makefile                           |    3 +
> drivers/clk/bcm/clk-bcm281xx.c                     |  416 ++++++++
> drivers/clk/bcm/clk-kona-setup.c                   |  769 +++++++++++++++
> drivers/clk/bcm/clk-kona.c                         | 1033
> ++++++++++++++++++++
> drivers/clk/bcm/clk-kona.h                         |  414 ++++++++
> drivers/clocksource/bcm_kona_timer.c               |   14 +-
> drivers/mmc/host/sdhci-bcm-kona.c                  |   37 +-
> include/dt-bindings/clock/bcm281xx.h               |   65 ++
> 15 files changed, 3053 insertions(+), 11 deletions(-)
> create mode 100644
> Documentation/devicetree/bindings/clock/bcm-kona-clock.txt
> create mode 100644 drivers/clk/bcm/Kconfig
> create mode 100644 drivers/clk/bcm/Makefile
> create mode 100644 drivers/clk/bcm/clk-bcm281xx.c
> create mode 100644 drivers/clk/bcm/clk-kona-setup.c
> create mode 100644 drivers/clk/bcm/clk-kona.c
> create mode 100644 drivers/clk/bcm/clk-kona.h
> create mode 100644 include/dt-bindings/clock/bcm281xx.h
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
