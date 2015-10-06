From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] ARM: shmobile: porter: add Ether DT support
Date: Tue, 6 Oct 2015 09:45:02 +0900
Message-ID: <20151006004502.GC12506@verge.net.au>
References: <201404250239.39150.sergei.shtylyov@cogentembedded.com>
 <1507520.6rxyDiKYNB@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1507520.6rxyDiKYNB@wasted.cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-sh@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 06, 2015 at 01:51:01AM +0300, Sergei Shtylyov wrote:
> Define  the Porter board dependent part of  the Ether device node.
> Enable DHCP and NFS root for the kernel booting.
> 
> This  patch  is analogous to the commit 26b0d2cf73cb (ARM: shmobile: henninger:
> add Ether DT support)  as there  are no differences between those boards in this
> respect.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---

Thanks, I have queued this up.
