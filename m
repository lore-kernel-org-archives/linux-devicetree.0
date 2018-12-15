From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH 4/7] dt-bindings: riscv: cpus: add U54 cores to the list of documented CPUs
Date: Fri, 14 Dec 2018 21:21:51 -0800
Message-ID: <20181215052154.24347-5-paul.walmsley@sifive.com>
References: <20181215052154.24347-1-paul.walmsley@sifive.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181215052154.24347-1-paul.walmsley@sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org, Paul Walmsley <paul@pwsan.com>
List-Id: devicetree@vger.kernel.org

Add compatible strings for the SiFive U54 family of CPU cores to the
RISC-V CPU compatible string documentation.  The U54 CPU cores are
described in:

https://static.dev.sifive.com/FU540-C000-v1.0.pdf


Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: devicetree@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
Signed-off-by: Paul Walmsley <paul@pwsan.com>
---
 Documentation/devicetree/bindings/riscv/cpus.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.txt b/Documentation/devicetree/bindings/riscv/cpus.txt
index fb9d4f86f41f..d8d99b6b5386 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.txt
+++ b/Documentation/devicetree/bindings/riscv/cpus.txt
@@ -70,7 +70,8 @@ described below.
                 Value type: <stringlist>
                 Definition: must contain "riscv", may contain one or
 			    more of "sifive,rocket0", "sifive,e51",
-			    "sifive,e5"
+			    "sifive,e5", "sifive,u54-mc", "sifive,u54",
+			    "sifive,u5"
         - mmu-type:
                 Usage: optional
                 Value type: <string>
-- 
2.20.0
