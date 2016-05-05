From: Raveendra Padasalagi <raveendra.padasalagi@broadcom.com>
Subject: Re: [PATCH v4 3/3] ARM: dts: use syscon in cygnus touchscreen dt node
Date: Thu, 5 May 2016 11:17:00 +0530
Message-ID: <CAAFb_vp+oxHc6YD24zPr0o6Pt9Jt1_LsT14VUQGBKXBpvNAj_Q@mail.gmail.com>
References: <1456556396-4759-1-git-send-email-raveendra.padasalagi@broadcom.com>
	<1456556396-4759-4-git-send-email-raveendra.padasalagi@broadcom.com>
	<20160406173140.GB38452@dtor-ws>
	<CAGVrzcbCZn6RYFwJTkffkct1DiiG+tBJnKELDn32T38_s5mjOg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <CAGVrzcbCZn6RYFwJTkffkct1DiiG+tBJnKELDn32T38_s5mjOg@mail.gmail.com>
Sender: linux-input-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Russell King <linux@arm.linux.org.uk>, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-input@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Richardson <jonathar@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Anup Patel <anup.patel@broadcom.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>
List-Id: devicetree@vger.kernel.org

Thanks Dmitry and Florian.

Hi Dmitry,

I understand the dts changes are really needed for the touch screen
driver changes made in this patch. But currently there are no deployed
systems/customer's using this driver. So please pull the driver changes
and I will follow up to make sure dts changes also goes in.

Below is the latest patch set pushed.

https://lkml.org/lkml/2016/3/24/45


Thanks ,
Raveendra

On Thu, Apr 7, 2016 at 1:55 AM, Florian Fainelli <f.fainelli@gmail.com> wrote:
> 2016-04-06 10:31 GMT-07:00 Dmitry Torokhov <dmitry.torokhov@gmail.com>:
>> On Sat, Feb 27, 2016 at 12:29:56PM +0530, Raveendra Padasalagi wrote:
>>> In Cygnus SOC touch screen controller registers are shared
>>> with ADC and flex timer. Using readl/writel could lead to
>>> race condition. So touchscreen driver is enhanced to support
>>> syscon based register access to take care of mutually exclusive
>>> access.
>>>
>>> This patch enables syscon support in touchscreen driver
>>> by adding necessary properties in touchscreen dt node and
>>> in addition to this renamed existing "tsc" touchscreen node
>>> name to "touchscreen".
>>>
>>> Signed-off-by: Raveendra Padasalagi <raveendra.padasalagi@broadcom.com>
>>> Reviewed-by: Ray Jui <ray.jui@broadcom.com>
>>> Reviewed-by: Scott Branden <scott.branden@broadcom.com>
>>
>> OK, since the new dts is really needed for the driver I'll be folding
>> this into the touchscreen driver patch unless I hear someone yelling at
>> me.
>
> Works for me:
>
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>
> --
> Florian
