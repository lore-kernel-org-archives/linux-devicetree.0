From: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v8 4/4] mailbox: Add support for i.MX7D messaging unit
Date: Wed, 1 Aug 2018 07:31:25 +0200
Message-ID: <20180801053125.gmdgojgejyremaul@pengutronix.de>
References: <20180731141146.10788-1-o.rempel@pengutronix.de>
 <20180731141146.10788-5-o.rempel@pengutronix.de>
 <CABb+yY2PN=LN3bgTTzL9SpA43atughAbS1OjNsg0XZg42JxD3w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0143999268357465138=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CABb+yY2PN=LN3bgTTzL9SpA43atughAbS1OjNsg0XZg42JxD3w@mail.gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, "A.s. Dong" <aisheng.dong@nxp.com>, Devicetree List <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, ", linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 srv_heupstream" <linux-arm-kernel@lists.infradead.org>, ",
 Sascha Hauer" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org


--===============0143999268357465138==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yrg2wi6yucjqikoi"
Content-Disposition: inline


--yrg2wi6yucjqikoi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 31, 2018 at 09:51:37PM +0530, Jassi Brar wrote:
> Hi Oleksij,
>=20
>  A fast and fine turnaround! Mostly nits and a suggestion follows ...
>=20
> On Tue, Jul 31, 2018 at 7:41 PM, Oleksij Rempel <o.rempel@pengutronix.de>=
 wrote:
> > The Mailbox controller is able to send messages (up to 4 32 bit words)
> > between the endpoints.
> >
> > This driver was tested using the mailbox-test driver sending messages
> > between the Cortex-A7 and the Cortex-M4.
> >
> Do we need something MU specific here?
> I mean MU doesn't really care if the endpoints are CA, CR or CM. So,
> maybe just the two-line ritual intro to MU?

Till now, every additional word about MU added more disagreement in this
topic. I prefer the reduced variant.

>=20
> > +enum imx_mu_chan_type {
> > +       IMX_MU_TYPE_TX,         /* Tx with FIFO */
> > +       IMX_MU_TYPE_RX,         /* Rx with FIFO */
> >
> nit: its a register, not fifo

ok

>=20
> > +
> > +static void imx_mu_txdb_work(struct work_struct *work)
> > +{
> > +       struct imx_mu_con_priv *cp =3D
> > +                       container_of(work, struct imx_mu_con_priv, work=
);
> > +       mbox_chan_txdone(cp->chan, 0);
> > +}
> >
> The api assumes a controller have same type of channels. So we are
> having to do this here.
> I am not sure, but would declaring two mailbox controllers (one with
> doorbells and the other data channels) work?

I was thinking about it and decided that this pain was not worth it.

> If not, at least we could use a tasklet instead of a work queue?

ok. probably it is better to fix the mailbox framework.... may be not right
now.

>=20
> > +static bool imx_mu_last_tx_done(struct mbox_chan *chan)
> > +{
> > +       struct imx_mu_priv *priv =3D to_imx_mu_priv(chan->mbox);
> > +       struct imx_mu_con_priv *cp =3D chan->con_priv;
> > +
> > +       /* test if transmit register is empty */
> > +       return imx_mu_read(priv, IMX_MU_xSR) & IMX_MU_xSR_TEn(cp->idx);
> > +}
> > +
> > +static int imx_mu_send_data(struct mbox_chan *chan, void *data)
> > +{
> > +       struct imx_mu_priv *priv =3D to_imx_mu_priv(chan->mbox);
> > +       struct imx_mu_con_priv *cp =3D chan->con_priv;
> > +       u32 *arg =3D data;
> > +
> > +       switch (cp->type) {
> > +       case IMX_MU_TYPE_TX:
> > +               if (!imx_mu_last_tx_done(chan))
> > +                       return -EBUSY;
> >
> This test should be moved to imx_mu_startup().
> The api won't ever call if last tx was not done, and so it doesn't
> know how to recover from send_data() failure.

ok.

>=20
> > +
> > +static int imx_mu_startup(struct mbox_chan *chan)
> > +{
> > +       struct imx_mu_priv *priv =3D to_imx_mu_priv(chan->mbox);
> > +       struct imx_mu_con_priv *cp =3D chan->con_priv;
> > +       int ret;
> > +
> > +       if (cp->type =3D=3D IMX_MU_TYPE_TXDB) {
> > +               /* Tx doorbell don't have ACK support */
> > +               INIT_WORK(&cp->work, imx_mu_txdb_work);
> > +               return 0;
> > +       }
> > +
> > +       cp->irq_desc =3D kasprintf(GFP_KERNEL, "imx_mu_chan[%i-%i]", cp=
->type,
> > +                                cp->idx);
> > +       if (!cp->irq_desc)
> > +               return -ENOMEM;
> >
> Probably you won't do but still .... name of irq is but one channel
> property. So you could set it in probe() and avoid creating another
> situation when startup could fail.

You mean, fail on probe with no mem is better then fail on startup? Why?

>=20
> > +       ret =3D request_irq(priv->irq, imx_mu_isr, IRQF_SHARED, cp->irq=
_desc,
> > +                         chan);
> > +       if (ret) {
> > +               dev_err(priv->dev,
> > +                       "Unable to acquire IRQ %d\n", priv->irq);
> > +               return ret;
> > +       }
> > +
> > +       switch (cp->type) {
> > +               break;
> >
> Is this intentional?

no. thx.

>=20
> > +
> > +static void imx_mu_shutdown(struct mbox_chan *chan)
> > +{
> > +       struct imx_mu_priv *priv =3D to_imx_mu_priv(chan->mbox);
> > +       struct imx_mu_con_priv *cp =3D chan->con_priv;
> > +
> > +       if (IMX_MU_TYPE_TXDB =3D=3D cp->type)
> >
> nit: usually we do (cp->type =3D=3D IMX_MU_TYPE_TXDB)

why? I do it with simple reason:
this error will be detected by compiler
if (IMX_MU_TYPE_TXDB =3D cp->type)

this error will silently fail
if (cp->type =3D IMX_MU_TYPE_TXDB)

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--yrg2wi6yucjqikoi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEpENFL0P3hvQ7p0DDdQOiSHVI77QFAlthRakACgkQdQOiSHVI
77TX0Qf+N9OoSOvhMPKzWhbNCDE/bE2b+CiCl6WrmJL3rlaoPip0IdUIaUSHurZu
dJ1iAeDLa+pkblWa82QizT7xpr3mtBGV5c82N7olJ/k8AbXJB6SBYOGI2ruxorVB
LSk6Em8TY0aU0RJuoZDhsueZjQZUb4PnC8sNAuZLH2byveqq+XjaTqnLhyPjaYls
yubLYE6KMIsaspPrh1Bh1AEWKToRJu1cisbFalDiLnB4a4Uq5fBaWzKr6aDbKGmP
UDUhdNc3nEy6RALl29sFoAl1hggjkbibZPk87AhhcNrkJSkcatqDZ5kk3UknMVmK
EVMlk0ou1N7JtkCUHDZgvQnFQcYa7Q==
=AxKi
-----END PGP SIGNATURE-----

--yrg2wi6yucjqikoi--


--===============0143999268357465138==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0143999268357465138==--
