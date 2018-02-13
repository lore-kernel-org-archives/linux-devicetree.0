From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 0/3] Add R8A77970/Eagle PFC support
Date: Tue, 13 Feb 2018 08:52:22 +0100
Message-ID: <20180213075222.mf7dsbwgv5ln4ond@verge.net.au>
References: <20171110200218.747996672@cogentembedded.com>
 <20171113075303.zmkmq6bt3lfuttwu@verge.net.au>
 <049b0a0a-b1c2-73e6-c471-ca8342bba6ab@ideasonboard.com>
 <19d23fa2-1205-89a0-786f-f301ca7a0f7b@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <19d23fa2-1205-89a0-786f-f301ca7a0f7b@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 12, 2018 at 09:04:06PM +0300, Sergei Shtylyov wrote:
> On 01/19/2018 01:48 PM, Kieran Bingham wrote:
> 
> >>> Here's the set of 3 patches against Simon Horman's 'renesas.git' repo's
> >>> 'renesas-devel-20171110-v4.14-rc8' tag.  We're adding the R8A77970 PFC node
> >>> and then describing the pins for SCIF0 and EtherAVB devices declared earlier.
> >>> These patches depend on the R8A77970 PFC suport in order to work properly.
> >>>
> >>> [1/3] arm64: dts: renesas: r8a77970: add PFC support
> >>> [2/3] arm64: dts: renesas: eagle: add SCIF0 pins
> >>> [3/3] arm64: dts: renesas: eagle: add EtherAVB pins
> >>
> >> Hi Sergei,
> >>
> >> I have marked these patches as deferred pending acceptance of the PFC
> >> driver. Please repost or otherwise ping me once that dependency has been
> >> accepted.
> > 
> > Has the dependency blocking this series been resolved yet ?
> 
>    Now it is, except for the 3rd patch... Simon, do I need to repost the first two?
> The 1st one did apply to 4.16-rc1 here with a fuzz...

Thanks for bringing this to my attention.  No need to repost. I've applied
all three patches and plan to push later today.
