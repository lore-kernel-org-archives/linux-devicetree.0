From: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 00/39] i.MX Media Driver
Date: Sun, 12 Mar 2017 13:00:36 -0700
Message-ID: <3966c32f-62c0-2809-9db3-d0c0b4eadfc8@gmail.com>
References: <1489121599-23206-1-git-send-email-steve_longerbeam@mentor.com>
 <20170312194700.GR21222@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170312194700.GR21222-l+eeeJia6m9URfEZ8mYm6t73F7V6hmMc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.orgde
List-Id: devicetree@vger.kernel.org



On 03/12/2017 12:47 PM, Russell King - ARM Linux wrote:
> Another issue.
>
> The "reboot and the /dev/video* devices come up in a completely
> different order" problem seems to exist with this version.
>
> The dot graph I supplied previously had "ipu1_csi0 capture" on
> /dev/video4.  I've just rebooted, and now I find it's on
> /dev/video2 instead.

Yes, that's still an issue I haven't had the chance to get to
yet.

It could be as simple as passing a fixed device node # to
video_register_device(), but something tells me it won't be
that easy. But I'll get to this in next version.

Steve

>
> Here's the extract from the .dot file of the old listing:
>
>         n00000018 [label="ipu1_ic_prpenc capture\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
>         n00000021 [label="ipu1_ic_prpvf capture\n/dev/video1", shape=box, style=filled, fillcolor=yellow]
>         n0000002e [label="ipu2_ic_prpenc capture\n/dev/video2", shape=box, style=filled, fillcolor=yellow]
>         n00000037 [label="ipu2_ic_prpvf capture\n/dev/video3", shape=box, style=filled, fillcolor=yellow]
>         n00000048 [label="ipu1_csi0 capture\n/dev/video4", shape=box, style=filled, fillcolor=yellow]
>         n00000052 [label="ipu1_csi1 capture\n/dev/video5", shape=box, style=filled, fillcolor=yellow]
>         n00000062 [label="ipu2_csi0 capture\n/dev/video6", shape=box, style=filled, fillcolor=yellow]
>         n0000006c [label="ipu2_csi1 capture\n/dev/video7", shape=box, style=filled, fillcolor=yellow]
>
> and here's the same after reboot:
>
>         n00000014 [label="ipu1_csi0 capture\n/dev/video2", shape=box, style=filled, fillcolor=yellow]
>         n0000001e [label="ipu1_csi1 capture\n/dev/video3", shape=box, style=filled, fillcolor=yellow]
>         n00000028 [label="ipu2_csi0 capture\n/dev/video4", shape=box, style=filled, fillcolor=yellow]
>         n00000035 [label="ipu1_ic_prpenc capture\n/dev/video5", shape=box, style=filled, fillcolor=yellow]
>         n0000003e [label="ipu1_ic_prpvf capture\n/dev/video6", shape=box, style=filled, fillcolor=yellow]
>         n0000004c [label="ipu2_csi1 capture\n/dev/video7", shape=box, style=filled, fillcolor=yellow]
>         n00000059 [label="ipu2_ic_prpenc capture\n/dev/video8", shape=box, style=filled, fillcolor=yellow]
>         n00000062 [label="ipu2_ic_prpvf capture\n/dev/video9", shape=box, style=filled, fillcolor=yellow]
>
> (/dev/video0 and /dev/video1 are taken up by CODA, since I updated the
> names of the firmware files, and now CODA initialises... seems the
> back-compat filenames don't work, but that's not a problem with imx6
> capture.)
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
