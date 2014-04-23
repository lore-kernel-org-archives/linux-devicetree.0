From: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: am33xx: Move the cppi41dma node so it's probed
 early
Date: Wed, 23 Apr 2014 17:31:44 +0200
Message-ID: <5357DCE0.5050204@linutronix.de>
References: <1398176371-26468-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398176371-26468-1-git-send-email-ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Daniel Mack <zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?windows-1252?Q?Guido_Mart=EDnez?= <guido-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 04/22/2014 04:19 PM, Ezequiel Garcia wrote:
> The DMA controller is needed for the USB controller to be correctly
> registered. Therefore, if the DMA node is located at the end an unece=
ssary
> probe deferral is produced systematically.
>=20
> This is easily fixed by moving the node at the beggining of the child=
 list,
> so it's probed first.

So you do not change anything except for the order of child nodes. So
this should be fine and without a compatibility problem.

I added them according to the memory offset so you might want to add a
comment why you moved this because Mr. Structured & Organized might
noticed this one day and move it back.

> Signed-off-by: Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
> ---
> Felipe, Sebastian:
>=20
> I cannot see why the cppi41dma node must be placed inside the
> "ti,am33xx-usb" compatible node. Tried to move it out
> so it's probed just like the edma engine, but the USB doesn't work
> properly in that case.
>=20
> Can you enlighten me?

So If I remember correctly it was a big bag of crap. If you look at the
parent node, you notice that it has a ti,hwmods member while the other
do not have such a property. According to the manual only the whole IP
block as-it has this. It has to be activated if you use one of those
devices this includes the two USB-IP cores and the DMA-IP core. I
didn't manage to come up with something else except to make one parent
node which creates the childs to have a proper relation here.

There was also something with parent - child relation in the way musb
expected it. I think this was only glue code + musb child node and had
nothing to do with the DMA engine. But I am not 100% sure=85

>=20
> In any case, this change is good enough to remove the deferral probe.

Sebastian
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
