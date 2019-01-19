From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: imx53-smd: Add OV5642 video capture support
Date: Sat, 19 Jan 2019 20:30:42 -0200
Message-ID: <CAOMZO5AMgKra8ZxUyBkvDDR68gWZ+YiOhO-yHS-+adMWGgnEsA@mail.gmail.com>
References: <20190119211815.25101-1-slongerbeam@gmail.com>
 <20190119211815.25101-3-slongerbeam@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190119211815.25101-3-slongerbeam@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Steve Longerbeam <slongerbeam@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Steve,

On Sat, Jan 19, 2019 at 7:19 PM Steve Longerbeam <slongerbeam@gmail.com> wrote:
>
> Add video capture support from the OV5642 to IPU CSI0 on
> the i.MX53 SMD.
>
> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>

Looks good, thanks:

Reviewed-by: Fabio Estevam <festevam@gmail.com>

Only one minor nit below that perhaps Shawn could adjust while applying:

     pmic: dialog@48 {
>                 compatible = "dlg,da9053", "dlg,da9052";
>                 reg = <0x48>;
> +               interrupt-parent = <&gpio7>;
> +               interrupts = <11 IRQ_TYPE_LEVEL_LOW>; /* low-level active IRQ at GPIO7_11 */
> +
> +               regulators {
> +                       ldo7_reg: ldo7 {
> +                               regulator-min-microvolt = <1200000>;
> +                               regulator-max-microvolt = <3600000>;
> +                               regulator-always-on;
> +                       };
> +
> +                       ldo9_reg: ldo9 {
> +                               regulator-min-microvolt = <1250000>;
> +                               regulator-max-microvolt = <3650000>;
> +                               regulator-always-on;

regulator-always-on could be removed from the two regulators above
since they are used by the camera.
