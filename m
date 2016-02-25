From: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 2/2] PCI: generic: add description of property
 "interrupt-skip-mask"
Date: Thu, 25 Feb 2016 19:53:28 +0800
Message-ID: <1456401208-10136-2-git-send-email-thunder.leizhen@huawei.com>
References: <1456401208-10136-1-git-send-email-thunder.leizhen@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1456401208-10136-1-git-send-email-thunder.leizhen@huawei.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bjorn Helgaas <bhelgaas@google.com>, linux-pci <linux-pci@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, Will Deacon <will.deacon@arm.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
Cc: Hanjun Guo <guohanjun@huawei.com>, Xinwei Hu <huxinwei@huawei.com>, Zefan Li <lizefan@huawei.com>, Tianhong Ding <dingtianhong@huawei.com>, Zhen Lei <thunder.leizhen@huawei.com>, Yijing Wang <wangyijing@huawei.com>
List-Id: devicetree@vger.kernel.org

Interrupt Pin register is read-only and optional. Some pci devices may use
msi/msix but leave the value of Interrupt Pin non-zero. In this case, the
driver will print information as below:
pci 0000:40:00.0: of_irq_parse_pci() failed with rc=-22

It's easily lead to misinterpret.

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 Documentation/devicetree/bindings/pci/host-generic-pci.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/host-generic-pci.txt b/Documentation/devicetree/bindings/pci/host-generic-pci.txt
index 3f1d3fc..0f10978 100644
--- a/Documentation/devicetree/bindings/pci/host-generic-pci.txt
+++ b/Documentation/devicetree/bindings/pci/host-generic-pci.txt
@@ -70,6 +70,8 @@ Practice: Interrupt Mapping' and requires the following properties:

 - interrupt-map-mask : <see aforementioned specification>

+- interrupt-skip-mask: Explicitly declare which pci devices only use msi/msix
+but leave the value of Interrupt Pin non-zero.

 Example:

--
2.5.0
