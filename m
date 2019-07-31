From: Atish Patra <atish.patra@wdc.com>
Subject: [PATCH v2 5/5] dt-bindings: Update the isa string description
Date: Tue, 30 Jul 2019 18:24:18 -0700
Message-ID: <20190731012418.24565-6-atish.patra@wdc.com>
References: <20190731012418.24565-1-atish.patra@wdc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190731012418.24565-1-atish.patra@wdc.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atish.patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexios Zavras <alexios.zavras@intel.com>, Allison Randal <allison@lohutok.net>, Anup Patel <anup.patel@wdc.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, devicetree@vger.kernel.org, Enrico Weigelt <info@metux.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johan Hovold <johan@kernel.org>, linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

The yaml documentation description of isa strings section doesn't
specify anything about the case sensitiveness of the isa strings.
The RISC-V specification clearly specifies it to be case insensitive.
However, Linux kernel supports only lower case isa strings.

Update the yaml documentation accordingly to avoid any confusion.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index c899111aa5e3..e22a2b7ebafa 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -46,10 +46,14 @@ properties:
           - rv64imafdc
     description:
       Identifies the specific RISC-V instruction set architecture
-      supported by the hart.  These are documented in the RISC-V
+      supported by the hart. These are documented in the RISC-V
       User-Level ISA document, available from
       https://riscv.org/specifications/
 
+      Linux kernel only supports lower case isa strings. Thus,
+      isa strings must be specified in lower case in device tree
+      as well.
+
   timebase-frequency:
     type: integer
     minimum: 1
-- 
2.21.0
