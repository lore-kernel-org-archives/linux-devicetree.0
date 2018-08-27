From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2 1/1] ARM: dts: imx6ull: keep IMX6UL_ prefix for
 signals on both i.MX6UL and i.MX6ULL
Date: Mon, 27 Aug 2018 16:00:11 +0800
Message-ID: <20180827080008.GL3850@dragon>
References: <20180822113803.20965-1-sebastien.szymanski@armadeus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180822113803.20965-1-sebastien.szymanski@armadeus.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?iso-8859-1?Q?S=E9bastien?= Szymanski <sebastien.szymanski@armadeus.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 22, 2018 at 01:38:03PM +0200, S=E9bastien Szymanski wrote:
> Signals available on both i.MX6UL and i.MX6ULL should have the same name
> because it is the case of all others common signals, it avoids to make
> mistakes (use the wrong ones) and it makes writing device tree files
> less complicated. For example:
> =

> imx6ul-imx6ull-board.dtsi:
>  ...
>  pinctrl_uart5: uart5grp {
> 	fsl,pins =3D <
> 		MX6UL_PAD_UART5_TX_DATA__UART5_DCE_TX   0x1b0b1
> 	 	MX6UL_PAD_UART5_RX_DATA__UART5_DCE_RX   0x1b0b1
>  	 >;
>  };
> =

> imx6ul-board.dts:
>  #include <imx6ul.dtsi>
>  #include <imx6ul-imx6ull-board.dtsi>
>  ...
> =

> imx6ull-board.dts:
>  #include <imx6ull.dtsi>
>  #include <imx6ul-imx6ull-board.dtsi>
>  ...
> =

> Without this patch, the imx6ull-board.dtb will use
> MX6UL_PAD_UART5_RX_DATA__UART5_DCE_RX instead of
> MX6ULL_PAD_UART5_RX_DATA__UART5_DCE_RX and the uart5 will be
> misconfigured.
> =

> Signed-off-by: S=E9bastien Szymanski <sebastien.szymanski@armadeus.com>

Rob and Fabio gave their review/ack tags on v1, so I applied the patch
with the tags collected.

Shawn
