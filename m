From: Alex Elder <elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 RESEND 0/5] clk: bcm21664: add common clock support
Date: Fri, 25 Apr 2014 20:43:57 -0500
Message-ID: <535B0F5D.4020905@linaro.org>
References: <1398115587-32529-1-git-send-email-elder@linaro.org> <20140426000915.7224.11265@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140426000915.7224.11265@quantum>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/25/2014 07:09 PM, Mike Turquette wrote:
> Quoting Alex Elder (2014-04-21 14:26:22)
>> This is series has two parts.  The first two patches are changes
>> to the existing Broadcom Kona family clock code to prepare for the
>> addition of support for another SoC, bcm21664.
>>
>> The remaining three define the binding and code for bcm21664, and
>> replace the use of "fake" clocks in the device tree with the real
>> ones.  This ends up being a fairly straightforward definition of
>> the clocks on this SoC; the rest of the clock code is shared with
>> other SoCs that use the Kona style clock system.
> 
> Hi Alex,
> 
> I'm happy to take only the clk patches or I can take the DT stuff as
> well if it gets some Acks. Let me know how you want it handled.

If all you need is an ack from Matt or Christian I'm
sure they'll provide it.  I don't care much but if
you'll take it all I can just consider it done, so
that would be my slight preference.  The DT stuff has
been out there for way past the requisite few weeks...

Thanks Mike.

					-Alex


> Regards,
> Mike
> 
>>
>> This series depends on the following patch, which has been taken
>> into the clk-fixes tree:
>>     clk: bcm281xx: don't use unnamed structs or unions
>>     https://lkml.org/lkml/2014/4/7/322
>>
>> In addition, it depends on the version 4 of the following series,
>> just (re)posted for review:
>>     clk: bcm281xx: updates
>>     https://lkml.org/lkml/2014/4/8/485
>>
>> The patches in this series--based on the current linus/master branch
>> plus the patches mentioned above--are available here:
>>     http://git.linaro.org/git/landing-teams/working/broadcom/kernel.git
>>     Branch review/bcm21664-clock-v2
>>
>> Alex Elder (5):
>>   clk: bcm281xx: move compatible string definitions
>>   ARM: dts: revise kona clock binding document
>>   ARM: dts: define clock binding for bcm21664
>>   clk: bcm21664: use common clock framework
>>   ARM: dts: use real clocks for bcm21664
>>
>>  .../devicetree/bindings/clock/bcm-kona-clock.txt   | 116 ++++++---
>>  arch/arm/boot/dts/bcm21664.dtsi                    | 190 +++++++++-----
>>  drivers/clk/bcm/Kconfig                            |   2 +-
>>  drivers/clk/bcm/Makefile                           |   1 +
>>  drivers/clk/bcm/clk-bcm21664.c                     | 290 +++++++++++++++++++++
>>  drivers/clk/bcm/clk-bcm281xx.c                     |  12 -
>>  include/dt-bindings/clock/bcm21664.h               |  62 +++++
>>  include/dt-bindings/clock/bcm281xx.h               |  12 +
>>  8 files changed, 565 insertions(+), 120 deletions(-)
>>  create mode 100644 drivers/clk/bcm/clk-bcm21664.c
>>  create mode 100644 include/dt-bindings/clock/bcm21664.h
>>
>> -- 
>> 1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
