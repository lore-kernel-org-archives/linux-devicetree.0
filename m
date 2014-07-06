From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 0/2] Add R8A7791/Henninger board CAN DT support
Date: Sun, 6 Jul 2014 16:33:27 +0200
Message-ID: <20140706143327.GJ3750@verge.net.au>
References: <201407032337.03509.sergei.shtylyov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201407032337.03509.sergei.shtylyov@cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-sh@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Jul 03, 2014 at 11:37:02PM +0400, Sergei Shtylyov wrote:
> Hello.
> 
>    Here's the set of 2 patches against Simon Horman's 'renesas.git' repo,
> 'renesas-devel-v3.16-rc3-20140701' tag. Here we add the CAN device tree support
> for the R8A7791-based Henninger board. It depends on the PFC CAN support and
> R-Car CAN device tree support patches posted recently in order to work.

Thanks, please repost these patches once the bindings have been merged.

> 
> [1/2] ARM: shmobile: r8a7791: add CAN DT support
> [2/2] ARM: shmobile: henninger: add CAN0 DT support
> 
> WBR, Sergei
> 
