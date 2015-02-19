From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 0/2] Add R8A7790 CAN DT support
Date: Thu, 19 Feb 2015 17:13:32 -0500
Message-ID: <20150219221330.GA617@verge.net.au>
References: <28994794.h3WeokSSG3@wasted.cogentembedded.com>
 <54E65905.7090009@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <54E65905.7090009@cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-sh@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Feb 20, 2015 at 12:43:33AM +0300, Sergei Shtylyov wrote:
> On 01/06/2015 12:31 AM, Sergei Shtylyov wrote:
> 
> >    Here's the set of 2 patches against Simon Horman's 'renesas.git' repo,
> >'renesas-devel-20141231-v3.19-rc2' tag. Here we add the CAN device tree support
> >for the R8A7790 SoC (unfortunately, it's impossible to test CAN on the Lager
> >board). It depends on the clk driver RCAN clock patch reposted today in order
> >to work.
> 
>    Simon, now that this patch has been merged, could you merge this patchset too?

Sure, I have queued them up as part of renesas-devel-20150219v2-v3.19.

> >[1/2] ARM: shmobile: r8a7790: add CAN clocks
> >[2/2] ARM: shmobile: r8a7790: add CAN DT support
> 
> WBR, Sergei
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-sh" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
