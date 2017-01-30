From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [PATCH v3 06/24] ARM: dts: imx6-sabrelite: add OV5642 and OV5640
 camera sensors
Date: Mon, 30 Jan 2017 22:51:33 +0000
Message-ID: <20170130225133.GF27898@n2100.armlinux.org.uk>
References: <1483755102-24785-1-git-send-email-steve_longerbeam@mentor.com>
 <1483755102-24785-7-git-send-email-steve_longerbeam@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <1483755102-24785-7-git-send-email-steve_longerbeam@mentor.com>
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
Cc: mark.rutland@arm.com, andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com, nick@shmanahar.org, songjun.wu@microchip.com, hverkuil@xs4all.nl, Steve Longerbeam <steve_longerbeam@mentor.com>, robert.jarzmik@free.fr, devel@driverdev.osuosl.org, markus.heiser@darmarIT.de, laurent.pinchart+renesas@ideasonboard.com, geert@linux-m68k.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, arnd@arndb.de, mchehab@kernel.org, bparrot@ti.com, robh+dt@kernel.org, horms+renesas@verge.net.au, tiffany.lin@mediatek.com, linux-arm-kernel@lists.infradead.org, niklas.soderlund+renesas@ragnatech.se, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, jean-christophe.trotin@st.com, p.zabel@pengutronix.de, fabio.estevam@nxp.com, shawnguo@kernel.org, sudipm.mukherjee@gmail.com
List-Id: devicetree@vger.kernel.org

On Fri, Jan 06, 2017 at 06:11:24PM -0800, Steve Longerbeam wrote:
> +	ov5640: camera@40 {
> +		compatible = "ovti,ov5640";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_ov5640>;
> +		clocks = <&mipi_xclk>;
> +		clock-names = "xclk";
> +		reg = <0x40>;
> +		xclk = <22000000>;
> +		reset-gpios = <&gpio2 5 GPIO_ACTIVE_LOW>; /* NANDF_D5 */
> +		pwdn-gpios = <&gpio6 9 GPIO_ACTIVE_HIGH>; /* NANDF_WP_B */
> +
> +		port {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			ov5640_to_mipi_csi: endpoint@1 {
> +				reg = <1>;
> +				remote-endpoint = <&mipi_csi_from_mipi_sensor>;
> +				data-lanes = <0 1>;
> +				clock-lanes = <2>;

How do you envision a four-lane sensor being described?

	data-lanes = <0 1 3 4>;
	clock-lanes = <2>;

?

The binding document for video-interfaces.txt says:

- clock-lanes: an array of physical clock lane indexes. Position of an entry
  determines the logical lane number, while the value of an entry indicates
  physical lane, e.g. for a MIPI CSI-2 bus we could have "clock-lanes = <0>;",
  which places the clock lane on hardware lane 0. This property is valid for
  serial busses only (e.g. MIPI CSI-2). Note that for the MIPI CSI-2 bus this
  array contains only one entry.

So I think you need to have a good reason to make the clock lane non-zero.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
