From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: am33xx: Move the cppi41dma node so it's probed
 early
Date: Wed, 23 Apr 2014 13:00:42 -0300
Message-ID: <20140423160042.GB6969@arch.cereza>
References: <1398176371-26468-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <5357DCE0.5050204@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5357DCE0.5050204-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Daniel Mack <zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Guido =?iso-8859-1?Q?Mart=EDnez?= <guido-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Apr 23, Sebastian Andrzej Siewior wrote:
> On 04/22/2014 04:19 PM, Ezequiel Garcia wrote:
> > The DMA controller is needed for the USB controller to be correctly
> > registered. Therefore, if the DMA node is located at the end an une=
cessary
> > probe deferral is produced systematically.
> >=20
> > This is easily fixed by moving the node at the beggining of the chi=
ld list,
> > so it's probed first.
>=20
> So you do not change anything except for the order of child nodes. So
> this should be fine and without a compatibility problem.
>=20
> I added them according to the memory offset so you might want to add =
a
> comment why you moved this because Mr. Structured & Organized might
> noticed this one day and move it back.
>=20

Yes, good catch. I'll prepare a v2.

> > Signed-off-by: Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
> > ---
> > Felipe, Sebastian:
> >=20
> > I cannot see why the cppi41dma node must be placed inside the
> > "ti,am33xx-usb" compatible node. Tried to move it out
> > so it's probed just like the edma engine, but the USB doesn't work
> > properly in that case.
> >=20
> > Can you enlighten me?
>=20
> So If I remember correctly it was a big bag of crap. If you look at t=
he
> parent node, you notice that it has a ti,hwmods member while the othe=
r
> do not have such a property. According to the manual only the whole I=
P
> block as-it has this. It has to be activated if you use one of those
> devices this includes the two USB-IP cores and the DMA-IP core. I
> didn't manage to come up with something else except to make one paren=
t
> node which creates the childs to have a proper relation here.
>=20

Ah, this could be...

> There was also something with parent - child relation in the way musb
> expected it. I think this was only glue code + musb child node and ha=
d
> nothing to do with the DMA engine. But I am not 100% sure=E2=80=A6
>=20

Well, from my poor and unexperienced code inspection, I could not see a=
nything
relating the parent of the DMA controller node to the node itself, and =
so that's
why it seemed possible to move it out.

Once the dma-controller is moved out of the USB devicetree node block,
the dmaengine driver is registered correctly (apparently), and so does =
the USB
driver.

However, upon connection of some USB storage device, detection begins
but then things don't go well, although I don't have the exact error he=
re,
I remember this warning was hitted on dma/cppi41.c at line 602:

  WARN_ON(!c->td_retry);

Just in case someone want to debug this further.

Thanks a lot for the feedback!
--=20
Ezequiel Garc=C3=ADa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
