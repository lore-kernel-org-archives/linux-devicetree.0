From: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 00/39] i.MX Media Driver
Date: Sun, 12 Mar 2017 13:05:06 -0700
Message-ID: <ea3ccdb8-903f-93ab-6875-90da440fc52a@gmail.com>
References: <1489121599-23206-1-git-send-email-steve_longerbeam@mentor.com>
 <20170310201356.GA21222@n2100.armlinux.org.uk>
 <47542ef8-3e91-b4cd-cc65-95000105f172@gmail.com>
 <20170312195741.GS21222@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170312195741.GS21222-l+eeeJia6m9URfEZ8mYm6t73F7V6hmMc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.orgde
List-Id: devicetree@vger.kernel.org



On 03/12/2017 12:57 PM, Russell King - ARM Linux wrote:
> On Sat, Mar 11, 2017 at 04:30:53PM -0800, Steve Longerbeam wrote:
>> If it's too difficult to get the imx219 csi-2 transmitter into the
>> LP-11 state on power on, perhaps the csi-2 receiver can be a little
>> more lenient on the transmitter and make the LP-11 timeout a warning
>> instead of error-out.
>>
>> Can you try the attached change on top of the version 5 patchset?
>>
>> If that doesn't work then you're just going to have to fix the bug
>> in imx219.
>
> That patch gets me past that hurdle, only to reveal that there's another
> issue:

Yeah, ipu_cpmem_set_image() failed because it doesn't recognize the
bayer formats. Wait, didn't we fix this already? I've lost track.
Ah, right, we were going to move this support into the IPUv3 driver,
but in the meantime I think you had some patches to get around this.

Steve


>
> imx6-mipi-csi2: LP-11 timeout, phy_state = 0x00000200
> imx219 0-0010: VT: pixclk 139200000Hz line 80742Hz frame 30.0Hz
> imx219 0-0010: VT: line period 12385ns
> imx219 0-0010: OP: pixclk 38500000Hz, 2 lanes, 308Mbps peak each
> imx219 0-0010: OP: 3288 bits/line/lane act=10675ns lp/idle=1710ns
> ipu1_csi0: csi_idmac_setup failed: -22
> ipu1_csi0: pipeline start failed with -22
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 1860 at /home/rmk/git/linux-rmk/drivers/media/v4l2-core/videobuf2-core.c:1340 vb2_start_streaming+0x124/0x1b4 [videobuf2_core]
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
