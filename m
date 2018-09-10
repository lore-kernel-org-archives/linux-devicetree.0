From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: PCI: meson: add DT bindings for
 Amlogic Meson PCIe controller
Date: Mon, 10 Sep 2018 14:38:36 -0500
Message-ID: <20180910193836.GA21297@bogus>
References: <1535616829-167936-1-git-send-email-hanjie.lin@amlogic.com>
 <1535616829-167936-2-git-send-email-hanjie.lin@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1535616829-167936-2-git-send-email-hanjie.lin@amlogic.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Bjorn Helgaas <bhelgaas@google.com>, Yue Wang <yue.wang@amlogic.com>, Hanjie Lin <hanjie.lin@amlogic.com>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, Yixun Lan <yixun.lan@amlogic.com>, Liang Yang <liang.yang@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>, Qiufang Dai <qiufang.dai@amlogic.com>, Jian Hu <jian.hu@amlogic.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 30 Aug 2018 16:13:48 +0800, Hanjie Lin wrote:
> From: Yue Wang <yue.wang@amlogic.com>
> 
> The Amlogic Meson PCIe host controller is based on the Synopsys DesignWare
> PCI core. This patch adds documentation for the DT bindings in Meson PCIe
> controller.
> 
> Signed-off-by: Yue Wang <yue.wang@amlogic.com>
> Signed-off-by: Hanjie Lin <hanjie.lin@amlogic.com>
> ---
>  .../devicetree/bindings/pci/amlogic,meson-pcie.txt | 70 ++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/amlogic,meson-pcie.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
