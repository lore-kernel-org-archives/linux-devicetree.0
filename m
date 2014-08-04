From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 0/2] Add VIN and ADV7180 device tree support for
 R8A7791/Henninger board
Date: Mon, 4 Aug 2014 16:08:13 +0900
Message-ID: <20140804070813.GB1889@verge.net.au>
References: <201408020402.14560.sergei.shtylyov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201408020402.14560.sergei.shtylyov@cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-sh@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sat, Aug 02, 2014 at 04:02:13AM +0400, Sergei Shtylyov wrote:
> Hello.
> 
>    Here's the set of 2 patches against Simon Horman's 'renesas.git' repo,
> 'renesas-devel-v3.16-rc7-20140731v2' tag. Here we add the VIN and ADV7180 video
> decoder device tree support on the R8A7791/Henninger board. The patchset
> requires Ben Dooks' 'rcar_vin' and 'soc_camera' DT support patches already
> merged to the 'media_tree.git' in order to work.
> 
> [1/2] ARM: shmobile: r8a7791: add VIN DT support
> [2/2] ARM: shmobile: henninger: add VIN0/ADV7180 DT support

Thanks, I have queued these up for v3.18.
