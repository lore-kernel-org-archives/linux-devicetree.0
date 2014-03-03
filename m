From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: [PATCH v4 5/6] pci: Use parent domain number when allocating child
 busses.
Date: Mon,  3 Mar 2014 17:33:15 +0000
Message-ID: <1393867996-32299-6-git-send-email-Liviu.Dudau@arm.com>
References: <1393867996-32299-1-git-send-email-Liviu.Dudau@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1393867996-32299-1-git-send-email-Liviu.Dudau@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-pci <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, linaro-kernel <linaro-kernel@lists.linaro.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Tanmay Inamdar <tinamdar@apm.com>, LKML <linux-kernel@vger.kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

pci_alloc_child_bus() uses the newly allocated child bus to figure
out the domain number that is going to use for setting the device
name. A better option is to use the parent bus domain number.

Signed-off-by: Liviu Dudau <Liviu.Dudau@arm.com>

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 26237a0..a12cda5 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -677,7 +677,7 @@ static struct pci_bus *pci_alloc_child_bus(struct pci_bus *parent,
 	 * now as the parent is not properly set up yet.
 	 */
 	child->dev.class = &pcibus_class;
-	dev_set_name(&child->dev, "%04x:%02x", pci_domain_nr(child), busnr);
+	dev_set_name(&child->dev, "%04x:%02x", pci_domain_nr(parent), busnr);
 
 	/*
 	 * Set up the primary, secondary and subordinate
-- 
1.9.0
