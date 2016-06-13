From: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 05/13] spi: sun6i: update CS handling from spi-sun4i
Date: 13 Jun 2016 17:46:50 -0000
Message-ID: <3bf00d7311a7ed5f5d71125b7b652175551061b6.1465490774.git.hramrach@gmail.com>
References: <cover.1465490774.git.hramrach@gmail.com>
Reply-To: hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCQMLUOX54MBBFHD7O5AKGQESERYO7I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <cover.1465490774.git.hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Alison Wang <b18965-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Timo Sigurdsson <public_timo.s-fWgRPtSzPNU3WX+qO2AYSQ@public.gmane.org>, Jonathan Liu <net147-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gerhard Bertelsmann <info-La43T0Mi4bH5xCKuJOYmCvaTkwRoYoCU@public.gmane.org>, Pri
List-Id: devicetree@vger.kernel.org

While trying to merge sun4i and sun6i spi drivers I noticed
the sun4i driver seems to have more reasonable CS handling.

Update sun6i to same.

Signed-off-by: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/spi/spi-sun6i.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-sun6i.c b/drivers/spi/spi-sun6i.c
index bc29a98..06759d0 100644
--- a/drivers/spi/spi-sun6i.c
+++ b/drivers/spi/spi-sun6i.c
@@ -145,11 +145,30 @@ static void sun6i_spi_set_cs(struct spi_device *spi, bool enable)
 	reg &= ~SUN6I_TFR_CTL_CS_MASK;
 	reg |= SUN6I_TFR_CTL_CS(spi->chip_select);
 
+	/* We want to control the chip select manually */
+	reg |= SUN6I_TFR_CTL_CS_MANUAL;
+
 	if (enable)
 		reg |= SUN6I_TFR_CTL_CS_LEVEL;
 	else
 		reg &= ~SUN6I_TFR_CTL_CS_LEVEL;
 
+	/*
+	 * Even though this looks irrelevant since we are supposed to
+	 * be controlling the chip select manually, this bit also
+	 * controls the levels of the chip select for inactive
+	 * devices.
+	 *
+	 * If we don't set it, the chip select level will go low by
+	 * default when the device is idle, which is not really
+	 * expected in the common case where the chip select is active
+	 * low.
+	 */
+	if (spi->mode & SPI_CS_HIGH)
+		reg &= ~SUN6I_TFR_CTL_SPOL;
+	else
+		reg |= SUN6I_TFR_CTL_SPOL;
+
 	sun6i_spi_write(sspi, SUN6I_TFR_CTL_REG, reg);
 }
 
@@ -215,9 +234,6 @@ static int sun6i_spi_transfer_one(struct spi_master *master,
 	else
 		reg |= SUN6I_TFR_CTL_DHB;
 
-	/* We want to control the chip select manually */
-	reg |= SUN6I_TFR_CTL_CS_MANUAL;
-
 	sun6i_spi_write(sspi, SUN6I_TFR_CTL_REG, reg);
 
 	/* Ensure that we have a parent clock fast enough */
-- 
2.8.1
