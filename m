From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 1/2] ARM: shmobile: r8a7790: fix "gpio-ranges" props
Date: Fri, 23 Oct 2015 09:19:46 +0900
Message-ID: <20151023001946.GB15844@verge.net.au>
References: <10037494.4LD4T2QGPX@wasted.cogentembedded.com>
 <14605037.EZjgJcsdsk@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <14605037.EZjgJcsdsk@wasted.cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-sh@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Oct 22, 2015 at 02:04:41AM +0300, Sergei Shtylyov wrote:
> On R8A7790, GPIO banks 1 and 2 are missing  pins 30 and 31.  Correct the
> "gpio-ranges" properties of the corresponding device nodes.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> This patch is against the 'renesas-devel-20151019-v4.3-rc6' of Simon Horman's
> 'renesas.git' repo.

Thanks, I have queued this up.
