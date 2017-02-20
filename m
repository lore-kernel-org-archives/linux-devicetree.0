From: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 29/36] media: imx: mipi-csi2: enable setting and
 getting of frame rates
Date: Mon, 20 Feb 2017 15:47:39 -0800
Message-ID: <028a05fb-f5e8-d4ed-b0bd-39b93b56dfac@gmail.com>
References: <1487211578-11360-1-git-send-email-steve_longerbeam@mentor.com>
 <1487211578-11360-30-git-send-email-steve_longerbeam@mentor.com>
 <20170220220409.GX16975@valkosipuli.retiisi.org.uk>
 <6892fb15-2d18-4898-c328-3acff9d6cc39@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6892fb15-2d18-4898-c328-3acff9d6cc39-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-me
List-Id: devicetree@vger.kernel.org



On 02/20/2017 02:56 PM, Steve Longerbeam wrote:
>
>
> On 02/20/2017 02:04 PM, Sakari Ailus wrote:
>> Hi Steve,
>>
>> On Wed, Feb 15, 2017 at 06:19:31PM -0800, Steve Longerbeam wrote:
>>> From: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
>>>
>>> Setting and getting frame rates is part of the negotiation mechanism
>>> between subdevs.  The lack of support means that a frame rate at the
>>> sensor can't be negotiated through the subdev path.
>>
>> Just wondering --- what do you need this for?
>
>
> Hi Sakari,
>
> i.MX does need the ability to negotiate the frame rates in the
> pipelines. The CSI has the ability to skip frames at the output,
> which is something Philipp added to the CSI subdev. That affects
> frame interval at the CSI output.
>
> But as Russell pointed out, the lack of [gs]_frame_interval op
> causes media-ctl to fail:
>
> media-ctl -v -d /dev/media1 --set-v4l2
> '"imx6-mipi-csi2":1[fmt:SGBRG8/512x512@1/30]'
>
> Opening media device /dev/media1
> Enumerating entities
> Found 29 entities
> Enumerating pads and links
> Setting up format SGBRG8 512x512 on pad imx6-mipi-csi2/1
> Format set: SGBRG8 512x512
> Setting up frame interval 1/30 on entity imx6-mipi-csi2
> Unable to set frame interval: Inappropriate ioctl for device (-25)Unable
> to setup formats: Inappropriate ioctl for device (25)
>
>
> So i.MX needs to implement this op in every subdev in the
> pipeline, otherwise it's not possible to configure the
> pipeline with media-ctl.
>


Hi Russell,

But Sakari brings up a good point. The mipi csi-2 receiver doesn't
have any control over frame rate, so why do you even need to
give it this information via media-ctl?

Steve

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
