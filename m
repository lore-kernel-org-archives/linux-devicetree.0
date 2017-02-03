From: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 00/24] i.MX Media Driver
Date: Fri, 3 Feb 2017 10:49:41 -0800
Message-ID: <02a3a834-efce-e87d-6e1d-ffe21015509e@gmail.com>
References: <1483755102-24785-1-git-send-email-steve_longerbeam@mentor.com>
 <20170202172245.GT27312@n2100.armlinux.org.uk>
 <20170202175600.GU27312@n2100.armlinux.org.uk>
 <4815b9c8-782a-ac67-d296-c4acb296d849@gmail.com>
 <20170202185826.GV27312@n2100.armlinux.org.uk>
 <2e1cf096-ecb8-ba3d-a554-f4cc6999ed4e@gmail.com>
 <20170202222925.GW27312@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170202222925.GW27312-l+eeeJia6m9URfEZ8mYm6t73F7V6hmMc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, Steve Longerbeam <steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, robert.jarzmik-GANU6spQydw@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sudipm.m
List-Id: devicetree@vger.kernel.org



On 02/02/2017 02:29 PM, Russell King - ARM Linux wrote:
> On Thu, Feb 02, 2017 at 11:12:41AM -0800, Steve Longerbeam wrote:
>> Here is the current .queue_setup() op in imx-media-capture.c:
>>
>> static int capture_queue_setup(struct vb2_queue *vq,
>>                                 unsigned int *nbuffers,
>>                                 unsigned int *nplanes,
>>                                 unsigned int sizes[],
>>                                 struct device *alloc_devs[])
>> {
>>          struct capture_priv *priv = vb2_get_drv_priv(vq);
>>          struct v4l2_pix_format *pix = &priv->vdev.fmt.fmt.pix;
>>          unsigned int count = *nbuffers;
>>
>>          if (vq->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
>>                  return -EINVAL;
>>
>>          if (*nplanes) {
>>                  if (*nplanes != 1 || sizes[0] < pix->sizeimage)
>>                          return -EINVAL;
>>                  count += vq->num_buffers;
>>          }
>>
>>          while (pix->sizeimage * count > VID_MEM_LIMIT)
>>                  count--;
> That's a weird way of writing:
>
> 	unsigned int max_num = VID_MEM_LIMIT / pix->sizeimage;
> 	count = max(count, max_num);

I think you mean min() there, but yes thanks, fixed.

Steve

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
