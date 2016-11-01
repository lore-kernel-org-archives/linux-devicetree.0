From: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v8 3/3] ARM: davinci: da8xx: register USB PHY clocks in
 the DT file
Date: Tue, 1 Nov 2016 15:28:39 +0530
Message-ID: <dab6f964-21f1-a0c4-643e-6d43568af63a@ti.com>
References: <1477946841-16126-1-git-send-email-david@lechnology.com>
 <1477946841-16126-4-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477946841-16126-4-git-send-email-david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Axel Haslam <ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBpdZSXdFL2CA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday 01 November 2016 02:17 AM, David Lechner wrote:
> From: Axel Haslam <ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> 
> The usb20_phy clock needs to be registered for the driver to be able
> to get and enable a clock. Currently the usb phy clocks are registered
> form board files, which will not be called during a device tree based
> boot.
> 
> To be able to probe correctly usb form a device tree boot, register
> the usb phy clocks form the DT specific init.
> 
> Unfourtunatly, davinci does not have proper clock support on device tree
> yet, so by registering the clock form de DT specific file we are
> forced to hardcode the parent clock, and cannot select refclkin as
> parent for any of the phy clocks of the da850 family.
> 
> As none of the current da850 based boards currently in mainline use
> refclkin as source. I guess we can live with this limitation until clocks
> are correctly represented through CCF/device tree.
> 
> Signed-off-by: Axel Haslam <ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> [Added error checking]
> Signed-off-by: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>

Applied to v4.10/soc with some typo fixes.

s/form/from
s/Unfourtunatly/Unfortunately
s/de/the

Thanks,
Sekhar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
