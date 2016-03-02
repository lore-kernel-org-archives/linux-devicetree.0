From: Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>
Subject: Re: [PATCH 3/3] ARM: dts: NSP: Add PWM Support to DT
Date: Wed, 2 Mar 2016 20:22:01 +0530
Message-ID: <CAL2FKYkoXFm_pG6inxJqwkRqEK-TsMT2ndy4fgvQG1wT6AZ03Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-pwm-owner@vger.kernel.org>
Sender: linux-pwm-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 2, 2016 at 1:55 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Tuesday 01 March 2016 12:42:49 Yendapally Reddy Dhananjaya Reddy wrote:
>>                 };
>>
>> +               pwm: pwm@31000 {
>> +                       compatible = "brcm,iproc-pwm";
>> +                       reg = <0x31000 0x28>;
>> +                       clocks = <&osc>;
>> +                       #pwm-cells = >;
>> +                       status = "disabled";
>> +               };
>>
>
> Should this also list "brcm,kona-pwm" as compatible? From patch
> 1, it sounds like that was the original one.

Arnd,

The NSP is a iProc based SoC and the pwm controller register offsets are
slightly differ with the kona pwm controller. The compatible will be either
"brcm,kona-pwm" or "brcm,iproc-pwm".

>
>         Arnd

Regards
Dhananjay
