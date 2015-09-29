From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] ARM: shmobile: r8a7794: link PCI USB devices to USB PHY
Date: Tue, 29 Sep 2015 09:37:51 +0900
Message-ID: <20150929003751.GB20067@verge.net.au>
References: <10927620.1TFu7PRvi4@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <10927620.1TFu7PRvi4@wasted.cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-sh@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Sergei,

On Sun, Sep 13, 2015 at 02:00:19AM +0300, Sergei Shtylyov wrote:
> Describe the PCI USB devices that are behind the PCI bridges, adding necessary
> links to the USB PHY device.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> This patch is against 'renesas-devel-20150911v2-v4.2' tag of Simon Horman's
> 'renesas.git' repo plus the R8A7794/SILK PCI USB and USB PHY support patches
> just posted.

Does this series have any dependencies (e.g. bindings) other
than the aforementioned R8A7794/SILK PCI USB and USB PHY support patches?
