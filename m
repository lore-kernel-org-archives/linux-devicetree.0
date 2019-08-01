From: Atish Patra <atish.patra@wdc.com>
Subject: [PATCH v3 5/5] dt-bindings: Update the riscv,isa string description
Date: Wed, 31 Jul 2019 17:58:43 -0700
Message-ID: <20190801005843.10343-6-atish.patra@wdc.com>
References: <20190801005843.10343-1-atish.patra@wdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190801005843.10343-1-atish.patra@wdc.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, Yangtao Li <tiny.windzz@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Anup Patel <anup.patel@wdc.com>, Johan Hovold <johan@kernel.org>, Atish Patra <atish.patra@wdc.com>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@sifive.com>, Gary Guo <gary@garyguo.net>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Enrico Weigelt <info@metux.net>, Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
List-Id: devicetree@vger.kernel.org

Since the RISC-V specification states that ISA description strings are
case-insensitive, there's no functional difference between mixed-case,
upper-case, and lower-case ISA strings. Thus, to simplify parsing,
specify that the letters present in "riscv,isa" must be all lowercase.

Suggested-by: Paul Walmsley <paul.walmsley@sifive.com>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index c899111aa5e3..4f0acb00185a 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -46,10 +46,12 @@ properties:
           - rv64imafdc
     description:
       Identifies the specific RISC-V instruction set architecture
-      supported by the hart.  These are documented in the RISC-V
+      supported by the hart. These are documented in the RISC-V
       User-Level ISA document, available from
       https://riscv.org/specifications/
 
+      Letters in the riscv,isa string must be all lowercase.
+
   timebase-frequency:
     type: integer
     minimum: 1
-- 
2.21.0
