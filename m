From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH] doc: dt: mtd: Add sst25vf016b to the list of supported chip
 names
Date: Mon, 11 Sep 2017 09:35:28 +0100
Message-ID: <1505118928-3987-1-git-send-email-fabrizio.castro@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, linux-kernel@vger.kernel.org, Biju Das <biju.das@bp.renesas.com>, linux-mtd@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
index 9ce35af..5cdd527 100644
--- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
+++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
@@ -30,6 +30,7 @@ Required properties:
                  s25sl12801
                  s25fl008k
                  s25fl064k
+                 sst25vf016b
                  sst25vf040b
                  m25p40
                  m25p80
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
