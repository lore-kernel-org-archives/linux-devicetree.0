From: Dilip Kota <eswara.kota@linux.intel.com>
Subject: Re: [PATCH v2 3/3] dwc: PCI: intel: Intel PCIe RC controller driver
Date: Tue, 27 Aug 2019 17:14:11 +0800
Message-ID: <c0bb5bcf-6ccb-d155-7184-a7174bb36bd8@linux.intel.com>
References: <9bd455a628d4699684c0f9d439b64af1535cccc6.1566208109.git.eswara.kota@linux.intel.com>
 <20190824210302.3187-1-martin.blumenstingl@googlemail.com>
 <2c71003f-06d1-9fe2-2176-94ac816b40e3@linux.intel.com>
 <f1cb5ba9-b57a-971a-5a2f-1f13e0cc9507@linux.intel.com>
 <CAFBinCDojCN0Gxpa0fyh7t8TdvTLc_dwgJgMxC4PoAszK==BKg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFBinCDojCN0Gxpa0fyh7t8TdvTLc_dwgJgMxC4PoAszK==BKg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "Chuan Hua, Lei" <chuanhua.lei@linux.intel.com>, andriy.shevchenko@intel.com, cheol.yong.kim@intel.com, devicetree@vger.kernel.org, gustavo.pimentel@synopsys.com, hch@infradead.org, jingoohan1@gmail.com, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, qi-ming.wu@intel.com
List-Id: devicetree@vger.kernel.org


On 8/27/2019 4:14 AM, Martin Blumenstingl wrote:
> second example: pcie-tegra194 (only in -next, will be part of v5.4)
>    struct tegra_pcie_dw {
>      ...
>      struct dw_pcie pci;
>      ...
>    };
>
> so some drivers store a pointer pointer to the dw_pcie struct vs.
> embedding the dw_pcie struct directly.
> as far as I know the result will be equal, except that you don't have
> to use a second devm_kzalloc for struct dw_pcie (and thus reducing
> memory fragmentation).
Okay, i will change it to "struct dw_pcie pci;"

Thanks for the feedback.

Regards,

Dilip
