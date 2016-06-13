From: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 02/13] spi: sunxi: fix transfer timeout
Date: 13 Jun 2016 17:46:49 -0000
Message-ID: <064955d033503f129c3e138b0563817d1fffab27.1465490774.git.hramrach@gmail.com>
References: <cover.1465490774.git.hramrach@gmail.com>
Reply-To: hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCQMLUOX54MBBEHD7O5AKGQEXCCRZZQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <cover.1465490774.git.hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Alison Wang <b18965-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Timo Sigurdsson <public_timo.s-fWgRPtSzPNU3WX+qO2AYSQ@public.gmane.org>, Jonathan Liu <net147-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gerhard Bertelsmann <info@gerh>
List-Id: devicetree@vger.kernel.org

The trasfer timeout is fixed at 1000 ms. Reading a 4Mbyte flash over
1MHz SPI bus takes way longer than that. Calculate the timeout from the
actual time the transfer is supposed to take and multiply by 2 for good
measure.

Signed-off-by: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---

v2:
- fix build error
- use unsigned instead of int in max_t
- use tfr->speed_hz instead of sspi->max_speed_hz
  - commit 47284e3e0f3c427c93f8583549b6c938e8a18015 changes the driver
    to use tfr->speed_hz
v3:
- avoid max_t by using unsigned constant
---
 drivers/spi/spi-sun4i.c | 10 +++++++++-
 drivers/spi/spi-sun6i.c | 10 +++++++++-
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-sun4i.c b/drivers/spi/spi-sun4i.c
index 4213508..0c2216a 100644
--- a/drivers/spi/spi-sun4i.c
+++ b/drivers/spi/spi-sun4i.c
@@ -173,6 +173,7 @@ static int sun4i_spi_transfer_one(struct spi_master *master,
 {
 	struct sun4i_spi *sspi = spi_master_get_devdata(master);
 	unsigned int mclk_rate, div, timeout;
+	unsigned int start, end, tx_time;
 	unsigned int tx_len = 0;
 	int ret = 0;
 	u32 reg;
@@ -279,9 +280,16 @@ static int sun4i_spi_transfer_one(struct spi_master *master,
 	reg = sun4i_spi_read(sspi, SUN4I_CTL_REG);
 	sun4i_spi_write(sspi, SUN4I_CTL_REG, reg | SUN4I_CTL_XCH);
 
+	tx_time = max(tfr->len * 8 * 2 / (tfr->speed_hz / 1000), 100U);
+	start = jiffies;
 	timeout = wait_for_completion_timeout(&sspi->done,
-					      msecs_to_jiffies(1000));
+					      msecs_to_jiffies(tx_time));
+	end = jiffies;
 	if (!timeout) {
+		dev_warn(&master->dev,
+			 "%s: timeout transferring %u bytes@%iHz for %i(%i)ms",
+			 dev_name(&spi->dev), tfr->len, tfr->speed_hz,
+			 jiffies_to_msecs(end - start), tx_time);
 		ret = -ETIMEDOUT;
 		goto out;
 	}
diff --git a/drivers/spi/spi-sun6i.c b/drivers/spi/spi-sun6i.c
index fe70695..8f6be86 100644
--- a/drivers/spi/spi-sun6i.c
+++ b/drivers/spi/spi-sun6i.c
@@ -160,6 +160,7 @@ static int sun6i_spi_transfer_one(struct spi_master *master,
 {
 	struct sun6i_spi *sspi = spi_master_get_devdata(master);
 	unsigned int mclk_rate, div, timeout;
+	unsigned int start, end, tx_time;
 	unsigned int tx_len = 0;
 	int ret = 0;
 	u32 reg;
@@ -269,9 +270,16 @@ static int sun6i_spi_transfer_one(struct spi_master *master,
 	reg = sun6i_spi_read(sspi, SUN6I_TFR_CTL_REG);
 	sun6i_spi_write(sspi, SUN6I_TFR_CTL_REG, reg | SUN6I_TFR_CTL_XCH);
 
+	tx_time = max(tfr->len * 8 * 2 / (tfr->speed_hz / 1000), 100U);
+	start = jiffies;
 	timeout = wait_for_completion_timeout(&sspi->done,
-					      msecs_to_jiffies(1000));
+					      msecs_to_jiffies(tx_time));
+	end = jiffies;
 	if (!timeout) {
+		dev_warn(&master->dev,
+			 "%s: timeout transferring %u bytes@%iHz for %i(%i)ms",
+			 dev_name(&spi->dev), tfr->len, tfr->speed_hz,
+			 jiffies_to_msecs(end - start), tx_time);
 		ret = -ETIMEDOUT;
 		goto out;
 	}
-- 
2.8.1
