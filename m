From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 3/5] dt-bindings: PCI: rename and cleanup MediaTek
 binding text
Date: Thu, 3 Aug 2017 14:10:45 -0500
Message-ID: <20170803191045.k6xqbm3ekqbnorzd@rob-hp-laptop>
References: <cover.1501122135.git.honghui.zhang@mediatek.com>
 <309532ded49d3452a609116d1c421d820bea74e4.1501122135.git.honghui.zhang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <309532ded49d3452a609116d1c421d820bea74e4.1501122135.git.honghui.zhang@mediatek.com>
Sender: linux-pci-owner@vger.kernel.org
To: honghui.zhang@mediatek.com
Cc: bhelgaas@google.com, robh@kerenl.org, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, yingjoe.chen@mediatek.com, eddie.huang@mediatek.com, ryder.lee@mediatek.com, hongkun.cao@mediatek.com, youlin.pei@mediatek.com, yong.wu@mediatek.com, yt.shen@mediatek.com, sean.wang@mediatek.com, xinping.qian@mediatek.com
List-Id: devicetree@vger.kernel.org

On Thu, Jul 27, 2017 at 10:58:37AM +0800, honghui.zhang@mediatek.com wrote:
> From: Ryder Lee <ryder.lee@mediatek.com>
> 
> In order to accommodate other SoC generations, this patch updates filename
> to make it more generic, regroups specific properties by SoCs, and removes
> redundant descriptions.
> 
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  ...{mediatek,mt7623-pcie.txt => mediatek-pcie.txt} | 29 +++++++++++-----------
>  1 file changed, 14 insertions(+), 15 deletions(-)
>  rename Documentation/devicetree/bindings/pci/{mediatek,mt7623-pcie.txt => mediatek-pcie.txt} (91%)

Acked-by: Rob Herring <robh@kernel.org>
