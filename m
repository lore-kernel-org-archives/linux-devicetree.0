From: Ricard Wanderlof <ricard.wanderlof-VrBV9hrLPhE@public.gmane.org>
Subject: Re: [PATCH 3/4] mtd: nand: Add support for Evatronix
 NANDFLASH-CTRL
Date: Fri, 10 Jun 2016 18:00:36 +0200
Message-ID: <alpine.DEB.2.02.1606101743110.30757@lnxricardw1.se.axis.com>
References: <alpine.DEB.2.02.1606020948070.19416@lnxricardw1.se.axis.com> <20160603165909.09f27ee0@bbrezillon> <alpine.DEB.2.02.1606071702220.19416@lnxricardw1.se.axis.com> <20160609110814.78823ef3@bbrezillon> <alpine.DEB.2.02.1606091313490.6751@lnxricardw1.se.axis.com>
 <20160610173426.48960ad1@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160610173426.48960ad1@bbrezillon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>, Linux mtd <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Benoit Cousson <bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Fri, 10 Jun 2016, Boris Brezillon wrote:

> The goal here is to retrieve the controller attached to a given chip =
in
> order to avoid the global nfc_info variable (and abusing
> nand_get/set_controller_data() to store a pointer to the controller i=
s
> not a good idea either: it's supposed to be used to store per-chip
> private data).

> Then, let's say I really care about this clear separation between NAN=
D
> controllers and NAND chips (even if the controller is only supporting=
 a
> single device), because it makes things clearer, and because it bring=
s
> some consistency in the NAND controller drivers.
> That's something I've asked to other contributors, and I'm asking it =
to
> you too.

Certainly. As I said, I'm not trying to get away from doing it if there=
's=20
any motivation for it which there clearly is.

> You'll see that implementing this separation is not much more
> complicated than having this global variable, and I must admit global
> variable make me scream (especially when they can be avoided).

Yes, I see now. With struct nand_hw_control in the proper place it allo=
ws=20
a translation from a struct nand_chip * to a future non-global struct=20
nfc_info * . Yeah, I would probably have stumbled upon this when rewrit=
ing=20
it.
=20
> > > But this is not there yet, and in the meantime, if possible, I'd =
prefer
> > > seeing drivers implementing the ->cmd_ctrl() function instead of
> > > overloading the default ->cmdfunc() implementation. =20
> >=20
> > I see, I suppose that's because during the course of this the ->cmd=
func()=20
> > logic will be significantly changed, requiring corresponding change=
s in=20
> > drivers that do overload that function? Fair enough, that's a prett=
y good=20
> > reason, probably more so than the alleged simplicity of the ->cmd_c=
trl()=20
> > interface.
>=20
> There's another reason actually. We have chip specific functions (lik=
e
> ->setup_read_retry()) which might want to use
> non-standard/vendor-specific operations, and this implies patching al=
l
> ->cmdfunc() implementations, or at least making sure they will work
> fine with these new commands.

I see.=20

> So yes, I'm clearly trying to avoid specific ->cmdfunc() (especially
> when they are not generic enough to support new commands).

Yes, makes sense.=20

> Again, ->cmd_ctrl() does not have to be used in your internal
> ecc->read/write_page() implementations (all you'll have to do is avoi=
d
> using the ->cmdfunc() method and create your own NAND controller
> specific commands instead), but it should at least be used for basic
> operations that do not require high performances (i.e. NAND detection=
,
> NAND RESET, read-retry, ...).

Ok, good.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
