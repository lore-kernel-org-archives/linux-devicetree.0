From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/1] ARM: dts: imx6ull: keep IMX6UL_ prefix for signals
 on both i.MX6UL and i.MX6ULL
Date: Tue, 7 Aug 2018 11:59:02 -0600
Message-ID: <20180807175902.GA2389@rob-hp-laptop>
References: <20180720102321.23291-1-sebastien.szymanski@armadeus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180720102321.23291-1-sebastien.szymanski@armadeus.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 20, 2018 at 12:23:21PM +0200, S=E9bastien Szymanski wrote:
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
> ---
>  arch/arm/boot/dts/imx6ull-pinfunc.h | 27 +++++++++++++++++++--------
>  1 file changed, 19 insertions(+), 8 deletions(-)

This may be less error prone, but it is ugly still.

Acked-by: Rob Herring <robh@kernel.org>
