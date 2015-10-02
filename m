From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2] Add driver for the si514 clock generator chip
Date: Fri, 2 Oct 2015 11:10:42 -0700
Message-ID: <20151002181042.GL12338@codeaurora.org>
References: <1442478495-23522-1-git-send-email-mike.looijmans@topic.nl>
 <1442487891-20477-1-git-send-email-mike.looijmans@topic.nl>
 <20151001233407.GW19319@codeaurora.org>
 <560E1DF6.9010901@topic.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <560E1DF6.9010901@topic.nl>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 10/02, Mike Looijmans wrote:
> =EF=BB=BFOn 02-10-15 01:34, Stephen Boyd wrote:
> >>+ - clock-output-names: From common clock bindings. Recommended to =
be "si514".
> >>+ - clock-frequency: Output frequency to generate. This defines the=
 output
> >>+		    frequency set during boot. It can be reprogrammed during
> >>+		    runtime through the common clock framework.
> >
> >Can we use assigned clock rates instead of this property?
>=20
> I'll first need to learn what 'assigned clock rates' means. But I
> suspect the answer will be yes.

See the "Assigned clock parents and rates" section of
Documentation/devicetree/bindings/clock/clock-bindings.txt and
commit 86be408bfbd8 (clk: Support for clock parents and rates
assigned from device tree, 2014-06-18).

>=20
> >>+
> >>+Example:
> >>+	si514: clock-generator@55 {
> >>+		reg =3D <0x55>;
> >>+		#clock-cells =3D <0>;
> >>+		compatible =3D "silabs,si514";
> >>+	};
> >>diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> >>index 42f7120..6ac7deb5 100644
> >>--- a/drivers/clk/Kconfig
> >>+++ b/drivers/clk/Kconfig
> >>@@ -68,6 +68,16 @@ config COMMON_CLK_SI5351
> >>  	  This driver supports Silicon Labs 5351A/B/C programmable clock
> >>  	  generators.
> >>
> >>+config COMMON_CLK_SI514
> >>+	tristate "Clock driver for SiLabs 514 devices"
> >>+	depends on I2C
> >>+	depends on OF
> >
> >It actually depends on this to build?
>=20
> It calls various 'of_' methods unconditionally, so I'd think so.

Aren't there stubs for those if CONFIG_OF=3Dn?

--=20
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
