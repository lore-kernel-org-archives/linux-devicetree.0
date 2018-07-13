From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Subject: [PATCH 1/3] dt-bindings: arm: move berlin binding documentation to
 syna.txt
Date: Fri, 13 Jul 2018 17:18:59 +0800
Message-ID: <20180713171859.6c4e5a35@xhacker.debian>
References: <20180713171712.05f58a74@xhacker.debian>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180713171712.05f58a74@xhacker.debian>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Move berlin binding documentation as part of transition from Marvell
berlin to Synaptics SoC.

Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
---
 .../bindings/arm/{marvell/marvell,berlin.txt => syna.txt}         | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/arm/{marvell/marvell,berlin.txt => syna.txt} (100%)

diff --git a/Documentation/devicetree/bindings/arm/marvell/marvell,berlin.txt b/Documentation/devicetree/bindings/arm/syna.txt
similarity index 100%
rename from Documentation/devicetree/bindings/arm/marvell/marvell,berlin.txt
rename to Documentation/devicetree/bindings/arm/syna.txt
-- 
2.18.0
