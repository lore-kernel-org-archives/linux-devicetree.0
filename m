From: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Subject: RE: [PATCH] usb: renesas_usbhs: Add compatible string for r8a7743/5
Date: Tue, 17 Oct 2017 09:09:50 +0000
Message-ID: <KL1PR06MB170284D41F8517AD9A96E8A0B84C0@KL1PR06MB1702.apcprd06.prod.outlook.com>
References: <1507216358-917-1-git-send-email-biju.das@bp.renesas.com>
 <87wp3uji3x.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87wp3uji3x.fsf-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

> -----Original Message-----
> From: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org [mailto:devicetree-
> owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org] On Behalf Of Felipe Balbi
> Sent: 17 October 2017 09:26
> To: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>; Greg Kroah-Hartman
> <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>; Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>; Mark
> Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Cc: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>; Chris Paterson
> <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>; Fabrizio Castro
> <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-renes=
as-
> soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Biju Das
> <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
> Subject: Re: [PATCH] usb: renesas_usbhs: Add compatible string for r8a774=
3/5
>
>
> Hi,
>
> Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org> writes:
> > This patch adds support for r8a7743/5 SoC.  The Renesas RZ/G1[ME]
> > (R8A7743/5) usbhs is identical to the R-Car Gen2 family.
> >
> > This doesn't change the driver, so it does nothing by itself.  But it
> > does mean that checkpatch won't complain about a future patch that
> > adds "renesas,usbhs-r8a7743" or "renesas,usbhs-r8a7745" to a DT, which
> > helps ensure that shipped DTs use documented compatibility strings.
> >
> > Signed-off-by: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
> > ---
> > This patch is tested against Linux next tag next-20170929

> care to rebase on my testing/next? It fails to apply.

Sorry for the trouble.

I have already send a V2 for fixing this.

[v2] usb: renesas_usbhs: Add compatible string for r8a7743/5
https://patchwork.kernel.org/patch/9990063/

I have rebased this patch on my testing/next and confirms it apply cleanly.

Regds,
Biju








Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
