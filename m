From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2] ARM: shmobile: r8a7791: add ADSP clocks
Date: Fri, 20 Feb 2015 15:51:20 -0500
Message-ID: <20150220205117.GD20237@verge.net.au>
References: <4692589.Khlcz7yVTN@wasted.cogentembedded.com>
 <54E792EC.4090807@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <54E792EC.4090807@cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-sh@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Feb 20, 2015 at 11:02:52PM +0300, Sergei Shtylyov wrote:
> Hello.
> 
> On 12/30/2014 11:20 PM, Sergei Shtylyov wrote:
> 
> >Add the ADSP clocks to the CPG and MSTP5 nodes of the R8A7791 device tree.
> 
> >Based on the original patch by Konstantin Kozhevnikov
> ><konstantin.kozhevnikov@cogentembedded.com>.
> 
> >Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> >---
> >The patch is against 'renesas-devel-20141229-v3.19-rc2' tag of Simon Horman's
> >'renesas.git' repo plus the R8A7791 CAN patches posted last week. It depends on
> >the patch adding the ADSP clock support to  the 'clk-rcar-gen2' driver in order
> >to work.
> 
>    That patch now sits in Mike's tree and should soon be merged by Linus.
> Simon, please consider merging this patch.

Thanks, done.
