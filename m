From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: mediatek: update bindings for MT7629 SoC
Date: Thu, 28 Feb 2019 12:43:11 -0600
Message-ID: <20190228184311.GA15417@bogus>
References: <56a2c38c9efa41be940858e19501fe07fbd5120e.1550233614.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56a2c38c9efa41be940858e19501fe07fbd5120e.1550233614.git.ryder.lee@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ryder Lee <ryder.lee@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Weijie Gao <weijie.gao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Marc Zyngier <marc.zyngier@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: devicetree@vger.kernel.org

On Sun, 17 Feb 2019 21:50:30 +0800, Ryder Lee wrote:
> From: Ryder Lee <ryder.lee@mediatek.com>
> 
> This updates bindings for MT7629 SoC, which includes very basic items
> such as system timer, UART, sysirq and scpsys unit.
> 
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> Cc: Marc Zyngier <marc.zyngier@arm.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  .../devicetree/bindings/interrupt-controller/mediatek,sysirq.txt     | 5 +++--
>  Documentation/devicetree/bindings/serial/mtk-uart.txt                | 3 ++-
>  Documentation/devicetree/bindings/soc/mediatek/scpsys.txt            | 3 ++-
>  3 files changed, 7 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
