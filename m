From: Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>
Subject: Re: [PATCH] mfd: devicetree: bindings: Add Qualcomm RPM regulator subnodes
Date: Tue, 17 Feb 2015 13:48:27 -0800
Message-ID: <CAJAp7OjwuOdD=DynygFWnPH6tEVyf_dzOHQbUV_CHjS7OXihdg@mail.gmail.com>
References: <1422582666-32653-1-git-send-email-bjorn.andersson@sonymobile.com>
	<20150213221332.GA19975@qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150213221332.GA19975-zC7DfRvBq/JWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 13, 2015 at 2:13 PM, Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
> On Thu, Jan 29, 2015 at 05:51:06PM -0800, Bjorn Andersson wrote:
>> Add the regulator subnodes to the Qualcomm RPM MFD device tree bindings.
>>
>> Signed-off-by: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
>> ---
>
>>       #include <dt-bindings/mfd/qcom-rpm.h>
>> @@ -66,5 +237,18 @@ frequencies.
>>
>>               #address-cells = <1>;
>>               #size-cells = <0>;
>> +
>> +             pm8921_smps1: pm8921-smps1 {
>> +                     compatible = "qcom,rpm-pm8921-smps";
>> +                     reg = <QCOM_RPM_PM8921_SMPS1>;
>> +
>> +                     regulator-min-microvolt = <1225000>;
>> +                     regulator-max-microvolt = <1225000>;
>> +                     regulator-always-on;
>> +
>> +                     bias-pull-down;
>> +
>> +                     qcom,switch-mode-frequency = <3200000>;
>> +             };
>>       };
>
> My only comment here is that most (all but one) of the other mfd regulator
> devices use regulators {}.  Still wonder if that's what we should do.
>

Looking at the existing mfds they all have a list in the code of the
regulators supported on a certain mfd. Through the use of
regulator_desc.{of_match,regulators_node} these regulators are
populated with properties from of_nodes matched by name (of_match)
under the specified node (regulators_node).
But as we've discussed in other cases it's not desirable to maintain
these lists for the various variants of Qualcomm platforms, so I did
choose to go with "standalone" platform devices - with matching
through compatible and all.

But that's all implementation, looking at the binding itself a
regulator {} (clocks{} and msm_bus{}) would serve as a sort of
grouping of children based on type. Except for the implications this
has on the implementation I don't see much benefit of this (and in our
case the implementation would suffer from the extra grouping).


Let me know what you think, I based these ideas on just reading the
existing code and bindings, and might very well have missed something.

> Otherwise,
>
> Reviewed-by: Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>

Thanks

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
