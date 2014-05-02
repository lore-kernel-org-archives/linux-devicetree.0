From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] ARM: shmobile: henninger: specify EXTAL frequency
Date: Fri, 2 May 2014 11:30:12 +0900
Message-ID: <20140502023012.GH2265@verge.net.au>
References: <201405020256.34093.sergei.shtylyov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201405020256.34093.sergei.shtylyov@cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-sh@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, May 02, 2014 at 02:56:33AM +0400, Sergei Shtylyov wrote:
> When creating the initial device tree for the Henninger board,  I've overlooked
> that EXTAL frequency needs to be overridden there. The 'sh-sci' driver  managed
> to work somehow but the SDHI driver that I've tried to enable just hanged with
> the default EXTAL frequency of 0...
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> This patch is against 'renesas-devel-v3.15-rc3-20140429' tag of Simon Horman's
> 'renesas.git' repo.

Thanks, I have queued this up.
