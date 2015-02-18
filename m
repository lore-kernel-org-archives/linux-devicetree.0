From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH] mfd: devicetree: bindings: Add Qualcomm RPM regulator
 subnodes
Date: Wed, 18 Feb 2015 12:28:52 -0800
Message-ID: <54E4F604.9090800@codeaurora.org>
References: <1422582666-32653-1-git-send-email-bjorn.andersson@sonymobile.com>	<20150213221332.GA19975@qualcomm.com>	<CAJAp7OjwuOdD=DynygFWnPH6tEVyf_dzOHQbUV_CHjS7OXihdg@mail.gmail.com>	<54E3FE80.2090202@codeaurora.org> <CAJAp7OiheEhCPQEid7Mo1+A08i-t3q5xzpGZhoQW4s0Txa7Xkw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJAp7OiheEhCPQEid7Mo1+A08i-t3q5xzpGZhoQW4s0Txa7Xkw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn@kryo.se>
Cc: Andy Gross <agross@codeaurora.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@linaro.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 02/18/15 10:37, Bjorn Andersson wrote:
> On Tue, Feb 17, 2015 at 6:52 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:
>> The main benefit I can think of is we cut down on runtime memory bloat.
>>
>> (gdb) p sizeof(struct platform_device)
>> $1 = 624
>>
>> Multiply that by 20 regulators and you get 624 * 20 = 12480 bytes in
>> platform devices. If we had one platform_device for all RPM controlled
>> regulators that would reduce this number from ~12k to ~0.5K. It would
>> require of_regulator_match() and the (undesirable) lists of regulator
>> names for all the different pmic variants, or we would need to pick out
>> the regulator nodes based on compatible matching. Is that so bad? In the
>> other cases we were putting lots of data in the driver purely for
>> debugging, whereas in this case we're doing it to find nodes that we
>> need to hook up with regulators in software and any associated data for
>> that regulator.
>>
> That is indeed a bunch of memory.
>
> I think that if we instantiate the rpm-regulator driver by name from
> the mfd driver and then loop over all the children and match against
> our compatible list we would come down to 1 platform driver that
> instantiate all our regulators. It's going to require some surgery and
> will make the regulator driver less simple, but can be done.

MFD name matching isn't required. All we need to do is have a regulators
node and put a compatible = "qcom,rpm-msmXXXX-regulators" in there. Then
of_platform_populate() does most of the work and we rework the RPM
driver to match on this compatible. Thus the regulator stuff is
encapsulated in the drivers/regulator/ directory.

>
> With this we can go for the proposed binding and later alter the
> implementation to save the memory. The cost of not encapsulating the
> regulators/clocks/msm_busses are the extra loops in above search. The
> benefit is cleaner bindings (and something that works as of today).
>
>
> With the alternative of using the existing infrastructure of matching
> regulators by name we need to change the binding to require certain
> naming as well as maintain lists of the resources within the
> regulator, clock & msm_bus drivers - something that has been objected
> to several times already.

For clocks I don't plan on us putting anything besides #clock-cells=<1>
in DT. To mimic the regulators we can have a clock-controller node that
has compatible = "qcom,rpm-msmXXXX-clocks" so that we don't have to do
anything in the mfd driver itself and just fork the control over to a
driver in drivers/clk/qcom.

e.g.

rpm@108000 {
        compatible = "qcom,rpm-msm8960";
        reg = <0x108000 0x1000>;
        qcom,ipc = <&apcs 0x8 2>;

        interrupts = <0 19 0>, <0 21 0>, <0 22 0>;
        interrupt-names = "ack", "err", "wakeup";

	regulators {
		compatible = "qcom,rpm-msm8960-regulators";
		
		s1: s1 {
			regulator-min-microvolt = <1225000>;
			regulator-max-microvolt = <1225000>;
			bias-pull-down;
			qcom,switch-mode-frequency = <3200000>;
		};
		...
	};

	rpmcc: clock-controller (or clocks?) {
		compatible = "qcom,rpm-msm8960-clocks";
		#clock-cells = <1>;
	};
};

This is probably missing a size-cells somewhere, but you get the idea. I
intentionally named the node "s1" in the hopes of the compiler
consolidating the multiple "s1" strings for all the different pmic match
tables into one string in some literal pool somewhere. Also, I removed
reg from the regulator nodes to stay flexible in case we want to change
the rpm write API in the future (it would go into the match table as
driver data).

(Goes to look at the RPM write API...)

BTW, some of those rpm tables are going to be huge when you consider
that the flat number space of QCOM_RPM_<RESOURCE> is monotonically
increasing but the actual resources used by a particular PMIC is only a
subset of that space. For example, some arrays might only have resources
that start at 100, so the first 100 entries in the array are wasted
space. Maybe the rpm write API shouldn't be doing this fake resource
numbering thing. Instead it should rely on the client drivers to pack up
a structure that the write API can interpret, i.e. push the resource
tables out to the drivers.

>
>
> A drawback of both these solutions is that supplies are specified on
> the device's of_node, and hence it is no longer possible to describe
> the supply dependency between our regulators - something that have
> shown to be needed. Maybe we can open code the supply logic in the
> regulator driver or we have to convince Mark about the necessity of
> this.

The supply dependencies are a detail of the PMIC implementation and it
isn't configurable on a board-by-board basis. If we did the individual
nodes and had the container regulators "device" we could specify the
dependencies in C and then vin-supply is not necessary. That sounds like
a win to me because we sidestep adding a new property.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
