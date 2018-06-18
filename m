From: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v2 2/4] dt-bindings: mailbox: provide imx-mailbox
 documentation
Date: Mon, 18 Jun 2018 13:51:53 +0200
Message-ID: <acce6810-65d7-4264-13d0-ad405639cd6f@pengutronix.de>
References: <20180615095107.24610-1-o.rempel@pengutronix.de>
 <20180615095107.24610-3-o.rempel@pengutronix.de>
 <9d436d3a9c534b0c7af339aa13e91c1293a55503.camel@nxp.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8240763361714343022=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <9d436d3a9c534b0c7af339aa13e91c1293a55503.camel@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Leonard Crestez <leonard.crestez@nxp.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "A.s. Dong" <aisheng.dong@nxp.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Richard Zhu <hongxing.zhu@nxp.com>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============8240763361714343022==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="CrmCHUZCCgEARE9OXaeSwcH5SK5IueJaT"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--CrmCHUZCCgEARE9OXaeSwcH5SK5IueJaT
Content-Type: multipart/mixed; boundary="OxXuGUNF13ExLsUB86qDoljtHyQBvtpGV";
 protected-headers="v1"
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Leonard Crestez <leonard.crestez@nxp.com>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "A.s. Dong" <aisheng.dong@nxp.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Richard Zhu <hongxing.zhu@nxp.com>,
 dl-linux-imx <linux-imx@nxp.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 Fabio Estevam <fabio.estevam@nxp.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Message-ID: <acce6810-65d7-4264-13d0-ad405639cd6f@pengutronix.de>
Subject: Re: [PATCH v2 2/4] dt-bindings: mailbox: provide imx-mailbox
 documentation
References: <20180615095107.24610-1-o.rempel@pengutronix.de>
 <20180615095107.24610-3-o.rempel@pengutronix.de>
 <9d436d3a9c534b0c7af339aa13e91c1293a55503.camel@nxp.com>
In-Reply-To: <9d436d3a9c534b0c7af339aa13e91c1293a55503.camel@nxp.com>

--OxXuGUNF13ExLsUB86qDoljtHyQBvtpGV
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Leonard,

On 18.06.2018 10:53, Leonard Crestez wrote:
> On Fri, 2018-06-15 at 11:51 +0200, Oleksij Rempel wrote:
>> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
>> ---
>>  .../bindings/mailbox/imx-mailbox.txt          | 35 ++++++++++++++++++=
+
>>  1 file changed, 35 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mailbox/imx-mail=
box.txt
>=20
> A recent patch was posted which adds a similar but different binding
> for the MU on 8qm/8qxp SOCs:
>=20
> https://patchwork.kernel.org/patch/10468885/
>=20
> Looking at manuals side-by-side the hardware seems to be the same so
> there should be a single binding. Right?

yes. This is why it make no sense to create imx8 specific MU driver.

> That series I pointed to uses the MU to implement a communication with
> a special "SCU" core which runs NXP firmware for handling details like
> power management. However imx8 socs also have other MUs and M4 cores
> for customers to use pretty exactly like they would on 7d.
>=20
> The hardware exposes a very generic interface and my impression is that=

>  drivers for the MU are actually highly specific to what is on the
> other side of the MU. For example your driver code seems to be mapping
> the 4 MU registers to separate "channels" but for SCU messages are
> written in all registers in a round-robin way.

ok.. let's take some of IMX8 SCU driver code to see if there any differen=
ce:

-- this part of the code is blocking write procedure for one channeler
per write-- correct?
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

--- in this loop we are writing to one channel per loop and waiting
until the channel was done ----

+	/* Write remaining words */
+	while (count < msg->size) {
+		mu_send_msg(sc_ipc->mu_base, count % MU_TR_COUNT,
+			    msg->DATA.u32[count - 1]);
+		count++;
+	}
+}


=2E.. and here is a proof that sc_ipc_write will do in some cases 5 round=
s
(5 * 4 bytes =3D 20 bytes single message) with probable busy waiting for
each channel, which make me think that shared memory would be a better de=
al.

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

	/* Write remaining words */
	while (count < msg->size) {
		mbox_send_message(sc_ipc->mbox_chan[count % MU_TR_COUNT],
msg->DATA.u32[count - 1]);
		count++;
	}

to provide identical behavior we should set mbox_client->tx_block =3D tru=
e
and implement polling mode in the mailbox driver.

Please note. I don't think sc_ipc_write() implementation is good. I just
don't expect it will be ever changed.

> Shouldn't your MU-using driver be a separate node which references the
> MU by phandle? Like in this patch:

sure. But it is generic, not mailbox controller specific and make no
sense to describe client binding again in the controller binding.

> https://patchwork.kernel.org/patch/10468887/
>=20
>> diff --git a/Documentation/devicetree/bindings/mailbox/imx-mailbox.txt=
 b/Documentation/devicetree/bindings/mailbox/imx-mailbox.txt
>> new file mode 100644
>> index 000000000000..1577b86f1206
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mailbox/imx-mailbox.txt
>> @@ -0,0 +1,35 @@
>> +i.MX Messaging Unit
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +The i.MX Messaging Unit (MU) contains two register sets: "A" and "B".=
 In most
>> +cases they are accessible from all Processor Units. On one hand, at l=
east for
>> +mailbox functionality, it makes no difference which application or pr=
ocessor is
>> +using which set of the MU. On other hand, the register sets for each =
of the MU
>> +parts are not identical.
>> +
>> +Required properties:
>> +- compatible :	Shell be one of:
>> +                    "fsl,imx7s-mu-a" and "fsl,imx7s-mu-b" for i.MX7S =
or i.MX7D
>> +- reg :		physical base address of the mailbox and length of
>> +		memory mapped region.
>> +- #mbox-cells:	Common mailbox binding property to identify the number=

>> +		of cells required for the mailbox specifier. Should be 1.
>> +- interrupts :	The interrupt number
>> +- clocks     :  phandle to the input clock.
>> +
>> +Example:
>> +	mu0a: mailbox@30aa0000 {
>> +		compatible =3D "fsl,imx7s-mu-a";
>> +		reg =3D <0x30aa0000 0x28>;
>> +		interrupts =3D <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
>> +		clocks =3D <&clks IMX7D_MU_ROOT_CLK>;
>> +		#mbox-cells =3D <1>;
>> +	};
>> +
>> +	mu0b: mailbox@30ab0000 {
>> +		compatible =3D "fsl,imx7s-mu-b";
>> +		reg =3D <0x30ab0000 0x28>;
>> +		interrupts =3D <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
>> +		clocks =3D <&clks IMX7D_MU_ROOT_CLK>;
>> +		#mbox-cells =3D <1>;
>> +	};


--OxXuGUNF13ExLsUB86qDoljtHyQBvtpGV--

--CrmCHUZCCgEARE9OXaeSwcH5SK5IueJaT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEpENFL0P3hvQ7p0DDdQOiSHVI77QFAlsnnNkACgkQdQOiSHVI
77TlfQf/QvHVujeBc82qLVpMABD3TPkXMrORiGwE+F2y9mNaDSxlYe2cTO0xiZjK
L1DRkJiv/NIYKZQh9Qqz2iMtdKTMwV/q0TgUrDqxC8E4IBXaMfMkppEAnnvv/Sxf
TasB1iMY0eqhQVgE2A+Q5v2gb+U1NBc81RuJ/SMKzYhAqnMe5xUFz9y0TQemJH76
A4exdWYBnroY+RW8UOVgql/Dbj0MPyVa08uZ6Exj8+lEMT8dWFQ8BYtafe1vAJE8
/B8gROm+rMXYw2eYS+yIyRXb94ftpmBJ2QVR+NYv15Qu6QY6HOj/CNoUvrC3mI0K
9Xb8XE5isbcEB1vmxGXW0uxEL43tRw==
=w7T/
-----END PGP SIGNATURE-----

--CrmCHUZCCgEARE9OXaeSwcH5SK5IueJaT--


--===============8240763361714343022==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8240763361714343022==--
