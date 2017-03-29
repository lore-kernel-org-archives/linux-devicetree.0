From: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Subject: [PATCH v3 0/2] Tango PCIe controller support
Date: Wed, 29 Mar 2017 13:11:57 +0200
Message-ID: <5309e718-5813-5b79-db57-9d702b50d0f9@sigmadesigns.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bjorn Helgaas <helgaas@kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: DT <devicetree@vger.kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Mason <slash.tmp@free.fr>, linux-pci <linux-pci@vger.kernel.org>, Thibaud Cornic <thibaud_cornic@sigmadesigns.com>, Liviu Dudau <liviu.dudau@arm.com>, LKML <linux-kernel@vger.kernel.org>, David Laight <david.laight@aculab.com>, Phuong Nguyen <phuong_nguyen@sigmadesigns.com>, Robin Murphy <robin.murphy@arm.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hello,

The patch is split in two parts, to ease review of two orthogonal
parts (MSI controller vs host bridge)

Marc Gonzalez (2):
  PCI: Add tango MSI controller support
  PCI: Add tango PCIe host bridge support

 Documentation/devicetree/bindings/pci/tango-pcie.txt |  34 ++++
 drivers/pci/host/Kconfig                             |   7 +
 drivers/pci/host/Makefile                            |   1 +
 drivers/pci/host/pcie-tango.c                        | 344 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 386 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/tango-pcie.txt
 create mode 100644 drivers/pci/host/pcie-tango.c

-- 
2.11.0
