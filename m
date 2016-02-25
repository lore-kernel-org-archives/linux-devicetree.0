From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3] mtd: atmel_nand: move the hsmc_clk from nfc node to
 nand node
Date: Thu, 25 Feb 2016 20:08:17 +0100
Message-ID: <20160225190817.GK12073@piout.net>
References: <1456207220-7757-1-git-send-email-wenyou.yang@atmel.com>
 <56CC393B.6090801@atmel.com>
 <20160225183139.GL21465@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160225183139.GL21465-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Josh Wu <rainyfeeling-1ViLX0X+lBJBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 25/02/2016 at 10:31:39 -0800, Brian Norris wrote :
> + devicetree, Boris
>=20
> Convenient you left devicetree off, since I expect you'd get a hearty=
 NAK
> from them...
>=20
> On Tue, Feb 23, 2016 at 11:49:31AM +0100, Nicolas Ferre wrote:
> > Le 23/02/2016 07:00, Wenyou Yang a =E9crit :
> > > From: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> > >=20
> > > For SAMA5D3, SAMA5D4 SoC family, PMECC becomes a part of HSMC, th=
ey
> > > need the HSMC clock enabled to work.
> > > The NFC is a sub feature for current nand driver, it can be disab=
led.
> > > But if HSMC clock is controlled by NFC, so disable NFC will also =
disable
> > > the HSMC clock. then, it will make the PMECC fail to work.
> > >=20
> > > So the solution is move the HSMC clock out of NFC to nand node. W=
hen
> > > nand driver probed, it will check whether the chip has HSMC, if y=
es then
> > > it will require a HSMC clock.
> > >=20
> > > Add a new "atmel,sama5d3-nand" compatiable string for SAMA5D3's n=
and.
> > >=20
> > > Signed-off-by: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> > > Signed-off-by: Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> > > ---
> > >=20
> > > Changes in v3:
> > >  - add "atmel,sama5d3-nand" compatiable string for SAMA5D3's nand=
=2E
> > >  - revert the mail address of Josh's Signed-off to the original.
> >=20
> > It seems okay now:
> > Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> >=20
> > Brian, can we take this patch (if you acknowledged it) with us (thr=
ough
> > the arm-soc tree) to keep the synchronization with the DT part of t=
his work?
> > I will also consider squashing the DT part in this one as well as t=
hey
> > cannot be separated.
>=20
> Doesn't that mean you have an illegal breakage of the device tree?
>=20
> Also, if you're going to refactor the binding (and possibly even brea=
k
> it like this), why don't you address the comments Boris made back on =
the
> first version about a year ago?
>=20
> http://patchwork.ozlabs.org/patch/438211/
>=20
> Particularly, I agree that you seem to have the sub-node relationship
> all backward. Why is the controller a sub-node of the flash node? And
> you have no provision for multiple NAND chips?
>=20

Yes, we plan to break that binding even more, we don't have much choice=
=2E
I would agree that it would be better to break it only once though.

--=20
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
