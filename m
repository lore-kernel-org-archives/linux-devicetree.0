From: chunfeng yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v12 0/3] Mediatek xHCI support
Date: Sat, 21 Nov 2015 10:42:37 +0800
Message-ID: <1448073757.18917.14.camel@mhfsdcap03>
References: <1447751921-26746-1-git-send-email-chunfeng.yun@mediatek.com>
	 <564F0211.3090605@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <564F0211.3090605@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Felipe Balbi <balbi@ti.com>, Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>, linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org, John Crispin <blogic@openwrt.org>, Daniel Kurtz <djkurtz@chromium.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: devicetree@vger.kernel.org

Hi,
On Fri, 2015-11-20 at 13:20 +0200, Mathias Nyman wrote:
> On 17.11.2015 11:18, Chunfeng Yun wrote:
> >  From 577f68d9c0ca1531d5f9cae0dcbea2ba116c8551 Mon Sep 17 00:00:00 2001
> > From: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > Date: Tue, 17 Nov 2015 17:09:05 +0800
> > Subject: [PATCH v12 0/3] Mediatek xHCI support
> >
> > The patch supports MediaTek's xHCI controller.
> >
> > There are some differences from xHCI spec:
> > 1. The interval is specified in 250 * 8ns increments for Interrupt Moderation
> > Interval(IMODI) of the Interrupter Moderation(IMOD) register, it is 8 times as
> > much as that defined in xHCI spec.
> >
> > 2. For the value of TD Size in Normal TRB, MTK's xHCI controller defines a
> > number of packets that remain to be transferred for a TD after processing all
> > Max packets in all previous TRBs,that means don't include the current TRB's,
> > but in xHCI spec it includes the current ones.
> >
> > 3. To minimize the scheduling effort for synchronous endpoints in xHC, the MTK
> > architecture defines some extra SW scheduling parameters for HW. According to
> > these parameters provided by SW, the xHC can easily decide whether a
> > synchronous endpoint should be scheduled in a specific uFrame. The extra SW
> > scheduling parameters are put into reserved DWs in Slot and Endpoint Context.
> > And a bandwidth scheduler algorithm is added to support such feature.
> >
> > A usb3.0 phy driver is also added which used by mt65xx SoCs platform, it
> > supports two usb2.0 ports and one usb3.0 port.
> >
> 
> Added to my tree, I'll send it forward to Greg shortly
> 
> Fixed the documentation "wakeup_deb_p0" -> "wakeup_deb_p1" typo as well
Thank you very much.
> 
> -Mathias  
> 
