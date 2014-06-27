From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v5 0/2] Add R8A7790/Lager board PCI USB DT support
Date: Sat, 28 Jun 2014 08:56:22 +0900
Message-ID: <20140627235622.GA29865@verge.net.au>
References: <201406242157.05973.sergei.shtylyov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201406242157.05973.sergei.shtylyov@cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-sh@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, ben.dooks@codethink.co.uk
List-Id: devicetree@vger.kernel.org

On Tue, Jun 24, 2014 at 09:57:04PM +0400, Sergei Shtylyov wrote:
> Hello.
> 
>    Here's the set of 2 patches against Simon Horman's 'renesas.git' repo's
> 'renesas-devel-v3.16-rc2-20140623' tag. Here we add PCI USB device tree support
> for the R8A7790-based Lager board. As the 'pci-rcar-gen2' driver device tree
> support has been merged for 3.16, this patchset can now be merged too...
> 
> [1/2] ARM: shmobile: r8a7790: add internal PCI bridge nodes
> [2/2] ARM: shmobile: lager: enable internal PCI

Thanks, I will queue these up with
Shimoda-san's Tested-by.
