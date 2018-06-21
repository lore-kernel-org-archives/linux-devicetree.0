From: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH V2 2/4] dt-bindings: arm: fsl: add mu binding doc
Date: Thu, 21 Jun 2018 20:08:57 +0200
Message-ID: <20180621180857.ozl7n7fcretg6rwi@pengutronix.de>
References: <1529239789-26849-1-git-send-email-aisheng.dong@nxp.com>
 <1529239789-26849-3-git-send-email-aisheng.dong@nxp.com>
 <20180620194310.GA28983@rob-hp-laptop>
 <20180621074641.sqqvudxebt3hd43m@pengutronix.de>
 <AM0PR04MB4211B39D5AFAB95FC2A91F9980760@AM0PR04MB4211.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9135415002118967534=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <AM0PR04MB4211B39D5AFAB95FC2A91F9980760@AM0PR04MB4211.eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "A.s. Dong" <aisheng.dong@nxp.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, "dongas86@gmail.com" <dongas86@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--===============9135415002118967534==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="klxkloccgpcekjfo"
Content-Disposition: inline


--klxkloccgpcekjfo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jun 21, 2018 at 05:11:33PM +0000, A.s. Dong wrote:
> Hi Sascha,
> > On Wed, Jun 20, 2018 at 01:43:10PM -0600, Rob Herring wrote:
> > > On Sun, Jun 17, 2018 at 08:49:47PM +0800, Dong Aisheng wrote:
> > > > The Messaging Unit module enables two processors within the SoC to
> > > > communicate and coordinate by passing messages (e.g. data, status
> > > > and control) through the MU interface.
> > > >
> > > > ---
> > > > v1->v2:
> > > >  * typo fixes
> > > >  * remove status property
> > > >  * remove imx6&7 compatible string which may be added later for
> > > >    the generic mailbox binding
> > > >
> > > > Note: Because MU used by SCU is not implemented as a mailbox driver,
> > > > Instead, they're provided in library calls to gain higher performan=
ce.
> > >
> > > Using a binding doesn't mean you have to use an OS's subsystem.
> > >
> > > What needs higher performance? What's the performance difference?
> > Why
> > > can't the mailbox framework be improved?
> >=20
> > From what I see the performance is improved by polling the interrupt
> > registers rather than using interrupts.
> > I see no reason though why this can't be implemented with the mailbox
> > framework as is.
> >=20
>=20
> I thought you've agreed to not write generic MU(mailbox) driver for SCU.
> https://www.spinics.net/lists/arm-kernel/msg650217.html
> But seems it's still not quite certain...
>=20
> I'd like to explain some more.
>=20
> 1) the interrupt mechanism is not quite suitable for SCU firmware protocol
> as the transfer size would be more than 4 words and the response data size
> is also undetermined (it's set by SCU firmware side during a response).
> So polling mode may be the best way to handle this as MU message
> handling usually is quite fast in a few microseconds.
>=20
> 2) It's true that Mailbox framework is well designed and powerful.
> But it's not quite suitable for SCU MU as we don't need to use the most
> bits of it. Mailbox seems like to be more suitable for a generic MU
> mailbox driver used by various clients/servers.  But SCU MU are
> quite specific to SCU protocol and can't be used by other clients
> (MU 0~4 is fixed for SCU communication in MX8 HW design).=20
> Even we write a MU Mailbox driver for SCU MU, it's still not a general
> one and can't be used by others (e.g. communication with M4).
> So I'd believe the current library way is still the best approach for SCU=
 MU
> Using. But I'm also okay for another generic MU drivers for other common
> communications between A core and M4 side.
>=20
> 3) We actually have tried the MU(Mailbox) internally, it increased a lot
> complexity comparing to the current library way and got a booting time
> regression issue due to extra delays introduced in handling SCU protocol
> in mailbox way.
>=20
> And finally a nature question to us is:=20
> What the benefit we can get for SCU MU using a mailbox way?
>=20
> If we can't find benefits but introduce more complexities then why
> we would do that way?

Looks like my response to same topic within my patch set is lost, so I
repost it here:

ok.. let's take some of IMX8 SCU driver code to see if there any difference:

=2E.this part of the code is blocking write procedure for one
channeler (register or what ever name you prefer) per write.. correct?

+void mu_send_msg(struct mu_priv *priv, uint32_t index, uint32_t msg)
+{
+	uint32_t mask =3D MU_SR_TE0_MASK >> index;
+
+	/* Wait TX register to be empty. */
+	while (!(readl_relaxed(priv->base + MU_ASR) & mask))
+		;
+	writel_relaxed(msg, priv->base + MU_ATR0  + (index * 4));
+}
+EXPORT_SYMBOL_GPL(mu_send_msg);

According to documentation it is recommended to use only one status bit
for the last register to use MU as one big 4words sized pipe.
But, there is no way you can write to all 4 registers without checking stat=
us
for each of this register, because your protocol has dynamic message
size. So you are forced to use your one channel as 4 separate channels.
Write it part of the message separately and allow your firmware read 1
word to understand how to behave on the rest of the message.

+static void sc_ipc_write(struct sc_ipc *sc_ipc, void *data)
+{
+	sc_rpc_msg_t *msg =3D (sc_rpc_msg_t *) data;
+	uint8_t count =3D 0;
+
+	/* Check size */
+	if (msg->size > SC_RPC_MAX_MSG)
+		return;
+
+	/* Write first word */
+	mu_send_msg(sc_ipc->mu_base, 0, *((uint32_t *) msg));
+	count++;

=2E. in this loop you are writing to one channel/register per loop. If
the communicate will stall for some reason, the linux system will just
freeze here without any timeout or error message.. no idea how about the
opposite site.

+	/* Write remaining words */
+	while (count < msg->size) {
+		mu_send_msg(sc_ipc->mu_base, count % MU_TR_COUNT,
+			    msg->DATA.u32[count - 1]);
+		count++;
+	}
+}


=2E.. and here is a proof that sc_ipc_write will do in some cases 5 rounds
(5 * 4 bytes =3D 20 bytes single message) with probable busy waiting for
each channel

+sc_err_t sc_misc_seco_image_load(sc_ipc_t ipc, uint32_t addr_src,
+				 uint32_t addr_dst, uint32_t len, bool fw)
+{
+	sc_rpc_msg_t msg;
+	uint8_t result;
+
+	RPC_VER(&msg) =3D SC_RPC_VERSION;
+	RPC_SVC(&msg) =3D (uint8_t)SC_RPC_SVC_MISC;
+	RPC_FUNC(&msg) =3D (uint8_t)MISC_FUNC_SECO_IMAGE_LOAD;
+	RPC_U32(&msg, 0) =3D addr_src;
+	RPC_U32(&msg, 4) =3D addr_dst;
+	RPC_U32(&msg, 8) =3D len;
+	RPC_U8(&msg, 12) =3D (uint8_t)fw;
+	RPC_SIZE(&msg) =3D 5;
+
+	sc_call_rpc(ipc, &msg, false);
+
+	result =3D RPC_R8(&msg);
+	return (sc_err_t)result;
+}
+

So, the same code with mailbox framework will be some thing like this:
1. request all 4 channels in the probe. ignore completion callback and
set proper timeout.

2. keep your old code by replacing this part.
	/* Write remaining words */
	while (count < msg->size) {
		mbox_send_message(sc_ipc->mbox_chan[count % MU_TR_COUNT],
msg->DATA.u32[count - 1]);
		count++;
	}

The advantage of this variant. If SCU firmware will stall, the linux
will be able to notify about it without blocking complete system.

Can you please provide (if possible) your old mailbox based
implementation. I'm curious to see why it is slow.

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--klxkloccgpcekjfo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEpENFL0P3hvQ7p0DDdQOiSHVI77QFAlsr6bUACgkQdQOiSHVI
77R2FQf/ZQVj/ITEhmt0dWtvUecQivOA7UxtCkJr12250UphWq+cX06manwOPDdG
OTl05foSl+ctbw4U6vNPRYXdvio24qOavduy/AhslVKy+5yc4Ml9tTTSJWltRdrk
g2DHEnTzgmIw6PKvrwr1WqussSdjvYNs827PP0e063tIzz7U5Fk15BB7ry9tKI6B
EHRPPQOOnBvir+nmDsyf1spQiDGnu9y9YX4vQgr/mx60Lj3hd2nIUclli7M2CSfa
Uy+Y2ZCr3p0biKXNixv3LvTRcQiF0dEk+dE5SCuHlqC/uj4sEdCn3Ke+v1EdatPW
6lXxjx8nO7ztuepORwxJoPyXw7vyNg==
=3WTa
-----END PGP SIGNATURE-----

--klxkloccgpcekjfo--


--===============9135415002118967534==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============9135415002118967534==--
