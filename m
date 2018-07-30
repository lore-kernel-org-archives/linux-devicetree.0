From: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v7 3/6] dt-bindings: mailbox: imx-mu: add generic MU
 channel support
Date: Mon, 30 Jul 2018 18:49:28 +0200
Message-ID: <20180730164928.sb3sgnfxueeiqfsq@pengutronix.de>
References: <CABb+yY1EkHk85H72xYoYA3JbQL03+-o3UcRVdA_Zub-Q+D=OHw@mail.gmail.com>
 <VI1PR04MB422216469EE5F3ED8E53A4F1802A0@VI1PR04MB4222.eurprd04.prod.outlook.com>
 <CABb+yY0SfdFr8TMOMosTVb5+LFWqB8nQkKj3ze8usi-s7Cko4g@mail.gmail.com>
 <VI1PR04MB4222B4877B341C0FA07A6A8D802A0@VI1PR04MB4222.eurprd04.prod.outlook.com>
 <CABb+yY1MSSQKZ6BOQXC-x=qy4VZ5HqDBjmh_BJTXSkAm3+P8mA@mail.gmail.com>
 <bf7aca98-7ec8-bcf3-b1a8-d86a7cf28d31@pengutronix.de>
 <CABb+yY3PLcjduxm7uJ9xZpPP2zkcQ5Qngs4PjnhGAXp43QVzFA@mail.gmail.com>
 <20180730144435.srxgohwgdhrmw2rz@pengutronix.de>
 <CABb+yY0sUxGatozwdQVM55z7ACtpK8HCepnfvQNunQ=r5y_kVw@mail.gmail.com>
 <CABb+yY04dm_N1Ud2Mhi-g-eFdNVkxJKE8ONOqntZjN_QKwgLcg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0273936801704518440=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CABb+yY04dm_N1Ud2Mhi-g-eFdNVkxJKE8ONOqntZjN_QKwgLcg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: "A.s. Dong" <aisheng.dong@nxp.com>, Mark Rutland <mark.rutland@arm.com>, Devicetree List <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, ", linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 srv_heupstream" <linux-mediatek@lists.infradead.org>",
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 srv_heupstream" <linux-arm-kernel@lists.infradead.org>, ",
 Sascha Hauer" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org


--===============0273936801704518440==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lz4k2cqqqi3ew2ll"
Content-Disposition: inline


--lz4k2cqqqi3ew2ll
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 30, 2018 at 09:48:35PM +0530, Jassi Brar wrote:
> On Mon, Jul 30, 2018 at 8:32 PM, Jassi Brar <jassisinghbrar@gmail.com> wr=
ote:
> > On Mon, Jul 30, 2018 at 8:14 PM, Oleksij Rempel <o.rempel@pengutronix.d=
e> wrote:
> >> On Mon, Jul 30, 2018 at 06:34:56PM +0530, Jassi Brar wrote:
> >>> On Mon, Jul 30, 2018 at 1:05 PM, Oleksij Rempel <o.rempel@pengutronix=
=2Ede> wrote:
> >>> > Hi Aishen, Jassie,
> >>> >
> >>> > i'm lost in this discussion. Please, as soon as I need to add some
> >>> > changes to my patches, notify me. Preferably on top for email.
> >>> >
> >>> I am ok with however you choose to implement, 8 unidirectional or 4
> >>> bidirectional channels or whatever.
> >>>
> >>> We just can't have protocol specific s/w modes in the controller driv=
ers.
> >>>
> >>> The best solution is to fix the SCU firmware. If that is _really_
> >>> impossible, I provided a solution (3 cells work around). If you have a
> >>> better idea please feel free to propose and implement that.
> >>>
> >>> It will also help if you could share the user code of "scu-mode". If
> >>> there is no such code (and we know the driver doesn't respect the
> >>> "scu-mode" property) why do we even have that binding? Maybe drop it.
> >>
> >> Tomorrow I have a time slot to address your generic iMX MU suggestions.
> >> So, what is better, uni- or bi-directional channels?
> >>
> > The datasheet indicates there are 4 tx and 4 rx channels. So 8
> > uni-directional channels (which allow more fine-grained/efficient
> > resource allocation btw).
> >
> >> Should I implement
> >> *all* (4TX+FIFO, 4RX+FIFO, 4TX-simple, 4RX-simple) channels in this ru=
n?
> >>
> > From datasheet, each of 8 channels should be defined as signal+data
> > i.e, IRQ + TX/RX_Reg.
> > The rest 4 GP channels are doorbells (irq only).
> >
> > So we can have 2-cells.
> >     First cell is 0->Tx, 1->RX, 2->Doorbell
> >     Second cell is index of the channel {0,3}
> >
> > Now you may implement only RX+TX, and leave 'doorbell' out for future.
> > Thats ok, because we wouldn't have to change bindings then.
> >
> > However, if SCU (in its current form) must be supported. We may need
> > to add the third cell (irq enable or not) or some better way, right
> > now.
> >
> Looking at imx_mu_scu_send_data(), which simply polls on the tx, I
> think we don't even need third cell for scu client. A simple 2-cell, 8
> uni-dir channel setup should work.
> If I see the scu client driver, I could confirm how it would work.
>=20
> So, lets please do the 8 uni-directional, 2 cells implementation.

Just in case.. to avoid confusion (or add more...). There are 4 GIP (Genera=
l Interrupt Request n
Pending bits) or RX-doorbell and 4 GIR (General Interrupt Request bits)
or TX-doorbell.

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--lz4k2cqqqi3ew2ll
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEpENFL0P3hvQ7p0DDdQOiSHVI77QFAltfQZUACgkQdQOiSHVI
77TH6ggAjngMTAufzxtnOiuf2lgPY7uQbR+ZlY+a9cFHecjSibGiB9qkbsn+r9V5
aWWcXBorzjkBKWPSJ9G7VR2YF6yBfVEqyAvsb6DSviaipjkfNK3rpUh7zUb7S+qe
4aE0TFtK+RvnIYz1b3R6ZJFxseWRE9ivGbteRPg2rFkhCG8nUcQ9gXTa9bYeIspp
TsgMxx24uUv6xTHnlXiGPBaf/itLotvh7Prri71bHpZmAbmA1Zb7Sdwa3sbsybSU
WnAyoyylfMviDwjeNfbJUm15yZjYqX9yZGU5SfizkSvuCPCFgPi722bCXBYSABCp
KJbVg+kjaF6FI8oqkoT+5mgHZlrmbg==
=CDs6
-----END PGP SIGNATURE-----

--lz4k2cqqqi3ew2ll--


--===============0273936801704518440==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0273936801704518440==--
