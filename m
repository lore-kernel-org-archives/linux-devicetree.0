From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 0/2] Add VIN and ADV7180 DT support for R8A7791/Henninger
 board
Date: Wed, 11 Jun 2014 08:54:45 +0900
Message-ID: <20140610235445.GE20738@verge.net.au>
References: <201406110304.18976.sergei.shtylyov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201406110304.18976.sergei.shtylyov@cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-sh@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Jun 11, 2014 at 03:04:18AM +0400, Sergei Shtylyov wrote:
> Hello.
> 
>    Here's the set of 2 patches against Simon Horman's 'renesas.git' repo,
> 'renesas-devel-v3.15-20140610' tag plus the Henninger I2C2 DT support patch
> that I posted earlier. Here we add the VIN and ADV7180 video decoder device
> tree support on the R8A7791/Henninger board. The patchset requires Ben Dooks'
> adv7180, rcar_vin, and soc_camera DT support patches posted back in April in
> order to work.

I wonder what the status of those (driver?) patches are.

In general I prefer bindings to be accepted before they are used.

> [1/2] ARM: shmobile: r8a7791: add VIN DT support
> [2/2] ARM: shmobile: henninger: add VIN0/ADV7180 DT support
> 
> WBR, Sergei
> --
> To unsubscribe from this list: send the line "unsubscribe linux-sh" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
