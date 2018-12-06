From: Ryder Lee <ryder.lee@mediatek.com>
Subject: Re: [PATCH 0/2] PCI: mediatek: Add support for MT7629
Date: Thu, 6 Dec 2018 09:40:18 +0800
Message-ID: <1544060418.20681.0.camel@mtkswgap22>
References: <1544058553-10936-1-git-send-email-jianjun.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544058553-10936-1-git-send-email-jianjun.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jianjun Wang <jianjun.wang@mediatek.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, lorenzo.pieralisi@arm.com, matthias.bgg@gmail.com, linux-pci@vger.kernel.org, mark.rutland@arm.com, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, honghui.zhang@mediatek.com, youlin.pei@mediatek.com
List-Id: devicetree@vger.kernel.org

On Thu, 2018-12-06 at 09:09 +0800, Jianjun Wang wrote:
> These series patches modify pcie-mediatek.c and dt-bindings compatible
> string to support MT7629 PCIe host.
> 
> There was something wrong with the mail server's permission setting, sorry
> for sent these mails repeatedly.
> 
> Jianjun Wang (2):
>   dt-bindings: PCI: Add support for MT7629
>   PCI: mediatek: Add controller support for MT7629
> 
>  .../devicetree/bindings/pci/mediatek-pcie.txt |  1 +
>  drivers/pci/controller/pcie-mediatek.c        | 26 +++++++++++++++++++
>  include/linux/pci_ids.h                       |  1 +
>  3 files changed, 28 insertions(+)
> 


Acked-by: Ryder Lee <ryder.lee@mediatek.com> for the series.
