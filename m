From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] ARM: shmobile: porter: enable internal PCI and USB PHY
Date: Tue, 13 Oct 2015 10:01:43 +0900
Message-ID: <20151013010142.GA4836@verge.net.au>
References: <3151312.grtDDBsSl8@wasted.cogentembedded.com>
 <4574604.BmF3DtBjpm@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4574604.BmF3DtBjpm@wasted.cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-sh@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 13, 2015 at 01:12:18AM +0300, Sergei Shtylyov wrote:
> Enable  internal AHB-PCI bridges for the USB EHCI/OHCI controllers attached
> to them and also enable  USB PHY device  for the Porter board.  We have to
> enable  everything in one patch since EHCI/OHCI devices are already linked
> to the USB PHY device.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Thanks, I have queued this up for v4.4.
