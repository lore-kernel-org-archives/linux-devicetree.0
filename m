From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v2] ARM: dts: imx: Pass 'chosen' and 'memory' nodes
Date: Thu, 19 Jan 2017 15:13:35 +0100
Message-ID: <20170119141335.kpbrbpbwaovnijjv@pengutronix.de>
References: <1484834566-19845-1-git-send-email-fabio.estevam@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1484834566-19845-1-git-send-email-fabio.estevam@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Fabio Estevam <fabio.estevam@nxp.com>
Cc: devicetree@vger.kernel.org, linux@armlinux.org.uk, javier@osg.samsung.com, kernel@pengutronix.de, shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Jan 19, 2017 at 12:02:46PM -0200, Fabio Estevam wrote:
> Commit 7f107887d199 ("ARM: dts: imx: Remove skeleton.dtsi") causes boot
> issues when the bootloader does not create a 'chosen' node if such node
> is not present in the dtb.
> =

> The reason for the boot failure is well explained by Javier Martinez
> Canillas: "the decompressor relies on a pre-existing chosen node to be
> available to insert the command line and merge other ATAGS info."
> =

> , so pass an empty 'chosen' node to fix the boot problem.
> =

> This issue has been seen in the kernelci reports with Barebox as
> bootloader.
> =

> Also pass the 'memory' node in order to fix boot issues on the SolidRun
> iMX6 platforms.
> =

> Fixes: 7f107887d199 ("ARM: dts: imx: Remove skeleton.dtsi")
> Reported-by: kernelci.org bot <bot@kernelci.org>
> Reported-by: Russell King <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---
> Changes since v1:
> - Also pass the memory node.
> =

>  arch/arm/boot/dts/imx1.dtsi    | 2 ++
>  arch/arm/boot/dts/imx23.dtsi   | 2 ++
>  arch/arm/boot/dts/imx25.dtsi   | 2 ++
>  arch/arm/boot/dts/imx27.dtsi   | 2 ++
>  arch/arm/boot/dts/imx28.dtsi   | 2 ++
>  arch/arm/boot/dts/imx31.dtsi   | 2 ++
>  arch/arm/boot/dts/imx35.dtsi   | 2 ++
>  arch/arm/boot/dts/imx50.dtsi   | 2 ++
>  arch/arm/boot/dts/imx51.dtsi   | 2 ++
>  arch/arm/boot/dts/imx53.dtsi   | 2 ++
>  arch/arm/boot/dts/imx6qdl.dtsi | 2 ++
>  arch/arm/boot/dts/imx6sl.dtsi  | 2 ++
>  arch/arm/boot/dts/imx6sx.dtsi  | 2 ++
>  arch/arm/boot/dts/imx6ul.dtsi  | 2 ++
>  arch/arm/boot/dts/imx7s.dtsi   | 2 ++
>  15 files changed, 30 insertions(+)
> =

> diff --git a/arch/arm/boot/dts/imx1.dtsi b/arch/arm/boot/dts/imx1.dtsi
> index dd3de38..7ef0d36 100644
> --- a/arch/arm/boot/dts/imx1.dtsi
> +++ b/arch/arm/boot/dts/imx1.dtsi
> @@ -18,6 +18,8 @@
>  / {
>  	#address-cells =3D <1>;
>  	#size-cells =3D <1>;
> +	chosen {};
> +	memory { device_type =3D "memory"; reg =3D <0 0>; };

Would it be nice to add a comment about why this was added? Something to
prevent a cleanup like "remove empty nodes and invalid memory
configurations".

Best regards
Uwe


-- =

Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
