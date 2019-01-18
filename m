From: Min Guo <min.guo@mediatek.com>
Subject: Re: [PATCH v3 4/4] usb: musb: Add support for MediaTek musb
 controller
Date: Fri, 18 Jan 2019 14:14:14 +0800
Message-ID: <1547792054.4433.254.camel@mhfsdcap03>
References: <1547709348-17506-1-git-send-email-min.guo@mediatek.com>
         <1547709348-17506-5-git-send-email-min.guo@mediatek.com>
         <20190117143342.GS5544@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190117143342.GS5544@atomide.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: Bin Liu <b-liu@ti.com>, Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Alan Stern <stern@rowland.harvard.edu>, chunfeng.yun@mediatek.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, hdegoede@redhat.com, Yonglong Wu <yonglong.wu@mediatek.com>
List-Id: devicetree@vger.kernel.org

On Thu, 2019-01-17 at 06:33 -0800, Tony Lindgren wrote:
> Hi,
> 
> * min.guo@mediatek.com <min.guo@mediatek.com> [190117 07:16]:
> > There are some quirk of MediaTek musb controller, such as:
> >  -W1C interrupt status registers
> >  -Private data toggle registers
> >  -No dedicated DMA interrupt line
> 
> Can you please separate the musb generic changes listed above
> into separate individual patches in preparation for adding
> support for new hardware?
> 
> Otherwise we'll have hard time finding out with git bisect what
> exactly breaks things if we run into trouble.

Thanks for your suggestion.
I prepared to divide these changes into separate patches. Later, Mr.Bin
suggested not to do this.

The detailed information can be referred to:
https://patchwork.kernel.org/patch/10743561/
https://patchwork.kernel.org/patch/10763737/
https://patchwork.kernel.org/patch/107463741/

> Regards,
> 
> Tony
