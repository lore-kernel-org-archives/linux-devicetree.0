From: Horng-Shyang Liao <hs.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v9 1/4] dt-bindings: soc: Add documentation for the
 MediaTek GCE unit
Date: Mon, 11 Jul 2016 10:55:05 +0800
Message-ID: <1468205705.11509.15.camel@mtksdaap41>
References: <1467270883-1407-1-git-send-email-hs.liao@mediatek.com>
	 <1467270883-1407-2-git-send-email-hs.liao@mediatek.com>
	 <1467973066.2472.238.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1467973066.2472.238.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jan =?ISO-8859-1?Q?L=FCbbe?= <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Monica Wang <monica.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jiaguang Zhang <jiaguang.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Nicolas Boichat <drinkcat-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, cawa cheng <cawa.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Bibby Hsieh <bibby.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Damon Chu <damon.chu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Daoyuan Huang <daoyuan.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Glory Hung <glory.hung-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, CK HU <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Josh-YC Liu <josh-yc.liu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dennis-YC Hsieh <dennis-yc.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Jan,

On Fri, 2016-07-08 at 12:17 +0200, Jan L=C3=BCbbe wrote:
> On Do, 2016-06-30 at 15:14 +0800, HS Liao wrote:
> [...]
> > +Required properties:
> > +- compatible: Must be "mediatek,mt8173-gce"
> > +- reg: Address range of the GCE unit
> > +- interrupts: The interrupt signal from the GCE block
> > +- clock: Clocks according to the common clock binding
> > +- clock-names: Must be "gce" to stand for GCE clock
> > +- #mbox-cells: Should be 1
> [...]
> > +		#mbox-cells =3D <1>;
> [...]
> > +		mediatek,gce =3D <&gce>;
> > +		mboxes =3D <&gce 0 1 /* main display with merging wfe */
> > +			  &gce 1 1>; /* sub display with merging wfe */
>=20
> It seems that you use two cells instead of one as you declared above.
> This should be consistent.

Will correct it as 2.

> Also, why do you need an explicit phandle to the gce if you already u=
se
> mailboxes?

"mediatek,gce" should be added to all clients which ask gce to access=20
their registers.

"mboxes" should be added to all clients which will communicate with gce
via mailbox.

=46or example, if mmsys send cmdq tasks to ask gce to write registers o=
f=20
mmsys and ovl, mmsys should have "mediatek,gce" and "mboxes", and ovl
should have "mediatek,gce".

I will explain their difference in GCE's device tree document.

> Best regards,
> Jan L=C3=BCbbe

Thanks,
HS

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
