From: icenowy-h8G6r0blFSE@public.gmane.org
Subject: Re: [PATCH v2 03/11] drm: sun4i: ignore swapped
 mixer<->tcon connection for DE2
Date: Thu, 08 Jun 2017 13:01:53 +0800
Message-ID: <66881eac1dd06d918692482bdb1ea9e6@aosc.io>
References: <20170604160149.30230-1-icenowy@aosc.io>
 <20170604160149.30230-4-icenowy@aosc.io>
 <20170607093512.rfvpefmyskgjw3ik@flea.lan>
 <01A7F22E-C4FF-4B4B-A9BC-FF0C96B996B9@aosc.io>
 <20170607143827.4ng5gedvzn3f5pyx@flea.lan>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBRFU4PEQKGQE2TABMII-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170607143827.4ng5gedvzn3f5pyx-ZC1Zs529Oq4@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

=E5=9C=A8 2017-06-07 22:38=EF=BC=8CMaxime Ripard =E5=86=99=E9=81=93=EF=BC=
=9A
> On Wed, Jun 07, 2017 at 06:01:02PM +0800, Icenowy Zheng wrote:
>> >I have no idea what this is supposed to be doing either.
>> >
>> >I might be wrong, but I really feel like there's a big mismatch
>> >between your commit log, and what you actually implement.
>> >
>> >In your commit log, you should state:
>> >
>> >A) What is the current behaviour
>> >B) Why that is a problem
>> >C) How do you address it
>> >
>> >And you don't.
>> >
>> >However, after discussing it with Chen-Yu, it seems like you're trying
>> >to have all the mixers probed before the TCONs. If that is so, there's
>> >nothing specific to the H3 here, and we also have the same issue on
>> >dual-pipeline DE1 (A10, A20, A31). Chen-Yu worked on that a bit, but
>> >the easiest solution would be to move from a DFS algorithm to walk
>> >down the graph to a BFS one.
>> >
>> >That way, we would add all mixers first, then the TCONs, then the
>> >encoders, and the component framework will probe them in order.
>>=20
>> No. I said that they're swappable, however, I don't want to
>> implement the swap now, but hardcode 0-0 1-1 connection.
>=20
> We're on the same page, it's definitely not what I was mentionning
> here. This would require a significant rework, and the usecase is
> still unclear for now.
>=20
>> However, as you and Chen-Yu said, device tree should reflect the
>> real hardware, there will be bonus endpoints for the swapped
>> connection.
>=20
> If by bonus you mean connections from mixer 0 to tcon 1 and mixer 1 to
> tcon 0, then yes, we're going to need it.
>=20
>> What I want to do is to ignore the bonus connection, in order to
>> prevent them from confusing the code.
>>=20
>> If you just change the bind sequence, I think it cannot be
>> prevented that wrong connections will be bound.
>=20
> This is where I don't follow you anymore. The component framework
> doesn't list connections but devices. The swapped connections do not
> matter here, we have the same set of devices: mixer0, mixer1, tcon0
> and tcon1.
>=20
> The thing that does change with your patch is that before, the binding
> sequence would have been mixer0, tcon0, tcon1, mixer1. With your
> patch, it's mixer0, tcon0, mixer1, tcon1.
>=20
> So, again, stating what issue you were seeing before making this patch
> would be very helpful to see what you're trying to do / fix.

So maybe I can drop the forward search (searching output) code, and keep
only the backward search (search input) code in TCON?

Forward search code is only used when binding, but backward search is=20
used
for TCON to find connected mixer.

>=20
> Maxime
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
