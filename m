From: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v2 09/12] ARM: imx6q: disable usb charger detector
Date: Tue, 22 May 2012 12:32:34 +0800
Message-ID: <20120522043233.GJ6206@b20223-02.ap.freescale.net>
References: <1337592237-5090-1-git-send-email-richard.zhao@freescale.com>
 <1337592237-5090-10-git-send-email-richard.zhao@freescale.com>
 <20120522034809.GI8140@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120522034809.GI8140-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linuxzsc-MeMPY/F8WlbQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, May 22, 2012 at 11:48:11AM +0800, Shawn Guo wrote:
> On Mon, May 21, 2012 at 05:23:54PM +0800, Richard Zhao wrote:
> > +static void __init imx6q_usb_init(void)
> > +{
> > +#define HW_ANADIG_USB1_CHRG_DETECT		0x000001b0
> > +#define HW_ANADIG_USB2_CHRG_DETECT		0x00000210
> > +
> > +#define BM_ANADIG_USB_CHRG_DETECT_EN_B		0x00100000
> > +#define BM_ANADIG_USB_CHRG_DETECT_CHK_CHRG_B	0x00080000
> > +
> > +	/*
> > +	 * The external charger detector needs to be disabled,
> > +	 * or the signal at DP will be poor
> > +	 */
> > +
> Nit: drop this unnecessary new line.
OK. 

Thanks
Richard
> 
> Regards,
> Shawn
> 
> > +	anatop_write_reg(NULL, HW_ANADIG_USB1_CHRG_DETECT,
> > +			BM_ANADIG_USB_CHRG_DETECT_EN_B
> > +			| BM_ANADIG_USB_CHRG_DETECT_CHK_CHRG_B,
> > +			~0);
> > +	anatop_write_reg(NULL, HW_ANADIG_USB2_CHRG_DETECT,
> > +			BM_ANADIG_USB_CHRG_DETECT_EN_B |
> > +			BM_ANADIG_USB_CHRG_DETECT_CHK_CHRG_B,
> > +			~0);
> > +}
> > +
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
