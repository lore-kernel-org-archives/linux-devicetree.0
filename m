From: chunfeng yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v3,1/5] dt-bindings: mt8173-xhci: support host side of
 dual-role mode
Date: Tue, 14 Jun 2016 10:20:15 +0800
Message-ID: <1465870815.19154.1.camel@mhfsdcap03>
References: <1465543962-11678-1-git-send-email-chunfeng.yun@mediatek.com>
	 <1465543962-11678-2-git-send-email-chunfeng.yun@mediatek.com>
	 <20160613185454.GA21742@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160613185454.GA21742@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <felipe.balbi@linux.intel.com>, Mathias Nyman <mathias.nyman@intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Alan Stern <stern@rowland.harvard.edu>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Pawel Moll <pawel.moll@arm.com>, Kumar Gala <galak@codeaurora.org>, Sascha Hauer <s.hauer@pengutronix.de>, Alan Cooper <alcooperx@gmail.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, 2016-06-13 at 13:54 -0500, Rob Herring wrote:
> On Fri, Jun 10, 2016 at 03:32:38PM +0800, Chunfeng Yun wrote:
> > Some resources, such as IPPC register etc, shared with device
> > driver are moved into common glue layer when xHCI driver is the
> > host side of dual-role mode and they should be changed as optional
> > properties if they are required ones before. For clarity, add
> > a new part of binding to support host side of dual-role mode.
> > 
> > Additionally add optional properties of pinctrl for host only mode
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> >  .../devicetree/bindings/usb/mt8173-xhci.txt        |   48 ++++++++++++++++++++
> >  1 file changed, 48 insertions(+)
> 
> Acked-by: Rob Herring <robh@kernel.org>

Thank you
