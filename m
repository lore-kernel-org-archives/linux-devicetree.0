From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 0/2] ARM: dts: add Okaya LCD display for Nitrogen and
 Sabrelite
Date: Wed, 27 May 2015 09:57:19 +0200
Message-ID: <1432713439.4884.6.camel@pengutronix.de>
References: <1432314867-30888-1-git-send-email-gary.bisson@boundarydevices.com>
	 <20150527030636.GB16165@dragon>
	 <CAAMH-yt_4HE_HWHVvb1QFZLgtGCNdoxB=BwTBHcW2JToeuC_6w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAMH-yt_4HE_HWHVvb1QFZLgtGCNdoxB=BwTBHcW2JToeuC_6w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, Eric Nelson <eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Gary, Shawn,

Am Mittwoch, den 27.05.2015, 09:38 +0200 schrieb Gary Bisson:
> Philipp, Shawn, All,
> 
> On Wed, May 27, 2015 at 5:06 AM, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> > On Fri, May 22, 2015 at 07:14:25PM +0200, Gary Bisson wrote:
> >> This series adds the Okaya 7" LCD display that is a WVGA (800x480) panel with
> >> a 18-bit parallel interface for both Nitrogen and Sabrelite.
> >>
> >> A U-Boot script to configure the displays based on detection of the
> >> touch controller is available for reference here:
> >> https://github.com/boundarydevices/u-boot-imx6/blob/staging/board/boundary/nitrogen6x/6x_bootscript-mainline.txt
> >>
> >> Gary Bisson (2):
> >>   ARM: dts: imx6qdl-nitrogen6x: add Okaya LCD display
> >>   ARM: dts: imx6qdl-sabrelite: add Okaya LCD display
> >
> > Philipp,
> >
> > Are you okay with these two patches?
> 
> I've actually just ran into Philipp's patch on drm_panel support for
> parallel-display driver.
> https://patchwork.kernel.org/patch/6438311/
> 
> If the above patch is merged soon, maybe mine should be reworked to
> use the panel as well (and add the Okaya timings to the simple panel
> driver).
> 
> Let me know what would be the best.

Yes, please add Okaya LCD support to the simple-panel driver instead.
I'll send a pull request with the panel patch.

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
