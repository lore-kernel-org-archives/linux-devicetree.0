From: Rob Herring <robh@kernel.org>
Subject: Re: [v2 PATCH 5/6] dt-bindings: usb: mtk-xhci: update USB wakeup
 properties
Date: Fri, 5 Jan 2018 12:39:09 -0600
Message-ID: <20180105183909.vhudoswb6bkq7xvf@rob-hp-laptop>
References: <41c6b0f2e959c07eff261060e57fd180a750071a.1514967463.git.chunfeng.yun@mediatek.com>
 <7c7f69a3981b5117f7c8cc14b19c3459a50403ef.1514967463.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7c7f69a3981b5117f7c8cc14b19c3459a50403ef.1514967463.git.chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>, Catalin Marinas <catalin.marinas@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 03, 2018 at 04:53:21PM +0800, Chunfeng Yun wrote:
> Add two arguments in "mediatek,syscon-wakeup" to support multi
> wakeup glue layer between SSUSB and SPM, and use standard property
> "wakeup-source" to replace the private "mediatek,wakeup-src"
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  .../devicetree/bindings/usb/mediatek,mtk-xhci.txt        | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
