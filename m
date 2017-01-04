From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2 05/19] ARM: dts: imx6-sabresd: add OV5642 and OV5640
 camera sensors
Date: Wed, 4 Jan 2017 13:26:18 -0200
Message-ID: <CAOMZO5CibSU45Cw1d8ZipiGSVfhCQ4uP4XiNuWTGLa5eHmC6Qg@mail.gmail.com>
References: <1483477049-19056-1-git-send-email-steve_longerbeam@mentor.com>
 <1483477049-19056-6-git-send-email-steve_longerbeam@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1483477049-19056-6-git-send-email-steve_longerbeam@mentor.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Steve Longerbeam <slongerbeam@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devel@driverdev.osuosl.org, Steve Longerbeam <steve_longerbeam@mentor.com>, Philipp Zabel <p.zabel@pengutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Russell King - ARM Linux <linux@armlinux.org.uk>, linux-kernel <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, mchehab@kernel.org, Shawn Guo <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-media <linux-media@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 3, 2017 at 6:57 PM, Steve Longerbeam <slongerbeam@gmail.com> wrote:

> +       camera: ov5642@3c {
> +               compatible = "ovti,ov5642";
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_ov5642>;
> +               clocks = <&clks IMX6QDL_CLK_CKO>;
> +               clock-names = "xclk";
> +               reg = <0x3c>;
> +               xclk = <24000000>;
> +               DOVDD-supply = <&vgen4_reg>; /* 1.8v */
> +               AVDD-supply = <&vgen5_reg>;  /* 2.8v, rev C board is VGEN3
> +                                               rev B board is VGEN5 */

Please use vgen3 so that by default we have the valid AVDD-supply for
revC boards which is more recent and more the users have access to.

> +       mipi_camera: ov5640@3c {
> +               compatible = "ovti,ov5640_mipi";
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_ov5640>;
> +               reg = <0x3c>;
> +               clocks = <&clks IMX6QDL_CLK_CKO>;
> +               clock-names = "xclk";
> +               xclk = <24000000>;
> +               DOVDD-supply = <&vgen4_reg>; /* 1.8v */
> +               AVDD-supply = <&vgen5_reg>;  /* 2.8v, rev C board is VGEN3
> +                                               rev B board is VGEN5 */

Same here.

> +               pinctrl_ov5640: ov5640grp {
> +                       fsl,pins = <
> +                               MX6QDL_PAD_SD1_DAT2__GPIO1_IO19 0x80000000
> +                               MX6QDL_PAD_SD1_CLK__GPIO1_IO20  0x80000000

Please avoid all the 0x80000000 IOMUX settings and replace them by
their real values.
