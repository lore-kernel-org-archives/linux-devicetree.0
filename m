From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v5 0/3] Add R8A7791/Henninger board CAN DT support
Date: Thu, 19 Feb 2015 17:13:46 -0500
Message-ID: <20150219221346.GB617@verge.net.au>
References: <1652479.NHBlqJ9OaR@wasted.cogentembedded.com>
 <54E6593A.500@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <54E6593A.500@cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-sh@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Feb 20, 2015 at 12:44:26AM +0300, Sergei Shtylyov wrote:
> On 01/06/2015 01:22 AM, Sergei Shtylyov wrote:
> 
> >    Here's the set of 3 patches against Simon Horman's 'renesas.git' repo,
> >'renesas-devel-20141231-v3.19-rc2' tag. Here we add the CAN device tree support
> >for the R8A7791-based Henninger board. It depends on the clk driver RCAN clock
> >patch reposted today in order to work.
> 
>    Simon, now that this patch has been merged, could you merge the patchset too?

Sure, I have queued them up as part of renesas-devel-20150219v2-v3.19

> >[1/3] ARM: shmobile: r8a7791: add CAN clocks
> >[2/3] ARM: shmobile: r8a7791: add CAN DT support
> >[3/3] ARM: shmobile: henninger: add CAN0 DT support
> 
> WBR, Sergei
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-sh" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
