From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] mfd: core: introduce of_node_name for mfd sub devices
Date: Mon, 23 Sep 2013 14:46:05 -0600
Message-ID: <5240A88D.8030309@wwwdotorg.org>
References: <1379579392-1794-1-git-send-email-ldewangan@nvidia.com> <20130919083050.GH16984@lee--X1> <20130919115501.GM21013@sirena.org.uk> <20130919120051.GG22389@lee--X1> <523AEE07.9090405@nvidia.com> <20130919122240.GI22389@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130919122240.GI22389@lee--X1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org" <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 09/19/2013 06:22 AM, Lee Jones wrote:
>>>>> Do the sub-nodes have their own properties? If so, it would be worth
>>>>> breaking them up as other OSes could reuse the specifics. If they do,
>>>>> then you need so put them in the binding. If they don't, then you do
>>>>> not require sub-nodes. The MFD core will ensure the sub-devices are
>>>>> probed and there is no requirement for the of_node to be assigned.
>>>> You do see some reusable IP blocks (like the regualtors on the wm831x
>>>> PMICs for example, they're repeated blocks) which can be reused but
>>>> generally they have a register base as part of the binding.  Personally
>>>> if it's just a property or two I'd probably just put them on the root
>>>> node for the device.
>>> Agreed. Besides, there doesn't seem to be *any* sub-device properties
>>> defined in the binding document. So what are you trying to achieve
>>> with the child nodes?
>>
>> I wanted to have the DT like:
>>
>> as3722 {
>>                 compatible = "ams,as3722";
>>                 reg = <0x40>;
>>
>>                 #interrupt-controller;
>>                 .....
>>
>>
>>                 regulators {
>>                             ldo1-in-supply = <..>;
>>                             ....
>>                             sd0 {
>>                                     regulator-name = "vdd-cpu";
>>                                     .....
>>                             };
>>                             sd1 {
>>                                     regulator-name = "vdd-ddr";
>>                                     .....
>>                             };
>>                             ....
>>             };
>> };
>>
>> And regulator driver should get the regulator node by their
>> pdev->dev.of_node.
>> Currently, in most of driver, we are having the code on regulator
>> driver to get "regulators" node from parent node which I want to
>> avoid.
> 
> Ah, I see. Yes, I believe the regulators should have their own node,

The use of a "regulators" node to keep all the regulator configuration
in one place seems fine...

> complete with a compatible string.

... but I see not reason why that node has to have a separate compatible
property, or /has/ to have a separate driver.

I think having a compatible value in this node would only be required if
the HW block that implements those registers is actually expected to be
shared between n different chips, and hence it's likely that you'd get
re-use out of a separate binding, driver, etc.

It's perfectly reasonable for the regulator MFD driver to know that the
binding for the top-level PMIC node has a regulators child node, and go
find it by name, and read whatever properties/nodes it needs directly
out of it. Writing code that way in no ways implies a need for a
compatible value.

> To have each regulator listed
> separately in the parent node seems a little messy. Just out of
> interest, how many regulators are we talking about here?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
