From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of: support passing console options with stdout-path
Date: Tue, 25 Nov 2014 14:44:39 +0000
Message-ID: <20141125144439.07212C44343@trevor.secretlab.ca>
References: <1416867838-18652-1-git-send-email-leif.lindholm@linaro.org>
	<20141124230016.GP20238@lunn.ch>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141124230016.GP20238-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org, ijc-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 25 Nov 2014 00:00:16 +0100
, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
 wrote:
> On Mon, Nov 24, 2014 at 10:23:58PM +0000, Leif Lindholm wrote:
> > Support specifying console options (like with console=ttyXN,<options>)
> > by appending them to the stdout-path property after a separating ':'.
> > 
> > Example:
> > 	stdout-path = "uart0:115200";
> > 
> > This patch also modifies of_find_node_by_path() to match only the
> > portion of the path before a ':'.
> 
> Hi Leif
> 
> These appears to somewhat conform to ePAPR, which says:
> 
>       A string that specifies the full path to the node representing
>       the device to be used for boot console output. If the character
>       ":" is present in the value it terminates the path.
> 
> So you can put any random junk after the :. However, are we going to
> have backward/forward compatibility problems, and problems with
> bootloaders? The current kernel code does not look for the :. So a new
> DT blob on an old kernel will not work so well.

For DT, we've generally not been worrying about compatibility in that
direction.  If we've got a new firmware, we should be able to get a new
kernel.  Nobody has really screamed bout it yet.

> More worrying, barebox does not support the : either. So there is a
> danger your bootloader suddenly goes silent after a dt blob update.

Is barebox parsing the property? Or updating it? Or both? I've got no
problem with this patch, but we can also support things like the
'current-speed' property in the UART to set a default when the stdout
path doesn't have any arguments.

g.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
