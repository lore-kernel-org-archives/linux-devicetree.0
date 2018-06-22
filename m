From: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH V2 2/4] dt-bindings: arm: fsl: add mu binding doc
Date: Fri, 22 Jun 2018 06:59:04 +0200
Message-ID: <20180622045904.pbklt4mjo54dknxy@pengutronix.de>
References: <1529239789-26849-1-git-send-email-aisheng.dong@nxp.com>
 <1529239789-26849-3-git-send-email-aisheng.dong@nxp.com>
 <20180620194310.GA28983@rob-hp-laptop>
 <20180621074641.sqqvudxebt3hd43m@pengutronix.de>
 <AM0PR04MB4211B39D5AFAB95FC2A91F9980760@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <20180621180857.ozl7n7fcretg6rwi@pengutronix.de>
 <AM0PR04MB42118D2D4B426CF1000964BF80750@AM0PR04MB4211.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0982970642110800408=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <AM0PR04MB42118D2D4B426CF1000964BF80750@AM0PR04MB4211.eurprd04.prod.outlook.com>
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


--===============0982970642110800408==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="syobzhxeuvuf34f3"
Content-Disposition: inline


--syobzhxeuvuf34f3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 22, 2018 at 03:31:11AM +0000, A.s. Dong wrote:
> > -----Original Message-----
> > From: Oleksij Rempel [mailto:o.rempel@pengutronix.de]
> > Sent: Friday, June 22, 2018 2:09 AM
> > To: A.s. Dong <aisheng.dong@nxp.com>
> > Cc: Sascha Hauer <s.hauer@pengutronix.de>; Rob Herring
> > <robh@kernel.org>; Mark Rutland <mark.rutland@arm.com>;
> > devicetree@vger.kernel.org; dongas86@gmail.com; dl-linux-imx <linux-
> > imx@nxp.com>; kernel@pengutronix.de; Fabio Estevam
> > <fabio.estevam@nxp.com>; shawnguo@kernel.org; linux-arm-
> > kernel@lists.infradead.org
> > Subject: Re: [PATCH V2 2/4] dt-bindings: arm: fsl: add mu binding doc
> >=20
> > Hi,
> >=20
> > On Thu, Jun 21, 2018 at 05:11:33PM +0000, A.s. Dong wrote:
> > > Hi Sascha,
> > > > On Wed, Jun 20, 2018 at 01:43:10PM -0600, Rob Herring wrote:
> > > > > On Sun, Jun 17, 2018 at 08:49:47PM +0800, Dong Aisheng wrote:
> > > > > > The Messaging Unit module enables two processors within the SoC
> > > > > > to communicate and coordinate by passing messages (e.g. data,
> > > > > > status and control) through the MU interface.
> > > > > >
> > > > > > ---
> > > > > > v1->v2:
> > > > > >  * typo fixes
> > > > > >  * remove status property
> > > > > >  * remove imx6&7 compatible string which may be added later for
> > > > > >    the generic mailbox binding
> > > > > >
> > > > > > Note: Because MU used by SCU is not implemented as a mailbox
> > > > > > driver, Instead, they're provided in library calls to gain high=
er
> > performance.
> > > > >
> > > > > Using a binding doesn't mean you have to use an OS's subsystem.
> > > > >
> > > > > What needs higher performance? What's the performance difference?
> > > > Why
> > > > > can't the mailbox framework be improved?
> > > >
> > > > From what I see the performance is improved by polling the interrupt
> > > > registers rather than using interrupts.
> > > > I see no reason though why this can't be implemented with the
> > > > mailbox framework as is.
> > > >
> > >
> > > I thought you've agreed to not write generic MU(mailbox) driver for S=
CU.
> > > https://www.spinics.net/lists/arm-kernel/msg650217.html
> > > But seems it's still not quite certain...
> > >
> > > I'd like to explain some more.
> > >
> > > 1) the interrupt mechanism is not quite suitable for SCU firmware
> > > protocol as the transfer size would be more than 4 words and the
> > > response data size is also undetermined (it's set by SCU firmware side
> > during a response).
> > > So polling mode may be the best way to handle this as MU message
> > > handling usually is quite fast in a few microseconds.
> > >
> > > 2) It's true that Mailbox framework is well designed and powerful.
> > > But it's not quite suitable for SCU MU as we don't need to use the
> > > most bits of it. Mailbox seems like to be more suitable for a generic
> > > MU mailbox driver used by various clients/servers.  But SCU MU are
> > > quite specific to SCU protocol and can't be used by other clients (MU
> > > 0~4 is fixed for SCU communication in MX8 HW design).
> > > Even we write a MU Mailbox driver for SCU MU, it's still not a general
> > > one and can't be used by others (e.g. communication with M4).
> > > So I'd believe the current library way is still the best approach for
> > > SCU MU Using. But I'm also okay for another generic MU drivers for
> > > other common communications between A core and M4 side.
> > >
> > > 3) We actually have tried the MU(Mailbox) internally, it increased a
> > > lot complexity comparing to the current library way and got a booting
> > > time regression issue due to extra delays introduced in handling SCU
> > > protocol in mailbox way.
> > >
> > > And finally a nature question to us is:
> > > What the benefit we can get for SCU MU using a mailbox way?
> > >
> > > If we can't find benefits but introduce more complexities then why we
> > > would do that way?
> >=20
> > Looks like my response to same topic within my patch set is lost, so I =
repost it
> > here:
> >=20
> > ok.. let's take some of IMX8 SCU driver code to see if there any differ=
ence:
> >=20
> > ..this part of the code is blocking write procedure for one channeler (=
register
> > or what ever name you prefer) per write.. correct?
> >=20
> > +void mu_send_msg(struct mu_priv *priv, uint32_t index, uint32_t msg) {
> > +	uint32_t mask =3D MU_SR_TE0_MASK >> index;
> > +
> > +	/* Wait TX register to be empty. */
> > +	while (!(readl_relaxed(priv->base + MU_ASR) & mask))
> > +		;
> > +	writel_relaxed(msg, priv->base + MU_ATR0  + (index * 4)); }
> > +EXPORT_SYMBOL_GPL(mu_send_msg);
> >=20
> > According to documentation it is recommended to use only one status bit=
 for
> > the last register to use MU as one big 4words sized pipe.
> > But, there is no way you can write to all 4 registers without checking =
status
> > for each of this register, because your protocol has dynamic message si=
ze. So
> > you are forced to use your one channel as 4 separate channels.
> > Write it part of the message separately and allow your firmware read 1 =
word
> > to understand how to behave on the rest of the message.
> >=20
> > +static void sc_ipc_write(struct sc_ipc *sc_ipc, void *data) {
> > +	sc_rpc_msg_t *msg =3D (sc_rpc_msg_t *) data;
> > +	uint8_t count =3D 0;
> > +
> > +	/* Check size */
> > +	if (msg->size > SC_RPC_MAX_MSG)
> > +		return;
> > +
> > +	/* Write first word */
> > +	mu_send_msg(sc_ipc->mu_base, 0, *((uint32_t *) msg));
> > +	count++;
> >=20
> > .. in this loop you are writing to one channel/register per loop. If the
> > communicate will stall for some reason, the linux system will just free=
ze here
> > without any timeout or error message.. no idea how about the opposite s=
ite.
> >=20
> > +	/* Write remaining words */
> > +	while (count < msg->size) {
> > +		mu_send_msg(sc_ipc->mu_base, count % MU_TR_COUNT,
> > +			    msg->DATA.u32[count - 1]);
> > +		count++;
> > +	}
> > +}
> >=20
> >=20
> > ... and here is a proof that sc_ipc_write will do in some cases 5 rounds
> > (5 * 4 bytes =3D 20 bytes single message) with probable busy waiting fo=
r each
> > channel
> >=20
> > +sc_err_t sc_misc_seco_image_load(sc_ipc_t ipc, uint32_t addr_src,
> > +				 uint32_t addr_dst, uint32_t len, bool fw) {
> > +	sc_rpc_msg_t msg;
> > +	uint8_t result;
> > +
> > +	RPC_VER(&msg) =3D SC_RPC_VERSION;
> > +	RPC_SVC(&msg) =3D (uint8_t)SC_RPC_SVC_MISC;
> > +	RPC_FUNC(&msg) =3D (uint8_t)MISC_FUNC_SECO_IMAGE_LOAD;
> > +	RPC_U32(&msg, 0) =3D addr_src;
> > +	RPC_U32(&msg, 4) =3D addr_dst;
> > +	RPC_U32(&msg, 8) =3D len;
> > +	RPC_U8(&msg, 12) =3D (uint8_t)fw;
> > +	RPC_SIZE(&msg) =3D 5;
> > +
> > +	sc_call_rpc(ipc, &msg, false);
> > +
> > +	result =3D RPC_R8(&msg);
> > +	return (sc_err_t)result;
> > +}
> > +
> >=20
> > So, the same code with mailbox framework will be some thing like this:
> > 1. request all 4 channels in the probe. ignore completion callback and =
set
> > proper timeout.
> >=20
>=20
> That looks a bit strange. As I said in another email, MU physical does no=
t have multi
> Channels (here you mean are virtual channels).  And one whole MU instance=
 is
> Exclusively used by SCU, why we need abstract them into 4 channels to use=
 separately
> with extra unnecessary resource hold and code path executed.

OK, so this MU should configured to use all 4 registers as one channel.
I have nothing against it to do in generic driver.

> > 2. keep your old code by replacing this part.
> > 	/* Write remaining words */
> > 	while (count < msg->size) {
> > 		mbox_send_message(sc_ipc->mbox_chan[count %
> > MU_TR_COUNT],
> > msg->DATA.u32[count - 1]);
> > 		count++;
> > 	}
> >=20
> > The advantage of this variant. If SCU firmware will stall, the linux wi=
ll be able
> > to notify about it without blocking complete system.
> >=20
>=20
> This part of code has been used for a long time and we've never met the s=
tall
> Issue which means SCU firmware guarantee it well. But I agree a timeout
> mechanism Is better. However,  if only for this reason, we can simply add=
 a
> timeout mechanism in MU library function as well, but still is far from a=
 strong
> enough reason to switch to a more complexed mailbox one.

At this point a have absolutely zero tolerance. At the end I was one on
poor devs hunting similar kind of stalls.
Believe me, what can theoretically with 1% probability happen in the lab,
will end with days/months of bug hunting work and thousands of field
returns.

> > Can you please provide (if possible) your old mailbox based implementat=
ion.
> > I'm curious to see why it is slow.
>=20
> In our implementation:
> 1) One channel per MU
> 2) Tx using the same way to send msg as sc_ipc_write() in polling mode
> 3) Rx enables the first word interrupt and polling for the rest of them in
> a hrtimer.
>=20
> The possible extra cost comparing to simple polling way:
> 1) Extra unnecessary code execution path of mailbox which is not used by =
SCU MU
> 2) Interrupt latency
> 3) Extra memory copy handling RX message separately.
> 4) Extra schedule of hrtimer polling
>=20
> Some of them probably could be optimized. However, besides the slow probl=
em,
> the extra unnecessary complexity and can't be generic (specific to SCU) a=
re also
> important ones.=20
>=20
> And the MU general purpose interrupt feature and general purpose flags fe=
ature
> may also not supported by mailbox well.

Ok, I give up.
Can we at least try to provide one device tree binding documentation for th=
at?
At the end, it is one and the same HW IP block spread in one SoC=20
(or different SoCs) an be used in different way. How exactly it will
be used is the choice of the developer/customer/user...
even if it will be described withing mailbox section dos not mean you are
forced to use mailbox framework.

Lets imagine worst case scenario and all of MU on i.MX8 are used by
different drivers. In my mailbox binding I suggest to use
<vendor>,<soc>-mu-<mu side>. On i.MX7 there is only one MU, so it looks
like "fsl,imx7s-mu-a" and "fsl,imx7s-mu-b". i.MX8 has multiple MU so
it should be enumerated. Probably it will look like: "fsl,imx8x-mu0-a".
Do it make sense for you? Can we find and agreement here? :)

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--syobzhxeuvuf34f3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEpENFL0P3hvQ7p0DDdQOiSHVI77QFAlssghAACgkQdQOiSHVI
77QVwggAjCK0DdYSAmqwVkpi2IvTdtGgu9TT+9tr/Ol+RvFPT4rm4b+7kEdnov2U
BGYQ7+U6QNq9GlUbAfQeQzfzzdbolumesGvyXd8u0UutqC/NMyzOWPju7mbczDT7
g37i7XHFxjhvgrpB7Y4GMeqGLB6FSxKnpyuBdErYOx1hyXYMMgEhwBFZ5G2BVO47
rwA6kG8TviDQ5UM5P9vgTRCv4cb/kCw13EudWtJ3stdvr9vQa2jYVZoHJOLnAa4H
6IGLzjxK7qSDcnZwTz4CD4+/FtYAJHLzKXDgnt6qTnMsQA8EJMrLUVbPjXxYu3KK
dqZDDRzstVtv30wshn+IBUpU+FAFQg==
=eVLw
-----END PGP SIGNATURE-----

--syobzhxeuvuf34f3--


--===============0982970642110800408==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0982970642110800408==--
