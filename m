From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v2] usb: xhci: fix interrupt transfer error happened on
 MTK platforms
Date: Fri, 7 Sep 2018 16:43:46 +0800
Message-ID: <1536309826.32173.45.camel@mhfsdcap03>
References: <e8698cc5710a9d1f25e33e2201e2177bfbfec75c.1536305256.git.chunfeng.yun@mediatek.com>
         <20180907074251.GA2079@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20180907074251.GA2079@kroah.com>
Sender: stable-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On Fri, 2018-09-07 at 09:42 +0200, Greg Kroah-Hartman wrote:
> On Fri, Sep 07, 2018 at 03:29:12PM +0800, Chunfeng Yun wrote:
> > The MTK xHCI controller use some reserved bytes in endpoint context for
> > bandwidth scheduling, so need keep them in xhci_endpoint_copy();
> 
> If they are "reserved" shouldn't they be properly named?  And by using
> reserved bytes, isn't that a spec violation?
It indeed violates the spec, "they shall be treated by system software
as Reserved and Opaque", and it's a quirk of the MTK xHCI controller.

> 
> thanks,
> 
> greg k-h
