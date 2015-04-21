From: Zhi Li <lznuaa@gmail.com>
Subject: Re: [PATCH v5 05/11] ARM: dts: add imx7d soc dtsi file
Date: Tue, 21 Apr 2015 14:34:45 -0500
Message-ID: <CAHrpEqRqUJ2h2dXiwR3rcugWvszKwt10axy8jGsAJAH6Quafbg@mail.gmail.com>
References: <1429628007-8892-1-git-send-email-Frank.Li@freescale.com>
	<1429628007-8892-6-git-send-email-Frank.Li@freescale.com>
	<20150421172834.GF10164@leverpostej>
	<CAHrpEqTCMgaAx_bUG1JEtS-2_DrkwM_EbWphu_j=6YZuebcoSw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CAHrpEqTCMgaAx_bUG1JEtS-2_DrkwM_EbWphu_j=6YZuebcoSw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: "Frank.Li@freescale.com" <Frank.Li@freescale.com>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Anson Huang <b20788@freescale.com>
List-Id: devicetree@vger.kernel.org

>>> +
>>> +       clocks {
>>> +               #address-cells = <1>;
>>> +               #size-cells = <0>;
>>> +
>>> +               ckil: clock@0 {
>>> +                       compatible = "fixed-clock";
>>> +                       reg = <0>;
>>> +                       #clock-cells = <0>;
>>> +                       clock-frequency = <32768>;
>>> +                       clock-output-names = "ckil";
>>> +               };
>>> +
>>> +               osc: clock@1 {
>>> +                       compatible = "fixed-clock";
>>> +                       reg = <1>;
>>> +                       #clock-cells = <0>;
>>> +                       clock-frequency = <24000000>;
>>> +                       clock-output-names = "osc";
>>> +               };
>>> +
>>> +       };
>>
>> Get rid of the clocks container node, and put these under the root.
>
> Okay.

After remove clocks node.
There will be warning

Warning (reg_format): "reg" property in /clock@0 has invalid length (4
bytes) (#address-cells == 1, #size-cells == 1)
Warning (reg_format): "reg" property in /clock@1 has invalid length (4
bytes) (#address-cells == 1, #size-cells == 1)

best regards
Frank Li
>
>>
