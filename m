From: Bjorn Andersson <bjorn@kryo.se>
Subject: Re: [PATCH] mfd: devicetree: bindings: Add Qualcomm RPM regulator subnodes
Date: Wed, 18 Feb 2015 13:08:00 -0800
Message-ID: <CAJAp7OhwHQnYnd65Lzirk7jQ67+m-+MFVs3ktvPfiH0fs_qLYA@mail.gmail.com>
References: <1422582666-32653-1-git-send-email-bjorn.andersson@sonymobile.com>
	<20150213221332.GA19975@qualcomm.com>
	<CAJAp7OjwuOdD=DynygFWnPH6tEVyf_dzOHQbUV_CHjS7OXihdg@mail.gmail.com>
	<54E3FE80.2090202@codeaurora.org>
	<CAJAp7OiheEhCPQEid7Mo1+A08i-t3q5xzpGZhoQW4s0Txa7Xkw@mail.gmail.com>
	<54E4F604.9090800@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54E4F604.9090800@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Andy Gross <agross@codeaurora.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@linaro.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 18, 2015 at 12:28 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 02/18/15 10:37, Bjorn Andersson wrote:
>> On Tue, Feb 17, 2015 at 6:52 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:
>>> The main benefit I can think of is we cut down on runtime memory bloat.
>>>
>>> (gdb) p sizeof(struct platform_device)
>>> $1 = 624
>>>
>>> Multiply that by 20 regulators and you get 624 * 20 = 12480 bytes in
>>> platform devices. If we had one platform_device for all RPM controlled
>>> regulators that would reduce this number from ~12k to ~0.5K. It would
>>> require of_regulator_match() and the (undesirable) lists of regulator
>>> names for all the different pmic variants, or we would need to pick out
>>> the regulator nodes based on compatible matching. Is that so bad? In the
>>> other cases we were putting lots of data in the driver purely for
>>> debugging, whereas in this case we're doing it to find nodes that we
>>> need to hook up with regulators in software and any associated data for
>>> that regulator.
>>>
>> That is indeed a bunch of memory.
>>
>> I think that if we instantiate the rpm-regulator driver by name from
>> the mfd driver and then loop over all the children and match against
>> our compatible list we would come down to 1 platform driver that
>> instantiate all our regulators. It's going to require some surgery and
>> will make the regulator driver less simple, but can be done.
>
> MFD name matching isn't required. All we need to do is have a regulators
> node and put a compatible = "qcom,rpm-msmXXXX-regulators" in there. Then
> of_platform_populate() does most of the work and we rework the RPM
> driver to match on this compatible. Thus the regulator stuff is
> encapsulated in the drivers/regulator/ directory.
>

Right, this would only affect the mfd children...

>>
>> With this we can go for the proposed binding and later alter the
>> implementation to save the memory. The cost of not encapsulating the
>> regulators/clocks/msm_busses are the extra loops in above search. The
>> benefit is cleaner bindings (and something that works as of today).
>>
>>
>> With the alternative of using the existing infrastructure of matching
>> regulators by name we need to change the binding to require certain
>> naming as well as maintain lists of the resources within the
>> regulator, clock & msm_bus drivers - something that has been objected
>> to several times already.
>
> For clocks I don't plan on us putting anything besides #clock-cells=<1>
> in DT. To mimic the regulators we can have a clock-controller node that
> has compatible = "qcom,rpm-msmXXXX-clocks" so that we don't have to do
> anything in the mfd driver itself and just fork the control over to a
> driver in drivers/clk/qcom.

That's fine and I'm glad you're looking into it as I don't have
documentation for those.

>
> e.g.
>
> rpm@108000 {
>         compatible = "qcom,rpm-msm8960";
>         reg = <0x108000 0x1000>;
>         qcom,ipc = <&apcs 0x8 2>;
>
>         interrupts = <0 19 0>, <0 21 0>, <0 22 0>;
>         interrupt-names = "ack", "err", "wakeup";
>
>         regulators {
>                 compatible = "qcom,rpm-msm8960-regulators";
>
>                 s1: s1 {
>                         regulator-min-microvolt = <1225000>;
>                         regulator-max-microvolt = <1225000>;
>                         bias-pull-down;
>                         qcom,switch-mode-frequency = <3200000>;
>                 };

This means that the regulator driver needs to have a list of
regulators per platform supported.

If we keep the compatible in the regulator nodes, we can use that for
matching with an implementation - still without using the
platform_device model for instantiating them. We would not need said
list in that case.

>                 ...
>         };
>
>         rpmcc: clock-controller (or clocks?) {
>                 compatible = "qcom,rpm-msm8960-clocks";
>                 #clock-cells = <1>;
>         };
> };
>
> This is probably missing a size-cells somewhere, but you get the idea. I
> intentionally named the node "s1" in the hopes of the compiler
> consolidating the multiple "s1" strings for all the different pmic match
> tables into one string in some literal pool somewhere. Also, I removed
> reg from the regulator nodes to stay flexible in case we want to change
> the rpm write API in the future (it would go into the match table as
> driver data).

If we fall back to define the regulators in the code and map the
property nodes by name, then we can just add the content of the reg
property in those tables as well.

>
> (Goes to look at the RPM write API...)
>
> BTW, some of those rpm tables are going to be huge when you consider
> that the flat number space of QCOM_RPM_<RESOURCE> is monotonically
> increasing but the actual resources used by a particular PMIC is only a
> subset of that space. For example, some arrays might only have resources
> that start at 100, so the first 100 entries in the array are wasted
> space. Maybe the rpm write API shouldn't be doing this fake resource
> numbering thing. Instead it should rely on the client drivers to pack up
> a structure that the write API can interpret, i.e. push the resource
> tables out to the drivers.
>

Correct, but David Collins comment on the subject was clear; we don't
want these tables in the code. And after playing around with various
options I came to the same conclusion - maintaining the tables will be
a mess.

So for family B, where this is not necessary for the rpm driver, I
have revised this to instead be:

#address-cells = <2>;
smps1 {
   reg = <QCOM_SMD_RPM_SMPA 1>;
}

With #define QCOM_SMD_RPM_SMPA 0x61706d73, this information goes
straight into the smd packet and we don't have any tables at all.


Josh made an attempt to encode the data needed for family A in the DT
in a similar fasion, but we never found a reasonable way to do so.

>>
>>
>> A drawback of both these solutions is that supplies are specified on
>> the device's of_node, and hence it is no longer possible to describe
>> the supply dependency between our regulators - something that have
>> shown to be needed. Maybe we can open code the supply logic in the
>> regulator driver or we have to convince Mark about the necessity of
>> this.
>
> The supply dependencies are a detail of the PMIC implementation and it
> isn't configurable on a board-by-board basis. If we did the individual
> nodes and had the container regulators "device" we could specify the
> dependencies in C and then vin-supply is not necessary. That sounds like
> a win to me because we sidestep adding a new property.
>

Correct, it's not configurable on a board basis, but if I read the
pmic documentation correctly it's handled by external routing, hence
is not entirely static per pmic?

Non the less, we must provide this information to the regulator
framework in some way if we want its help.
If we define all regulators in code (and just bring their properties
from DT) then we could encapsulate the relationship there as well.
But with the current suggested solution of having all this data coming
from DT I simply rely on the existing infrastructure for describing
supply-dependencies in DT.

Regards,
Bjorn
