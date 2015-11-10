From: "Andrew F. Davis" <afd@ti.com>
Subject: Re: [PATCH v4 4/5] regulator: tps65912: Add regulator driver for the
 TPS65912 PMIC
Date: Tue, 10 Nov 2015 11:52:12 -0600
Message-ID: <56422ECC.6070603@ti.com>
References: <20151022164724.GZ8232@sirena.org.uk> <563A25BE.90609@ti.com>
 <20151105101417.GM1717@sirena.org.uk> <563B9A10.4020907@ti.com>
 <20151106104322.GA18409@sirena.org.uk> <563CED25.6020405@ti.com>
 <20151106211651.GJ18409@sirena.org.uk> <5640DAC0.9080008@ti.com>
 <20151110095719.GC12392@sirena.org.uk> <56421FA5.1020103@ti.com>
 <20151110170447.GI12392@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151110170447.GI12392@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 11/10/2015 11:04 AM, Mark Brown wrote:
> On Tue, Nov 10, 2015 at 10:47:33AM -0600, Andrew F. Davis wrote:
>> On 11/10/2015 03:57 AM, Mark Brown wrote:
>
>>> Of course this is a negative review of the binding!  What on earth did
>>> you think my feedback meant?  The driver and the binding go together.
>
>> The bindings should be driver/platform/OS agnostic, changing the bindings
>> because the Linux regulator subsystem maintainer doesn't like them
>> in regulator drivers is then not correct.
>
>> If the binding is accepted then the regulator driver will just have
>> to deal with it, so as I said, why not nack the bindings patch, and
>> explain your objection where DT maintainers might see it.
>
> If I'm not going to merge the driver because of issues in the DT code it
> is vanishingly unlikely that I'm going to merge the regulator bindings
> either.  I would have thought it should be clear that my review comments
> cover both the manifestation of the bindings in the driver and the
> bindings themselves.
>

Kind of an interesting situation, if I didn't have the regulator as a separate
node like you want, then I wouldn't really need a separate regulator binding Doc,
for you to merge, it could all be merged as a single MFD binding.

Anyway, All I'm trying to do here is keep things clean in the DT. We only have
one consistent option:

Match all sub parts by compatible:

tps65912: tps65912@2d {
	compatible = "ti,tps65912";
	reg = <0x58>;
	interrupts ...

	regulator {
		compatible = "ti,tps65912-regulator";
		dcdc1 {
			regulator-name = "vdd_core";
			regulator-min-microvolt = <912000>;
			regulator-max-microvolt = <1144000>;
		};
		...
	};

	pwrbutton {
		compatible = "ti,palmas-pwrbutton";
		interrupt-parent = <&tps65912>;
		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
		wakeup-source;
		ti,palmas-long-press-seconds = <12>;
	};

	gpio {
		compatible = "ti,palmas-gpio";
		gpio-controller;
		#gpio-cells = <2>;
	};
	...
};

Or we end up with some hybrid approach, matching some on node name, others
on compatible when needed. Yes, the above matches Linux device model (still
not sure why that is such a problem?), but it also matches modular functionality
in the device.
