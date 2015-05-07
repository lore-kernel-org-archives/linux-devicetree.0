From: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [RFC PATCH 0/3] PCI: host: Add PCIe host support for Hisilicon
 Soc Hip05
Date: Thu, 7 May 2015 10:24:18 -0500
Message-ID: <20150507152418.GM24643@google.com>
References: <1429077843-184462-1-git-send-email-wangzhou1@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1429077843-184462-1-git-send-email-wangzhou1@hisilicon.com>
Sender: linux-pci-owner@vger.kernel.org
To: Zhou Wang <wangzhou1@hisilicon.com>
Cc: Mohit Kumar <mohit.kumar@st.com>, Jingoo Han <jg1.han@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Liviu Dudau <Liviu.Dudau@arm.com>, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, gabriele.paoloni@huawei.com, yuanzhichang@hisilicon.com, zhudacai@hisilicon.com, zhangjukuo@huawei.com, xiehaitao@huawei.com, liguozhu@hisilicon.com, wangzhou.bry@gmail.com
List-Id: devicetree@vger.kernel.org

On Wed, Apr 15, 2015 at 02:04:00PM +0800, Zhou Wang wrote:
> This patchset adds PCIe host support for Hisilicon Soc Hip05. The PCIe hosts
> use PCIe IP core from Synopsys. So the driver is based on designware PCIe driver.
> 
> Zhou Wang (3):
>   PCI: host: designware: support ARM64
>   PCI: Host: Add PCIe host support for Hisilicon Soc Hip05
>   Documentation: devicetree: Add hisilicon PCIe host binding

Please run "git log" and "git log --oneline" on each file you change, and
make your changelogs and summaries look like the rest -- same style, same
capitalization, etc.

>  .../devicetree/bindings/pci/hisilicon-pcie.txt     |  46 ++++
>  drivers/pci/host/Kconfig                           |   5 +
>  drivers/pci/host/Makefile                          |   1 +
>  drivers/pci/host/pcie-designware.c                 |  44 +++-
>  drivers/pci/host/pcie-hisi.c                       | 252 +++++++++++++++++++++
>  5 files changed, 345 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pci/hisilicon-pcie.txt
>  create mode 100644 drivers/pci/host/pcie-hisi.c
> 
> -- 
> 1.9.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-pci" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
