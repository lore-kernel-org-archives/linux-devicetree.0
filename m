From: Bjorn Andersson <bjorn@kryo.se>
Subject: Re: [PATCH] mfd: devicetree: bindings: Add Qualcomm RPM regulator subnodes
Date: Wed, 18 Feb 2015 10:37:44 -0800
Message-ID: <CAJAp7OiheEhCPQEid7Mo1+A08i-t3q5xzpGZhoQW4s0Txa7Xkw@mail.gmail.com>
References: <1422582666-32653-1-git-send-email-bjorn.andersson@sonymobile.com>
	<20150213221332.GA19975@qualcomm.com>
	<CAJAp7OjwuOdD=DynygFWnPH6tEVyf_dzOHQbUV_CHjS7OXihdg@mail.gmail.com>
	<54E3FE80.2090202@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54E3FE80.2090202@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Andy Gross <agross@codeaurora.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@linaro.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 17, 2015 at 6:52 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 02/17/15 13:48, Bjorn Andersson wrote:
>> On Fri, Feb 13, 2015 at 2:13 PM, Andy Gross <agross@codeaurora.org> wrote:
>>> On Thu, Jan 29, 2015 at 05:51:06PM -0800, Bjorn Andersson wrote:
>>>> Add the regulator subnodes to the Qualcomm RPM MFD device tree bindings.
>>>>
>>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
>>>> ---
>>>>       #include <dt-bindings/mfd/qcom-rpm.h>
>>>> @@ -66,5 +237,18 @@ frequencies.
>>>>
>>>>               #address-cells = <1>;
>>>>               #size-cells = <0>;
>>>> +
>>>> +             pm8921_smps1: pm8921-smps1 {
>>>> +                     compatible = "qcom,rpm-pm8921-smps";
>>>> +                     reg = <QCOM_RPM_PM8921_SMPS1>;
>>>> +
>>>> +                     regulator-min-microvolt = <1225000>;
>>>> +                     regulator-max-microvolt = <1225000>;
>>>> +                     regulator-always-on;
>>>> +
>>>> +                     bias-pull-down;
>>>> +
>>>> +                     qcom,switch-mode-frequency = <3200000>;
>>>> +             };
>>>>       };
>>> My only comment here is that most (all but one) of the other mfd regulator
>>> devices use regulators {}.  Still wonder if that's what we should do.
>>>
>> Looking at the existing mfds they all have a list in the code of the
>> regulators supported on a certain mfd. Through the use of
>> regulator_desc.{of_match,regulators_node} these regulators are
>> populated with properties from of_nodes matched by name (of_match)
>> under the specified node (regulators_node).
>> But as we've discussed in other cases it's not desirable to maintain
>> these lists for the various variants of Qualcomm platforms, so I did
>> choose to go with "standalone" platform devices - with matching
>> through compatible and all.
>>
>> But that's all implementation, looking at the binding itself a
>> regulator {} (clocks{} and msm_bus{}) would serve as a sort of
>> grouping of children based on type. Except for the implications this
>> has on the implementation I don't see much benefit of this (and in our
>> case the implementation would suffer from the extra grouping).
>>
>>
>> Let me know what you think, I based these ideas on just reading the
>> existing code and bindings, and might very well have missed something.
>>
>
> The main benefit I can think of is we cut down on runtime memory bloat.
>
> (gdb) p sizeof(struct platform_device)
> $1 = 624
>
> Multiply that by 20 regulators and you get 624 * 20 = 12480 bytes in
> platform devices. If we had one platform_device for all RPM controlled
> regulators that would reduce this number from ~12k to ~0.5K. It would
> require of_regulator_match() and the (undesirable) lists of regulator
> names for all the different pmic variants, or we would need to pick out
> the regulator nodes based on compatible matching. Is that so bad? In the
> other cases we were putting lots of data in the driver purely for
> debugging, whereas in this case we're doing it to find nodes that we
> need to hook up with regulators in software and any associated data for
> that regulator.
>

That is indeed a bunch of memory.

I think that if we instantiate the rpm-regulator driver by name from
the mfd driver and then loop over all the children and match against
our compatible list we would come down to 1 platform driver that
instantiate all our regulators. It's going to require some surgery and
will make the regulator driver less simple, but can be done.

With this we can go for the proposed binding and later alter the
implementation to save the memory. The cost of not encapsulating the
regulators/clocks/msm_busses are the extra loops in above search. The
benefit is cleaner bindings (and something that works as of today).


With the alternative of using the existing infrastructure of matching
regulators by name we need to change the binding to require certain
naming as well as maintain lists of the resources within the
regulator, clock & msm_bus drivers - something that has been objected
to several times already.


A drawback of both these solutions is that supplies are specified on
the device's of_node, and hence it is no longer possible to describe
the supply dependency between our regulators - something that have
shown to be needed. Maybe we can open code the supply logic in the
regulator driver or we have to convince Mark about the necessity of
this.


So I would prefer to merge the binding as is and then put an
optimisation effort of the implementation on the todo list.

Regards,
Bjorn
