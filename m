From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] ARM: dts: imx51-zii-rdu1: add rave-sp subdevices
Date: Tue, 12 Jun 2018 10:46:28 -0300
Message-ID: <CAOMZO5AHbPOS_3ShrMAoiXMxRWR6M16khDZM_9V4mRxM2MbnGQ@mail.gmail.com>
References: <20180517191923.16212-1-nikita.yoush@cogentembedded.com> <20180611052608.GB16091@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180611052608.GB16091@dragon>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Lucas Stach <l.stach@pengutronix.de>, Chris Healy <cphealy@gmail.com>, Andrey Smirnov <andrew.smirnov@gmail.com>, Marco Franchi <marcofrk@gmail.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Shawn,

On Mon, Jun 11, 2018 at 2:26 AM, Shawn Guo <shawnguo@kernel.org> wrote:

>> diff --git a/arch/arm/boot/dts/imx51-zii-rdu1.dts b/arch/arm/boot/dts/imx51-zii-rdu1.dts
>> index 0c99ac04ad08..98cc107098e0 100644
>> --- a/arch/arm/boot/dts/imx51-zii-rdu1.dts
>> +++ b/arch/arm/boot/dts/imx51-zii-rdu1.dts
>> @@ -581,6 +581,14 @@
>>               watchdog {
>>                       compatible = "zii,rave-sp-watchdog";
>>               };
>> +
>> +             backlight {
>> +                     compatible = "zii,rave-sp-backlight";
>> +             };
>> +
>> +             pwrbutton {
>> +                     compatible = "zii,rave-sp-pwrbutton";
>> +             };
>
> Where are these compatibles documented?

Currently they are documented in linux-next at:

Documentation/devicetree/bindings/watchdog/zii,rave-sp-wdt.txt
Documentation/devicetree/bindings/leds/backlight/zii,rave-sp-backlight.txt
Documentation/devicetree/bindings/input/zii,rave-sp-pwrbutton.txt

They should land in 4.18-rc1.
