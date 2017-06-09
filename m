From: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v8 19/34] media: Add i.MX media core driver
Date: Fri, 9 Jun 2017 16:02:54 -0700
Message-ID: <0df57159-78de-52a7-4fc2-d53e4682c8bb@gmail.com>
References: <1496860453-6282-1-git-send-email-steve_longerbeam@mentor.com>
 <1496860453-6282-20-git-send-email-steve_longerbeam@mentor.com>
 <1497014135.20356.12.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1497014135.20356.12.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 06/09/2017 06:15 AM, Philipp Zabel wrote:
> On Wed, 2017-06-07 at 11:33 -0700, Steve Longerbeam wrote:
>> Add the core media driver for i.MX SOC.
>>
>> Signed-off-by: Steve Longerbeam <steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
>>
>> Switch from the v4l2_of_ APIs to the v4l2_fwnode_ APIs.
>>
>> Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>>
>> Add the bayer formats to imx-media's list of supported pixel and bus
>> formats.
>>
>> Signed-off-by: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
>> ---
> [...]
>> diff --git a/drivers/staging/media/imx/imx-media-dev.c b/drivers/staging/media/imx/imx-media-dev.c
>> new file mode 100644
>> index 0000000..da694f6
>> --- /dev/null
>> +++ b/drivers/staging/media/imx/imx-media-dev.c
>> @@ -0,0 +1,666 @@
> [...]
>> +/*
>> + * adds given video device to given imx-media source pad vdev list.
>> + * Continues upstream from the pad entity's sink pads.
>> + */
>> +static int imx_media_add_vdev_to_pad(struct imx_media_dev *imxmd,
>> +				     struct imx_media_video_dev *vdev,
>> +				     struct media_pad *srcpad)
>> +{
>> +	struct media_entity *entity = srcpad->entity;
>> +	struct imx_media_subdev *imxsd;
>> +	struct imx_media_pad *imxpad;
>> +	struct media_link *link;
>> +	struct v4l2_subdev *sd;
>> +	int i, vdev_idx, ret;
>> +
>> +	if (!is_media_entity_v4l2_subdev(entity))
>> +		return -EINVAL;
> 
> Could we make this return 0, to just skip non-v4l2_subdev entities?
> Currently, imx_media_probe_complete silently fails with this -EINVAL if
> there is a tvp5150 connected due to the separate media entities that the
> tvp5150 driver creates for the input connectors (Composite0, for
> example).
> 

Right, I've made that change.

Steve

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
