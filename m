From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 0/2] Add R8A7791 EtherAVB DT support
Date: Mon, 7 Dec 2015 15:14:09 +0900
Message-ID: <20151207061409.GA22834@verge.net.au>
References: <2926317.Iq110C4Bmk@wasted.cogentembedded.com>
 <56619C85.6040102@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56619C85.6040102@cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-sh@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Dec 04, 2015 at 05:00:37PM +0300, Sergei Shtylyov wrote:
> Hello.
> 
> On 12/3/2015 1:19 AM, Sergei Shtylyov wrote:
> 
> >    Here's the set of 2 patches against Simon Horman's 'renesas.git' repo,
> >'renesas-devel-20151201-v4.4-rc3' tag. Here we add the EtherAVB device tree
> >support for the R8A7791 SoC. The 2nd patch depends on the Simon's recent
> >EtherAVB driver patches in order to work...
> 
>    Well, not exactly "work", as the node is disabled. Anyway, Simon's
> patches got merged to net-next.git by Dave, so I think this series can be
> merged now as well...

Thanks, I have queued these up.
