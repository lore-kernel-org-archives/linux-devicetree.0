From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 2/3] ARM: dts: imx6sx: Add UDOO Neo support
Date: Tue, 5 Jul 2016 08:27:36 +0200
Message-ID: <20160705062736.GL16643@pengutronix.de>
References: <1467691450-22975-1-git-send-email-afaerber@suse.de>
 <1467691450-22975-3-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1467691450-22975-3-git-send-email-afaerber@suse.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, open list <linux-kernel@vger.kernel.org>, Ettore Chimenti <ettore.chimenti@udoo.org>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello,

On Tue, Jul 05, 2016 at 06:04:09AM +0200, Andreas F=E4rber wrote:
> +&iomuxc {
> +	imx6sx-udoo-neo {

There is no need for this machine group. Please just put the pinctrl
groups directly into &iomuxc { }.

> +		pinctrl_enet1: enet1grp {
> +			fsl,pins =3D
> +				<MX6SX_PAD_ENET1_CRS__GPIO2_IO_1	0xa0b1>,
> +				<MX6SX_PAD_ENET1_MDC__ENET1_MDC		0xa0b1>,

It's unusual to write pinmuxes this way. The usual form is to write it
in a single array. (Not sure I'm using the right term here.) Having said
that I like it your way, but still it should (IMHO) get a more official
blessing.

Best regards
Uwe

-- =

Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
