From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 0/3] arm64: dts: r8a7796: Add CAN/CAN FD support
Date: Fri, 25 Nov 2016 08:48:13 +0100
Message-ID: <20161125074813.GA14431@verge.net.au>
References: <1479903243-1860-1-git-send-email-chris.paterson2@renesas.com>
 <1480004021-4037-1-git-send-email-chris.paterson2@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1480004021-4037-1-git-send-email-chris.paterson2@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Chris Paterson <chris.paterson2@renesas.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 24, 2016 at 04:13:38PM +0000, Chris Paterson wrote:
> This series adds CAN and CAN FD support to the r8a7796.
> 
> Changes since v1:
> - Split device tree changes from bindings documentation.
> - Rebased on renesas-devel-20161123v2-v4.9-rc6.
> 
> 
> Chris Paterson (3):
>   arm64: dts: r8a7796: Add CAN external clock support
>   arm64: dts: r8a7796: Add CAN support
>   arm64: dts: r8a7796: Add CAN FD support

Thanks Chris,

I have queued these up for v4.11 in the devel branch of the renesas tree.
