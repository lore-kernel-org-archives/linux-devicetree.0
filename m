From: Atish Patra <atish.patra@wdc.com>
Subject: [PATCH v4 4/4] dt-bindings: Update the riscv,isa string description
Date: Fri,  2 Aug 2019 21:27:23 -0700
Message-ID: <20190803042723.7163-5-atish.patra@wdc.com>
References: <20190803042723.7163-1-atish.patra@wdc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190803042723.7163-1-atish.patra@wdc.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atish.patra@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>, Alan Kao <alankao@andestech.com>, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup.patel@wdc.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, devicetree@vger.kernel.org, Enrico Weigelt <info@metux.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johan Hovold <johan@kernel.org>, linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@sifive.com>, Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

Since the RISC-V specification states that ISA description strings are
case-insensitive, there's no functional difference between mixed-case,
upper-case, and lower-case ISA strings. Thus, to simplify parsing,
specify that the letters present in "riscv,isa" must be all lowercase.

Suggested-by: Paul Walmsley <paul.walmsley@sifive.com>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index c899111aa5e3..9d3fe6aada2b 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -50,6 +50,10 @@ properties:
       User-Level ISA document, available from
       https://riscv.org/specifications/
 
+      While the isa strings in ISA specification are case
+      insensitive, letters in the riscv,isa string must be all
+      lowercase to simplify parsing.
+
   timebase-frequency:
     type: integer
     minimum: 1
-- 
2.21.0
