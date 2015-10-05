From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] ARM: shmobile: r8a7794: link PCI USB devices to USB PHY
Date: Mon, 5 Oct 2015 12:02:52 +0900
Message-ID: <20151005030252.GC29979@verge.net.au>
References: <10927620.1TFu7PRvi4@wasted.cogentembedded.com>
 <20150929003751.GB20067@verge.net.au>
 <560A8997.8090301@cogentembedded.com>
 <20151002020021.GF22640@verge.net.au>
 <560EFA6C.4090404@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <560EFA6C.4090404@cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-sh@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sat, Oct 03, 2015 at 12:43:08AM +0300, Sergei Shtylyov wrote:
> Hello.
> 
> On 10/02/2015 05:00 AM, Simon Horman wrote:
> 
> >>>>Describe the PCI USB devices that are behind the PCI bridges, adding necessary
> >>>>links to the USB PHY device.
> >>>>
> >>>>Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> >>>>
> >>>>---
> >>>>This patch is against 'renesas-devel-20150911v2-v4.2' tag of Simon Horman's
> >>>>'renesas.git' repo plus the R8A7794/SILK PCI USB and USB PHY support patches
> >>>>just posted.
> >>
> >>>Does this series have any dependencies (e.g. bindings) other
> >>
> >>    This patch, you mean?
> >>
> >>>than the aforementioned R8A7794/SILK PCI USB and USB PHY support patches?
> 
> >Thanks, I have queued this up for v4.4.
> 
>    Thank you!
> 
> >I think I have got everything now but please let me know if you have any
> >shmobile DT patches outstanding which are ready to be queued-up.
> 
>    Yes, the R8A7794 HS-USB patch.

Thanks, I have now queued up
"ARM: shmobile: r8a7794: add HS-USB DT support".
