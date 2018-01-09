From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH v3 0/3] usb: renesas_usbhs: Add RZ/A1 support
Date: Tue, 9 Jan 2018 10:02:14 +0100
Message-ID: <20180109090214.pf4qgb44bssquspu@verge.net.au>
References: <20180105224647.42262-1-chris.brandt@renesas.com>
 <CAMuHMdV+1Y+OozRa0P2MJZQ-rT+ZfmW4iy2AYya1EMgrjb+y8Q@mail.gmail.com>
 <SG2PR06MB1165E6B9D4C00EE2A98E8E348A130@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAMuHMdXu22ihgkVgPhCtbk9X21nyk3SFwGAiObEgcv=Kf2H-ow@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdXu22ihgkVgPhCtbk9X21nyk3SFwGAiObEgcv=Kf2H-ow-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Chris Brandt <Chris.Brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 08, 2018 at 01:15:08PM +0100, Geert Uytterhoeven wrote:
> Hi Chris,
> 
> On Mon, Jan 8, 2018 at 12:59 PM, Chris Brandt <Chris.Brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org> wrote:
> > On Monday, January 08, 2018, Geert Uytterhoeven wrote:
> >> Thanks for the update, but I think there has been a misunderstanding.
> >> I didn't mean to drop "renesas,usbhs-r7s72100" everywhere, only from
> >> the matching in the driver.
> >
> > Opps, I was all kinds of confused then.
> >
> > So, before I submit a V4, here is my understanding:
> >
> > drivers/.../common.c
> >  * contains -only-  '.compatible = "renesas,rza1-usbhs"'
> 
> OK.
> 
> > Documentation/.../renesas_usbhs.txt
> >  * contains both "renesas,usbhs-r7s72100" and "renesas,rza1-usbhs"
> 
> OK.
> 
> > r7s72100.dtsi
> > * usbhs0: usb@e8010000 {
> >     compatible = "renesas,usbhs-r7s72100", "renesas,rza1-usbhs";
> 
> OK.
> 
> > Is this correct?
> 
> Yes.

Ack.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
