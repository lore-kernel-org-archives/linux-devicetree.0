From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH 3/7] dt-bindings: riscv: cpus: add E51 cores to the list of
 documented CPUs
Date: Fri, 14 Dec 2018 21:21:50 -0800
Message-ID: <20181215052154.24347-4-paul.walmsley@sifive.com>
References: <20181215052154.24347-1-paul.walmsley@sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181215052154.24347-1-paul.walmsley@sifive.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Paul Walmsley <paul@pwsan.com>, Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>, Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>
List-Id: devicetree@vger.kernel.org

Add compatible strings for the SiFive E51 family of CPU cores to the
RISC-V CPU compatible string documentation.  The E51 CPU core is
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
 Documentation/devicetree/bindings/riscv/cpus.txt | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.txt b/Documentation/devicetree/bindings/riscv/cpus.txt
index adf7b7af5dc3..fb9d4f86f41f 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.txt
+++ b/Documentation/devicetree/bindings/riscv/cpus.txt
@@ -68,8 +68,9 @@ described below.
         - compatible:
                 Usage: required
                 Value type: <stringlist>
-                Definition: must contain "riscv", may contain one of
-                            "sifive,rocket0"
+                Definition: must contain "riscv", may contain one or
+			    more of "sifive,rocket0", "sifive,e51",
+			    "sifive,e5"
         - mmu-type:
                 Usage: optional
                 Value type: <string>
-- 
2.20.0
