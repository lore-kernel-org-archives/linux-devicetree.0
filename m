From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V3 0/5] PCIe Xilinx generic driver for Microblaze and
Date: Tue, 09 Feb 2016 15:41:54 +0100
Message-ID: <20578581.RaDqZvvMdm@wuerfel>
References: <1455014518-8708-1-git-send-email-bharatku@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1455014518-8708-1-git-send-email-bharatku@xilinx.com>
Sender: linux-pci-owner@vger.kernel.org
To: Bharat Kumar Gogada <bharat.kumar.gogada@xilinx.com>
Cc: bhelgaas@google.com, michals@xilinx.com, lorenzo.pieralisi@arm.com, paul.burton@imgtec.com, yinghai@kernel.org, wangyijing@huawei.com, robh@kernel.org, russell.joyce@york.ac.uk, sorenb@xilinx.com, jiang.liu@linux.intel.com, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, Bharat Kumar Gogada <bharatku@xilinx.com>
List-Id: devicetree@vger.kernel.org

On Tuesday 09 February 2016 16:11:53 Bharat Kumar Gogada wrote:
> This patch series does modifications to pcie-xilinx.c, to support common
> driver on both Zynq and Microblaze architectures.
> Microblaze pci-common.c has been modified to support generic driver.
> 
> Bharat Kumar Gogada (5):
>   PCI: xilinx: Removing xilinx_pcie_parse_and_add_res function
>   PCI: xilinx: Removing struct hw_pci structure.
>   PCI: xilinx: Modifying AXI PCIe Host Bridge driver to     work on both
>      Zynq and Microblaze
>   PCI: xilinx: Updating Zynq PCI binding documentation     with 
>     Microblaze node.
>   Microblaze: Modifying microblaze PCI subsytem to     support  generic
>     Xilinx  AXI PCIe Host Bridge IP driver
> 

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

I'm still not happy about needing the pci_fixup_irqs in patch 3/5, but
I can understand that fixing this is beyond the scope of your series.

	Arnd
