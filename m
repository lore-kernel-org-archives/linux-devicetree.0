From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2 3/3] dwc: PCI: intel: Intel PCIe RC controller driver
Date: Mon, 26 Aug 2019 22:14:25 +0200
Message-ID: <CAFBinCDojCN0Gxpa0fyh7t8TdvTLc_dwgJgMxC4PoAszK==BKg@mail.gmail.com>
References: <9bd455a628d4699684c0f9d439b64af1535cccc6.1566208109.git.eswara.kota@linux.intel.com>
 <20190824210302.3187-1-martin.blumenstingl@googlemail.com>
 <2c71003f-06d1-9fe2-2176-94ac816b40e3@linux.intel.com> <f1cb5ba9-b57a-971a-5a2f-1f13e0cc9507@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f1cb5ba9-b57a-971a-5a2f-1f13e0cc9507@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dilip Kota <eswara.kota@linux.intel.com>
Cc: "Chuan Hua, Lei" <chuanhua.lei@linux.intel.com>, andriy.shevchenko@intel.com, cheol.yong.kim@intel.com, devicetree@vger.kernel.org, gustavo.pimentel@synopsys.com, hch@infradead.org, jingoohan1@gmail.com, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, qi-ming.wu@intel.com
List-Id: devicetree@vger.kernel.org

Hi Dilip,

On Mon, Aug 26, 2019 at 8:42 AM Dilip Kota <eswara.kota@linux.intel.com> wrote:
[...]
> intel_pcie_port structure is having "struct dw_pcie" as mentioned below:
>
> struct intel_pcie_port {
>         struct dw_pcie          *pci;
>         unsigned int            id; /* Physical RC Index */
>         void __iomem            *app_base;
>         struct gpio_desc        *reset_gpio;
> [...]
> };
>
> Almost all the drivers are following the same way. I don't see any issue in this way.
> Please help me with more description if you see an issue here.
>
> struct qcom_pcie {
> struct dw_pcie *pci;
> Ref: https://elixir.bootlin.com/linux/v5.3-rc6/source/drivers/pci/controller/dwc/pcie-qcom.c
>
> struct armada8k_pcie {
> struct dw_pcie *pci;
> Ref: https://elixir.bootlin.com/linux/v5.3-rc6/source/drivers/pci/controller/dwc/pcie-armada8k.c
>
> struct artpec6_pcie {
> struct dw_pcie *pci;
> Ref: https://elixir.bootlin.com/linux/v5.3-rc6/source/drivers/pci/controller/dwc/pcie-artpec6.c
>
> struct kirin_pcie {
> struct dw_pcie *pci;
> Ref: https://elixir.bootlin.com/linux/v5.3-rc6/source/drivers/pci/controller/dwc/pcie-kirin.c
>
> struct spear13xx_pcie {
> struct dw_pcie *pci;
> Ref: https://elixir.bootlin.com/linux/v5.3-rc6/source/drivers/pci/controller/dwc/pcie-spear13xx.c
thank you for this detailed list.
it seems that I picked the minority of drivers as "reference" where
it's implemented differently:

first example: pci-meson
  struct meson_pcie {
    struct dw_pcie pci;
    ...
  };

second example: pcie-tegra194 (only in -next, will be part of v5.4)
  struct tegra_pcie_dw {
    ...
    struct dw_pcie pci;
    ...
  };

so some drivers store a pointer pointer to the dw_pcie struct vs.
embedding the dw_pcie struct directly.
as far as I know the result will be equal, except that you don't have
to use a second devm_kzalloc for struct dw_pcie (and thus reducing
memory fragmentation).


Martin
