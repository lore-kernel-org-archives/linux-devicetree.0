From: Paul Walmsley <paul@pwsan.com>
Subject: [PATCH v2 3/3] Documentation: DT bindings: add nvidia,
 tegra132-denver compatible string
Date: Fri, 30 Jan 2015 15:11:04 -0700
Message-ID: <20150130221104.4761.82708.stgit@dusk.lan>
References: <20150130221104.4761.50643.stgit@dusk.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150130221104.4761.50643.stgit@dusk.lan>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Heiko Stuebner <heiko@sntech.de>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Rohit Vaswani <rvaswani@codeaurora.org>, linux-kernel@vger.kernel.org, Marc Carino <marc.ceeeee@gmail.com>, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <pwalmsley@nvidia.com>, Kumar Gala <galak@codeaurora.org>, Olof Johansson <olof@lixom.net>, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add a compatible string for the NVIDIA Denver CPU to the ARM CPU DT
binding documentation file.  The primary objective here is to keep
checkpatch.pl from warning when the compatible string is used in an
SoC DT file, per:

http://marc.info/?l=linux-tegra&m=142201349727836&w=2

This second version changes the string from "nvidia,denver" to
"nvidia,tegra132-denver" to more precisely describe the revision of
the Denver CPU complex that is present in the Tegra132 SoC.

Signed-off-by: Paul Walmsley <paul@pwsan.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: Kumar Gala <galak@codeaurora.org>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Olof Johansson <olof@lixom.net>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Rohit Vaswani <rvaswani@codeaurora.org>
Cc: Paul Walmsley <pwalmsley@nvidia.com>
Cc: Marc Carino <marc.ceeeee@gmail.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
---
 Documentation/devicetree/bindings/arm/cpus.txt |    1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.txt b/Documentation/devicetree/bindings/arm/cpus.txt
index b2aacbe16ed9..8b9e0a95de31 100644
--- a/Documentation/devicetree/bindings/arm/cpus.txt
+++ b/Documentation/devicetree/bindings/arm/cpus.txt
@@ -175,6 +175,7 @@ nodes to be present and contain the properties described below.
 			    "marvell,pj4a"
 			    "marvell,pj4b"
 			    "marvell,sheeva-v5"
+			    "nvidia,tegra132-denver"
 			    "qcom,krait"
 			    "qcom,scorpion"
 	- enable-method
