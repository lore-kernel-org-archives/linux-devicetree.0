From: "Andrew F. Davis" <afd@ti.com>
Subject: Re: [PATCH v4 4/5] regulator: tps65912: Add regulator driver for the
 TPS65912 PMIC
Date: Fri, 23 Oct 2015 19:11:56 -0500
Message-ID: <562ACCCC.503@ti.com>
References: <1443731874-21362-1-git-send-email-afd@ti.com>
 <1443731874-21362-5-git-send-email-afd@ti.com>
 <20151022164724.GZ8232@sirena.org.uk> <562A2C2F.1020808@ti.com>
 <20151023231822.GQ29919@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151023231822.GQ29919@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 10/23/2015 06:18 PM, Mark Brown wrote:
> On Fri, Oct 23, 2015 at 07:46:39AM -0500, Andrew F. Davis wrote:
>
>> I know just because other drivers do it doesn't mean it's a good idea,
>> but this is not new for MFDs and it is done in other regulators as well
>> (mt6397, tps659038, qcom,spmi, etc..).
>
> mt6397 doesn't do this, it doesn't have a compatible string at all (it's
> doing what I'm recommending that you do).  The SPMI devices are
> standalone devices, their parent device is actually functioning as a bus
> controller here (it's really a microcontroller inside the SoC).  The
> Palmas is part of how we realised this was a problem.
>

mt6397: Documentation/devicetree/bindings/mfd/mt6397.txt
Doing exactly what I'm doing,

pmic {
	compatible = "mediatek,mt6397";

	codec: mt6397codec {
		compatible = "mediatek,mt6397-codec";
	};

	regulators {
		compatible = "mediatek,mt6397-regulator";

		buck_vpca15 {
			....

The Palmas is a great example of why this is a good idea, there are
so many spins on this common base, and look how we can re-use sub-nodes:

tps659038: tps659038@58 {
	compatible = "ti,tps659038";
	reg = <0x58>;
	...

	tps659038_pmic {
		compatible = "ti,tps659038-pmic";
		...
	};

	tps659038_rtc: tps659038_rtc {
		compatible = "ti,palmas-rtc";
		...
	};

	tps659038_pwr_button: tps659038_pwr_button {
		compatible = "ti,palmas-pwrbutton";
		...
	};

	tps659038_gpio: tps659038_gpio {
		compatible = "ti,palmas-gpio";
		...
	};
};

(from am57xx-beagle-x15.dts)

looks like only the "ti,tps659038-pmic" node needed re-made without
re-making the whole driver.

>>> It seems like this is describing how Linux
>>> loads drivers not how the hardware is constructed but DT should describe
>>> the hardware.
>
>> While I agree to a point, if we follow this to its logical conclusion we
>> would end up with one compatible binding per SoC and be basically back to
>> board files. We need some granularity, just finding out where is the issue,
>
> The fact that the SoC DT is not distinct from the board DT is actually
> one of the problems with the way we're using DT at the minute, it means
> that DTBs are much less stable than they should be since we can enhance
> support for SoCs but DTBs need regenerating to take advantage of it.  It
> would be much better if the boards just referenced the SoC they use and
> pulled in a separate definition of the SoC (DT overlays will make it
> much more tractable to implement that if someone has time...).
>

I figured this can already be done by keeping the SoC stuff in dtsi files?
Anyway DT seems to have a lot of use issues with how it is being used, but
I'm probably not a person with enough free time for fixing that.. :|

>> I would say that as these devices belong to different subsystems and are
>> almost completely independent there should be no problem with having their
>> own compatible matched hardware sub-node.
>
> All it's adding is more typing for users.
>

Well I have to match the sub-devices on something, it's ether the node name
or the compatible string, so they might have to get used to typing :)
