From: Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v6 07/12] usb: chipidea: add a usb2 driver for ci13xxx
Date: Tue, 23 Sep 2014 15:36:45 +0200
Message-ID: <20140923133645.GA18924@kwain>
References: <1411468088-5702-1-git-send-email-antoine.tenart@free-electrons.com>
 <1411468088-5702-8-git-send-email-antoine.tenart@free-electrons.com>
 <2909480.SL9c0XWUbW@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2909480.SL9c0XWUbW@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Peter.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Arnd,

On Tue, Sep 23, 2014 at 12:39:04PM +0200, Arnd Bergmann wrote:
> On Tuesday 23 September 2014 12:28:03 Antoine Tenart wrote:
> > +       if (dev->of_node) {
> > +               ret =3D ci_hdrc_usb2_dt_probe(dev, ci_pdata);
> > +               if (ret)
> > +                       goto clk_err;
> > +       } else {
> > +               ret =3D dma_set_mask_and_coherent(&pdev->dev, DMA_B=
IT_MASK(32));
> > +               if (ret)
> > +                       goto clk_err;
> > +       }
> >=20
>=20
> Why do you care about the non-DT case here? I think it would be nicer=
 to
> open-code the ci_hdrc_usb2_dt_probe() function in here and remove
> the dma_set_mask_and_coherent(), which should not even be necessary f=
or
> the case where you have a hardwired platform device.
>=20

I thought we agreed to call dma_set_mask_and_coherent():
http://lists.infradead.org/pipermail/linux-arm-kernel/2014-July/273335.=
html

I do not have a strong opinion on this as I only use the dt case for my
usage.


Antoine

--=20
Antoine T=E9nart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
