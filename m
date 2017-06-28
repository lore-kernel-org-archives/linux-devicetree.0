From: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v4 2/4] [media] platform: Add Synopsys Designware HDMI
 RX Controller Driver
Date: Wed, 28 Jun 2017 12:36:44 +0200
Message-ID: <e3e515b3-167b-8159-f636-588f6d4b730a@samsung.com>
References: <cover.1497978962.git.joabreu@synopsys.com>
        <314b7ae92c9924d0991e14ccad80ca937a2d7b07.1497978962.git.joabreu@synopsys.com>
        <e6f63454-2e87-6e93-50c3-2802e9357c2a@kernel.org>
        <2868c525-3edd-0fe1-cc6f-49a758f8c434@synopsys.com>
        <2153d8da-effc-fedd-a2ce-b1c9ee40a82c@kernel.org>
        <CGME20170628092556epcas2p276880133453e1b5450e3135786aa9e38@epcas2p2.samsung.com>
        <31dbb0fb-6256-a609-856c-f92b4245e2e6@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <31dbb0fb-6256-a609-856c-f92b4245e2e6-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Content-language: en-GB
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jose Abreu <Jose.Abreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Carlos Palminha <CARLOS.PALMINHA-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Jose,

On 06/28/2017 11:25 AM, Jose Abreu wrote:
> On 27-06-2017 21:34, Sylwester Nawrocki wrote:
>> On 06/27/2017 10:43 AM, Jose Abreu wrote:
>>> On 25-06-2017 22:13, Sylwester Nawrocki wrote:
>>>> On 06/20/2017 07:26 PM, Jose Abreu wrote:
>>>>> This is an initial submission for the Synopsys Designware HDMI RX
>>>>> Controller Driver. This driver interacts with a phy driver so that
>>>>> a communication between them is created and a video pipeline is
>>>>> configured.
>>>>> Signed-off-by: Jose Abreu <joabreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>

> The modules are installed but I think I don't have udev :/ I'm
> running this on an embedded platform called ARC AXS and I'm using
> buildroot with minimal options.

OK, then let's keep this request_module.

>>>>> +static int dw_hdmi_v4l2_notify_complete(struct v4l2_async_notifier *notifier)
>>>>> +{
>>>>> +	struct dw_hdmi_dev *dw_dev = notifier_to_dw_dev(notifier);
>>>>> +	int ret;
>>>>> +
>>>>> +	ret = v4l2_device_register_subdev_nodes(&dw_dev->v4l2_dev);
>>>> There shouldn't be multiple struct v4l2_device instances, instead we should
>>>> have only one created by the main driver. AFAIU, in your case it would be
>>>> driver associated with the dw-hdmi-soc DT node.  And normally such a top level
>>>> driver creates subdev device nodes when its all required sub-devices are
>>>> available.
>>>>
>>>> I think this patch could be useful for you:
>>>> https://urldefense.proofpoint.com/v2/url?u=https-3A__patchwork.linuxtv.
>>>> org_patch_41834&d=DwICaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=WHDsc6kcWAl4i96Vm5hJ_19I
>>>> Jiuxx_p_Rzo2g-uHDKw&m=uNHRQkbP_-z8v5d30KFx9pcPEUhlr4ciWY3ZDAVExTA&s=dB9wpgeP
>>>> 7AJg1eDRty0-RKhq3DY-7J5srIzyVoJey5I&e=
>>>>
>>>> With that the dw-hdmi-soc driver would have it's v4l2-async notifier's
>>>> notify_complete() callback called only when both the hdmi-rx and the
>>>> hdmi-phy subdevs are registered.
>>> Yeah, I saw the patches. I just implemented this way because they
>>> are not merged yet, right?
 >>
>> I think these patches will be merged in v4.14-rc1, so together with your driver.
>> You could apply them locally and indicate that your series depends on them in
>> the cover letter.
> 
> Ok, will apply them locally and re-test.

Thanks.

>>>>> +	if (ret) {
>>>>> +		dev_err(dw_dev->dev, "failed to register subdev nodes\n");
>>>>> +		return ret;
>>>>> +	}
>>>>> +
>>>>> +	return 0;
>>>>> +}
>>>>> +static int dw_hdmi_rx_probe(struct platform_device *pdev)
>>>>> +{
>>>>> +	/* V4L2 initialization */
>>>>> +	sd = &dw_dev->sd;
>>>>> +	v4l2_subdev_init(sd, &dw_hdmi_sd_ops);
>>>>> +	strlcpy(sd->name, dev_name(dev), sizeof(sd->name));
>>>>> +	sd->dev = dev;
>>>>> +	sd->internal_ops = &dw_hdmi_internal_ops;
>>>>> +	sd->flags |= V4L2_SUBDEV_FL_HAS_EVENTS;
 >>>>
>>>> Don't you also need V4L2_SUBDEV_FL_HAS_DEVNODE flag set?
>>> Ouch. Yes I need otherwise the subdev will not be associated with
>>> the v4l2_device.
 >>
>> This flag indicates that the v4l2 subdev device node (/dev/v4l-subdev?)
>> should be created for this subdevice.
> 
> Ok, will add for controller driver only then: I think for phy
> this should not be added because controller is responsible to
> manage phy entirely so creating a /dev/ which can be seen by
> userspace can lead to confusion, maybe?

Right, there should be no need for the PHY. It's up to you to
set it or not for the RX controller subdev. I just got confused
because in your dw_hdmi_sd_ops data structure there are ops which
would suggest that device node is used.


Regards,
Sylwester
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
