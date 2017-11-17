From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH v2] arm64: dts: ulcb-kf: enable USB2 PHY of channel 0
Date: Fri, 17 Nov 2017 06:15:24 -0800
Message-ID: <20171117141524.qizfhukb2ufw5lbt@verge.net.au>
References: <1510143698-17306-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <CAMuHMdWuHV38=XupXxH1TXFONpsjmY=3zN7iaKDT54xBd_DSGw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdWuHV38=XupXxH1TXFONpsjmY=3zN7iaKDT54xBd_DSGw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 15, 2017 at 05:36:21PM +0100, Geert Uytterhoeven wrote:
> Hi Vladimir,
> 
> On Wed, Nov 8, 2017 at 1:21 PM, Vladimir Barinov
> <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org> wrote:
> > This supports USB2 PHY channel #0 on ULCB Kingfisher board
> >
> > The dedicated USB0_PWEN pin is used to control CN13 VBUS source from U43
> > power supply.
> > MAX3355 can also provide VBUS, hence it should be disabled via OTG_OFFVBUSn
> > node coming from gpio expander TCA9539.
> > Set MAX3355 enabled using OTG_EXTLPn node to be able to read OTG ID of CN13.

I took the liberty of line-wrapping the line above to keep it from going
over 75 characters wide to keep checkpatch happy.

> >
> > Signed-off-by: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
> > ---
> > Changes in version 2:
> > - added gpio hogs for MAX3355 VBUS and SHDN
> 
> Thanks for the update!
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>

Thanks, applied.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
