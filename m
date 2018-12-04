From: Sven Van Asbroeck <thesven73@gmail.com>
Subject: [PATCH v5 5/6] dt-bindings: Add vendor prefix for arcx / Archronix
Date: Tue,  4 Dec 2018 17:02:23 -0500
Message-ID: <20181204220224.27324-6-TheSven73@googlemail.com>
References: <20181204220224.27324-1-TheSven73@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181204220224.27324-1-TheSven73@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: svendev@arcx.com, robh+dt@kernel.org, linus.walleij@linaro.org
Cc: lee.jones@linaro.org, mark.rutland@arm.com, afaerber@suse.de, treding@nvidia.com, david@lechnology.com, noralf@tronnes.org, johan@kernel.org, monstr@monstr.eu, michal.vokac@ysoft.com, arnd@arndb.de, gregkh@linuxfoundation.org, john.garry@huawei.com, geert+renesas@glider.be, robin.murphy@arm.com, paul.gortmaker@windriver.com, sebastien.bourdelin@savoirfairelinux.com, icenowy@aosc.io, stuyoder@gmail.com, maxime.ripard@bootlin.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Sven Van Asbroeck <svendev@arcx.com>

arcx Inc. is an engineering company which provides advanced
embedded systems and consulting services.

Archronix is a technology design and product engineering firm
specializing in hardware control systems and enabling software.
Clients include OEM's in the transportation, aerospace,
medical and commercial sectors.

Websites:
	http://www.arcx.com/
	http://www.archronix.com/

Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Andreas Färber <afaerber@suse.de>
Signed-off-by: Sven Van Asbroeck <svendev@arcx.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 2c3fc512e746..2ad1128c4470 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -35,6 +35,7 @@ aptina	Aptina Imaging
 arasan	Arasan Chip Systems
 archermind ArcherMind Technology (Nanjing) Co., Ltd.
 arctic	Arctic Sand
+arcx	arcx Inc. / Archronix Inc.
 aries	Aries Embedded GmbH
 arm	ARM Ltd.
 armadeus	ARMadeus Systems SARL
-- 
2.17.1
