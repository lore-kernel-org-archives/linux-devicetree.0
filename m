Return-Path: <robherring2@gmail.com>
Date: Tue, 9 Jul 2019 16:50:53 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: 83xx-512x-pci: Drop cell-index property
Message-ID: <20190709225053.GA12654@bogus>
References: <20190622034557.196097-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190622034557.196097-1-wangkefeng.wang@huawei.com>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, Kumar Gala <galak@kernel.crashing.org>
List-ID: <devicetree@vger.kernel.org>

On Sat, 22 Jun 2019 11:45:57 +0800, Kefeng Wang wrote:
> 28eac2b74cc7 ("powerpc/fsl: Remove cell-index from PCI nodes"),
> and for now it is still not used, drop it from doc.
> 
> Cc: Kumar Gala <galak@kernel.crashing.org>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  Documentation/devicetree/bindings/pci/83xx-512x-pci.txt | 1 -
>  1 file changed, 1 deletion(-)
> 

Applied, thanks.

Rob
