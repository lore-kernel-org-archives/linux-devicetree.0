From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 8/8] dt-bindings: phy-mt65xx-usb: add support for new
 version phy
Date: Mon, 27 Feb 2017 16:38:54 -0600
Message-ID: <20170227223853.htphbxx2hyvll6fd@rob-hp-laptop>
References: <1487753705-6745-1-git-send-email-chunfeng.yun@mediatek.com>
 <1487753705-6745-8-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1487753705-6745-8-git-send-email-chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 22, 2017 at 04:55:05PM +0800, Chunfeng Yun wrote:
> add a new compatible string for "mt2712", and move reference clock
> into each port node;
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  .../devicetree/bindings/phy/phy-mt65xx-usb.txt     |   93 +++++++++++++++++---
>  1 file changed, 80 insertions(+), 13 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
