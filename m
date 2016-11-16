From: Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v4 4/4] ARM: dts: da850: Add the usb otg device nodeg
Date: Wed, 16 Nov 2016 11:24:24 -0600
Message-ID: <20161116172424.GA9487@uda0271908>
References: <1478188752-22447-1-git-send-email-abailon@baylibre.com>
 <1478188752-22447-5-git-send-email-abailon@baylibre.com>
 <0c94c5e0-9d2c-fff5-1213-2fb2adb20ab0@ti.com>
 <20161115211951.GH11011@uda0271908>
 <9a73c416-fe4c-57c3-af53-87146dae2206@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <9a73c416-fe4c-57c3-af53-87146dae2206-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Cc: Alexandre Bailon <abailon-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 16, 2016 at 12:06:51PM +0530, Sekhar Nori wrote:
> On Wednesday 16 November 2016 02:49 AM, Bin Liu wrote:
> > On Tue, Nov 15, 2016 at 04:16:02PM +0530, Sekhar Nori wrote:
> >> On Thursday 03 November 2016 09:29 PM, Alexandre Bailon wrote:
> >>> This adds the device tree node for the usb otg
> >>> controller present in the da850 family of SoC's.
> >>> This also enables the otg usb controller for the lcdk board.
> >>>
> >>> Signed-off-by: Alexandre Bailon <abailon-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> >>> ---
> >>>  arch/arm/boot/dts/da850-lcdk.dts |  8 ++++++++
> >>>  arch/arm/boot/dts/da850.dtsi     | 15 +++++++++++++++
> >>>  2 files changed, 23 insertions(+)
> >>>
> >>> diff --git a/arch/arm/boot/dts/da850-lcdk.dts b/arch/arm/boot/dts/da850-lcdk.dts
> >>> index 7b8ab21..9f5040c 100644
> >>> --- a/arch/arm/boot/dts/da850-lcdk.dts
> >>> +++ b/arch/arm/boot/dts/da850-lcdk.dts
> >>> @@ -158,6 +158,14 @@
> >>>  	rx-num-evt = <32>;
> >>>  };
> >>>  
> >>> +&usb_phy {
> >>> +	status = "okay";
> >>> +	};
> >>
> >> As mentioned by David already, this node needs to be removed. Please
> >> rebase this on top of latest linux-davinci/master when ready for merging
> >> (driver changes accepted).
> > 
> > Dropped this patch due to this comment.
> 
> Bin, Please do not apply dts or arch/arm/mach-davinci patches. I have a
> bunch queued through my tree and more in pipeline and it will cause
> unnecessary merge conflicts in linux-next or at Linus.

Sure, I will drop this whole set, and only apply the musb patches in the
new v5.

> 
> For future, I have asked Alexandre to send driver and dts patches as
> separate series so there is no confusion on who should apply.

I will keep in mind to ping other domain maintainers before applying
non-musb patches in future.

> 
> Thanks,
> Sekhar

Regards,
-Bin.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
