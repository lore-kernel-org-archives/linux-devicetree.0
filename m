From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH] of: irq: fix a trivial typo in a doc comment
Date: Wed,  7 Aug 2019 15:22:31 +0200
Message-ID: <20190807132231.10454-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiri Kosina <trivial@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
List-Id: devicetree@vger.kernel.org

Diverged from what the code does with commit 530210c7814e ("of/irq: Repla=
ce
of_irq with of_phandle_args").

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 drivers/of/irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 7f84bb4903caa..a296eaf52a5b2 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -277,7 +277,7 @@ EXPORT_SYMBOL_GPL(of_irq_parse_raw);
  * of_irq_parse_one - Resolve an interrupt for a device
  * @device: the device whose interrupt is to be resolved
  * @index: index of the interrupt to resolve
- * @out_irq: structure of_irq filled by this function
+ * @out_irq: structure of_phandle_args filled by this function
  *
  * This function resolves an interrupt for a node by walking the interru=
pt tree,
  * finding which interrupt controller node it is attached to, and return=
ing the
--=20
2.21.0
