From: Simon Shields <simon-WP75azK+jQYgsBAKwltoeQ@public.gmane.org>
Subject: Re: [PATCH] brcmfmac: add support for external 32khz clock
Date: Mon, 6 Nov 2017 21:29:40 +1100
Message-ID: <20171106102934.GA23805@lineageos.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, brcm80211-dev-list.pdl-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, brcm80211-dev-list-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org, Arend van Spriel <arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Franky Lin <franky.lin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Hante Meuleman <hante.meuleman-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Chi-Hsien Lin <chi-hsien.lin-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>, Wright Feng <wright.feng-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Some boards use an external 32khz clock for low-power
mode timing. Make sure the clock is powered on while the chipset
is active.

Signed-off-by: Simon Shields <simon-WP75azK+jQYgsBAKwltoeQ@public.gmane.org>
---
 .../devicetree/bindings/net/wireless/brcm,bcm43xx-fmac.txt     |  2 ++
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.h      |  2 ++
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c          |  5 +++++
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c        | 10 ++++++++++
 4 files changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/brcm,bcm43xx-fmac.txt b/Documentation/devicetree/bindings/net/wireless/brcm,bcm43xx-fmac.txt
index b2bd4704f859..37add5e29272 100644
--- a/Documentation/devicetree/bindings/net/wireless/brcm,bcm43xx-fmac.txt
+++ b/Documentation/devicetree/bindings/net/wireless/brcm,bcm43xx-fmac.txt
@@ -17,6 +17,8 @@ Optional properties:
 	When not specified the device will use in-band SDIO interrupts.
  - interrupt-names : name of the out-of-band interrupt, which must be set
 	to "host-wake".
+ - clocks : external 32khz clock
+ - clock-names : name of the external 32khz clock, must be "32khz"
 
 Example:
 
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.h b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.h
index a62f8e70b320..2e7fabae81d3 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.h
@@ -51,6 +51,7 @@ extern struct brcmf_mp_global_t brcmf_mp_global;
  * @roamoff: Firmware roaming off?
  * @ignore_probe_fail: Ignore probe failure.
  * @country_codes: If available, pointer to struct for translating country codes
+ * @clk: External 32khz clock, if present.
  * @bus: Bus specific platform data. Only SDIO at the mmoment.
  */
 struct brcmf_mp_device {
@@ -60,6 +61,7 @@ struct brcmf_mp_device {
 	bool		roamoff;
 	bool		ignore_probe_fail;
 	struct brcmfmac_pd_cc *country_codes;
+	struct clk *clk;
 	union {
 		struct brcmfmac_sdio_pd sdio;
 	} bus;
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c
index aee6e5937c41..46f42a2c3d2b 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c
@@ -13,6 +13,7 @@
  * OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN
  * CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
  */
+#include <linux/clk.h>
 #include <linux/init.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
@@ -39,6 +40,10 @@ void brcmf_of_probe(struct device *dev, enum brcmf_bus_type bus_type,
 	if (of_property_read_u32(np, "brcm,drive-strength", &val) == 0)
 		sdio->drive_strength = val;
 
+	settings->clk = devm_clk_get(dev, "32khz");
+	if (IS_ERR(settings->clk))
+		settings->clk = NULL;
+
 	/* make sure there are interrupts defined in the node */
 	if (!of_find_property(np, "interrupts", NULL))
 		return;
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
index 613caca7dc02..f4ceca6dbe74 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
@@ -14,6 +14,7 @@
  * CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
  */
 
+#include <linux/clk.h>
 #include <linux/types.h>
 #include <linux/atomic.h>
 #include <linux/kernel.h>
@@ -3853,6 +3854,11 @@ brcmf_sdio_probe_attach(struct brcmf_sdio *bus)
 		brcmf_err("Failed to get device parameters\n");
 		goto fail;
 	}
+
+	/* enable external 32khz clock, if present */
+	if (sdiodev->settings->clk)
+		clk_prepare_enable(sdiodev->settings->clk);
+
 	/* platform specific configuration:
 	 *   alignments must be at least 4 bytes for ADMA
 	 */
@@ -4270,6 +4276,10 @@ void brcmf_sdio_remove(struct brcmf_sdio *bus)
 			}
 			brcmf_chip_detach(bus->ci);
 		}
+
+		if (bus->sdiodev->settings->clk)
+			clk_disable_unprepare(bus->sdiodev->settings->clk);
+
 		if (bus->sdiodev->settings)
 			brcmf_release_module_param(bus->sdiodev->settings);
 
-- 
2.15.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
