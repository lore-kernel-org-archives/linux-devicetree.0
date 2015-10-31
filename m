From: Chris Zhong <zyw@rock-chips.com>
Subject: [PATCH v2 10/13] of: add vendor prefix for boe
Date: Sat, 31 Oct 2015 20:56:06 +0800
Message-ID: <1446296170-3702-11-git-send-email-zyw@rock-chips.com>
References: <1446296170-3702-1-git-send-email-zyw@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1446296170-3702-1-git-send-email-zyw@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de, linux-rockchip@lists.infradead.org
Cc: Chris Zhong <zyw@rock-chips.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Thierry Reding <treding@nvidia.com>, linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Arnaud Ebalard <arno@natisbad.org>, Rob Herring <robh+dt@kernel.org>, Antony Pavlov <antonynpavlov@gmail.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Jonathan Cameron <jic23@kernel.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Chris Zhong <zyw@rock-chips.com>

---

Changes in v2:
add vendor prefix for boe

 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 8fb0590..404b798 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -33,6 +33,7 @@ auo	AU Optronics Corporation
 avago	Avago Technologies
 avic	Shanghai AVIC Optoelectronics Co., Ltd.
 axis	Axis Communications AB
+boe	BOE Technology Group Co., Ltd.
 bosch	Bosch Sensortec GmbH
 boundary	Boundary Devices Inc.
 brcm	Broadcom Corporation
-- 
2.6.2
