From: Gabriel Fernandez <gabriel.fernandez@linaro.org>
Subject: Re: [PATCH 0/5] PCI: st: provide support for dw pcie
Date: Fri, 10 Apr 2015 09:51:59 +0200
Message-ID: <CAG374jDqbubBQZabqchEEpUO8YofMu=OSuei-Nt_98y7=YhtiQ@mail.gmail.com>
References: <1428651507-32554-1-git-send-email-gabriel.fernandez@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1428651507-32554-1-git-send-email-gabriel.fernandez@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Gabriel FERNANDEZ <gabriel.fernandez@st.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Maxime Coquelin <maxime.coquelin@st.com>, Patrice Chotard <patrice.chotard@st.com>, Russell King <linux@arm.linux.org.uk>, Bjorn Helgaas <bhelgaas@google.com>, Mohit Kumar <mohit.kumar@st.com>, Jingoo Han <jg1.han@samsung.com>, Lucas Stach <l.stach@pengutronix.de>, Fabrice Gasnier <fabrice.gasnier@st.com>, Kishon Vijay Abraham I <kishon@ti.com>, Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, Greg KH <gregkh@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Joe Perches <joe@perches.com>, Tejun Heo <tj@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Viresh Kumar <viresh.kumar@lin>
List-Id: devicetree@vger.kernel.org

Hi All,

Sorry i missed v3 prefix on the title, don't review this i will send a
new patchset.

BR

Gabriel

On 10 April 2015 at 09:38, Gabriel FERNANDEZ <gabriel.fernandez@st.com> wrote:
> Changes in v3:
>  - Remove power management functions (was not fully tested)
>  - Remove configuration space range from dt binding
>  - Remove pci_common_init_dev() call in pcie-designware.c to avoid
>    default IO space declaration.
>
> Changes in v2:
>  - comestic corrections in device tree binding
>  - add pci-st.c into MAINTAINERS
>  - remove st_pcie_ops structure to avoid another level of indirection
>  - remove nasty busy-loop
>  - remove useless test using virt_to_phys()
>  - move disable io support into dw-pcie driver
>
> I don't change the st_pcie_abort_handler() function because abort handling
> is masked during boot.
>
>
> This patch-set introduces a STMicroelectronics PCIe controller.
> It's based on designware PCIe driver.
>
> Gabriel Fernandez (5):
>   ARM: STi: Kconfig update for PCIe support
>   PCI: st: Add Device Tree bindings for sti pcie
>   PCI: st: Provide support for the sti PCIe controller
>   pci: designware: remove pci_common_init_dev()
>   MAINTAINERS: Add pci-st.c to ARCH/STI architecture
>
>  Documentation/devicetree/bindings/pci/st-pcie.txt |  53 ++
>  MAINTAINERS                                       |   1 +
>  arch/arm/mach-sti/Kconfig                         |   2 +
>  drivers/pci/host/Kconfig                          |   9 +
>  drivers/pci/host/Makefile                         |   1 +
>  drivers/pci/host/pci-st.c                         | 583 ++++++++++++++++++++++
>  drivers/pci/host/pcie-designware.c                |  62 +--
>  drivers/pci/host/pcie-designware.h                |   2 +
>  8 files changed, 683 insertions(+), 30 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pci/st-pcie.txt
>  create mode 100644 drivers/pci/host/pci-st.c
>
> --
> 1.9.1
>
