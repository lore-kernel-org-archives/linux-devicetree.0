From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 07/12] usb: chipidea: add a usb2 driver for ci13xxx
Date: Wed, 16 Jul 2014 12:14:02 +0200
Message-ID: <5615007.cNNjmu3rBK@wuerfel>
References: <1405499166-6726-1-git-send-email-antoine.tenart@free-electrons.com> <42036198.zWkqnus6xa@wuerfel> <20140716091533.GB28151@kwain>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140716091533.GB28151@kwain>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Antoine =?ISO-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Peter.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wednesday 16 July 2014 11:15:33 Antoine T=E9nart wrote:
>=20
> On Wed, Jul 16, 2014 at 10:41:10AM +0200, Arnd Bergmann wrote:
> > On Wednesday 16 July 2014 10:26:01 Antoine T=E9nart wrote:
> > > +
> > > +       if (priv->dma_mask) {
> > > +               ret =3D dma_coerce_mask_and_coherent(&pdev->dev, =
priv->dma_mask);
> > > +               if (ret)
> > > +                       return ret;
> > > +       }
> > > +
> > >=20
> >=20
> > As mentioned in my comment for the binding, this is the wrong way t=
o do it.
> > Russell has in the past converted all drivers that did this manuall=
y to=20
> > do dma_coerce_mask_and_coherent() so we can spot them more easily, =
but we
> > should really be doing this better for new drivers.
> >=20
> > Can you describe what the restriction is that you want to put on th=
e dma mask?
>=20
> Some people wanted the possibility to set the DMA mask as this USB2 C=
I
> driver does not do specific Berlin operation and can be reused later.
> I don't particularly need to call dma_coerce_mask_and_coherent() in m=
y
> case, as far as I know.

Ok, just remove the call then and rely on the default mask.
=20
> They can maybe give the restrictions they might want to put on the DM=
A
> mask.

If the restriction is from the bus, it should get handled automatically
by the device probe as long as the correct dma-ranges property is there
(though we have a small bug there at the moment). If there is a variati=
on
of ci13xxx that can't do 32-bit DMA, that should use a different compat=
ible
string and pass a fixed mask into dma_set_mask_and_coherent() based on
the device.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
