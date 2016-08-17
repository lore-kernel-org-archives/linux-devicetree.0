From: Rask Ingemann Lambertsen <ccc94453@vip.cybercity.dk>
Subject: [PATCH v3 2/3] devicetree: Add vendor prefix for Shenzhen Sunchip
 Technology Co., Ltd
Date: Wed, 17 Aug 2016 23:32:22 +0200
Message-ID: <8657d95d89daa3836d30ca390c49fb92eb263b16.1471553094.git.ccc94453@vip.cybercity.dk>
References: <54da74da3f60ede0bf8fb789ffee584703e81a29.1471553094.git.ccc94453@vip.cybercity.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <54da74da3f60ede0bf8fb789ffee584703e81a29.1471553094.git.ccc94453@vip.cybercity.dk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
List-Id: devicetree@vger.kernel.org

Shenzhen Sunchip Technology Co., Ltd produces TV boxes and TV dongles,
some of which are sold under other brands. Website:
<URL:http://www.sunchip-tech.com/>

Signed-off-by: Rask Ingemann Lambertsen <ccc94453@vip.cybercity.dk>
---

Changes in v3:
None.

Changes in v2:
No patch changes, but added CC to the ARM kernel mailing list.

 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 69398cf..2ec157c 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -254,6 +254,7 @@ starry	Starry Electronic Technology (ShenZhen) Co., LTD
 startek	Startek
 ste	ST-Ericsson
 stericsson	ST-Ericsson
+sunchip	Shenzhen Sunchip Technology Co., Ltd
 SUNW	Sun Microsystems, Inc
 syna	Synaptics Inc.
 synology	Synology, Inc.
-- 
2.8.1
