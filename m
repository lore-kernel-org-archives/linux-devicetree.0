From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH] mfd: devicetree: bindings: Add Qualcomm RPM regulator
 subnodes
Date: Wed, 18 Feb 2015 18:29:09 -0800
Message-ID: <54E54A75.5030200@codeaurora.org>
References: <1422582666-32653-1-git-send-email-bjorn.andersson@sonymobile.com>	<20150213221332.GA19975@qualcomm.com>	<CAJAp7OjwuOdD=DynygFWnPH6tEVyf_dzOHQbUV_CHjS7OXihdg@mail.gmail.com>	<54E3FE80.2090202@codeaurora.org>	<CAJAp7OiheEhCPQEid7Mo1+A08i-t3q5xzpGZhoQW4s0Txa7Xkw@mail.gmail.com>	<54E4F604.9090800@codeaurora.org> <CAJAp7OhwHQnYnd65Lzirk7jQ67+m-+MFVs3ktvPfiH0fs_qLYA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJAp7OhwHQnYnd65Lzirk7jQ67+m-+MFVs3ktvPfiH0fs_qLYA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn@kryo.se>
Cc: Andy Gross <agross@codeaurora.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@linaro.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 02/18/15 13:08, Bjorn Andersson wrote:
> On Wed, Feb 18, 2015 at 12:28 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:
>>
>> MFD name matching isn't required. All we need to do is have a regulators
>> node and put a compatible = "qcom,rpm-msmXXXX-regulators" in there. Then
>> of_platform_populate() does most of the work and we rework the RPM
>> driver to match on this compatible. Thus the regulator stuff is
>> encapsulated in the drivers/regulator/ directory.
>>
> Right, this would only affect the mfd children...
>
>
>> e.g.
>>
>> rpm@108000 {
>>         compatible = "qcom,rpm-msm8960";
>>         reg = <0x108000 0x1000>;
>>         qcom,ipc = <&apcs 0x8 2>;
>>
>>         interrupts = <0 19 0>, <0 21 0>, <0 22 0>;
>>         interrupt-names = "ack", "err", "wakeup";
>>
>>         regulators {
>>                 compatible = "qcom,rpm-msm8960-regulators";
>>
>>                 s1: s1 {
>>                         regulator-min-microvolt = <1225000>;
>>                         regulator-max-microvolt = <1225000>;
>>                         bias-pull-down;
>>                         qcom,switch-mode-frequency = <3200000>;
>>                 };
> This means that the regulator driver needs to have a list of
> regulators per platform supported.
>
> If we keep the compatible in the regulator nodes, we can use that for
> matching with an implementation - still without using the
> platform_device model for instantiating them. We would not need said
> list in that case.

Agreed. It was intentional because the type of regulator is another
static implementation detail.

>
>>                 ...
>>         };
>>
>>         rpmcc: clock-controller (or clocks?) {
>>                 compatible = "qcom,rpm-msm8960-clocks";
>>                 #clock-cells = <1>;
>>         };
>> };
>>
>> This is probably missing a size-cells somewhere, but you get the idea. I
>> intentionally named the node "s1" in the hopes of the compiler
>> consolidating the multiple "s1" strings for all the different pmic match
>> tables into one string in some literal pool somewhere. Also, I removed
>> reg from the regulator nodes to stay flexible in case we want to change
>> the rpm write API in the future (it would go into the match table as
>> driver data).
> If we fall back to define the regulators in the code and map the
> property nodes by name, then we can just add the content of the reg
> property in those tables as well.

Yep.

>
>> (Goes to look at the RPM write API...)
>>
>> BTW, some of those rpm tables are going to be huge when you consider
>> that the flat number space of QCOM_RPM_<RESOURCE> is monotonically
>> increasing but the actual resources used by a particular PMIC is only a
>> subset of that space. For example, some arrays might only have resources
>> that start at 100, so the first 100 entries in the array are wasted
>> space. Maybe the rpm write API shouldn't be doing this fake resource
>> numbering thing. Instead it should rely on the client drivers to pack up
>> a structure that the write API can interpret, i.e. push the resource
>> tables out to the drivers.
>>
> Correct, but David Collins comment on the subject was clear; we don't
> want these tables in the code. And after playing around with various
> options I came to the same conclusion - maintaining the tables will be
> a mess.

We're already maintaining these tables in qcom-rpm.c. I'm advocating for
removing those tables from the rpm driver and putting the data into the
regulator driver. Then we don't have to index into a sparse table to
figure out what values the RPM wants to use. Instead we have the data at
hand for a particular regulator based on the of_regulator_match.

I don't understand the maintenance argument either. The data has to go
somewhere so the maintenance is always there.

>From what I can tell, that data is split in two places. The regulator
type knows how big the data we want to send is (1 or 2) and that is
checked in the RPM driver to make sure that the two agree (this part
looks like over-defensive coding). Then the DT has a made up number that
maps to 3 different numbers in the RPM driver. The same could be done
for b-family, where we have two numbers that just so happen to be user
friendly enough to make sense on their own. Instead of being 165, 68,
and 48, they're a #define SMPS and 1. We could make a #define SMPS1 and
map it to a tuple with #define SMPS and 1. It looks like that was how
you had b-family prototyped at one point.

>
> So for family B, where this is not necessary for the rpm driver, I
> have revised this to instead be:
>
> #address-cells = <2>;
> smps1 {
>    reg = <QCOM_SMD_RPM_SMPA 1>;
> }
>
> With #define QCOM_SMD_RPM_SMPA 0x61706d73, this information goes
> straight into the smd packet and we don't have any tables at all.

How does the rpm write API look there? Does it take two numbers
(resource type and resource id) instead of 1 (enum)? Is the plan to keep
the write API the same as what's in qcom-rpm.c today?

>
>
> Josh made an attempt to encode the data needed for family A in the DT
> in a similar fasion, but we never found a reasonable way to do so.

With Josh's attempt would this be?

#address-cells = <3>;
smps1 {
    reg = <165 68 48>;
};

What's different here from b-family besides another number? If the
b-family way is reasonable I'm lost how this is not reasonable. Honestly
it doesn't make much sense to me to have the reg property done like this
if the value is always the same. If the RPM was moving these offsets
around within the same compatible string it would make sense to put that
in DT and figure out dynamically what the offsets are because they
really can be different. But given that the values are always the same
for a given compatible it just means that the reg properties have to be
a certain value as long as the compatible is qcom,rpm-msmXXXX-regulators.

>
>>>
>>> A drawback of both these solutions is that supplies are specified on
>>> the device's of_node, and hence it is no longer possible to describe
>>> the supply dependency between our regulators - something that have
>>> shown to be needed. Maybe we can open code the supply logic in the
>>> regulator driver or we have to convince Mark about the necessity of
>>> this.
>> The supply dependencies are a detail of the PMIC implementation and it
>> isn't configurable on a board-by-board basis. If we did the individual
>> nodes and had the container regulators "device" we could specify the
>> dependencies in C and then vin-supply is not necessary. That sounds like
>> a win to me because we sidestep adding a new property.
>>
> Correct, it's not configurable on a board basis, but if I read the
> pmic documentation correctly it's handled by external routing, hence
> is not entirely static per pmic?

Hmm, yes you're right. It's not entirely static, in the sense that some
supplies could be configured differently when the pmic is the same.

>
> Non the less, we must provide this information to the regulator
> framework in some way if we want its help.
> If we define all regulators in code (and just bring their properties
> from DT) then we could encapsulate the relationship there as well.
> But with the current suggested solution of having all this data coming
> from DT I simply rely on the existing infrastructure for describing
> supply-dependencies in DT.
>
>

Yes I don't see how putting the data in C or in DT or having a
regulators encapsulating node makes it impossible to specify the supply.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
