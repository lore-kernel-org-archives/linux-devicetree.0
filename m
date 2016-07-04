From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 2/2] arm64: dts: r8a7795: add FDP1 device nodes
Date: Mon, 4 Jul 2016 14:45:47 +0200
Message-ID: <20160704124547.GH26270@verge.net.au>
References: <1467293563-940-1-git-send-email-kieran@bingham.xyz>
 <1467293563-940-3-git-send-email-kieran@bingham.xyz>
 <57768023.8010507@bingham.xyz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <57768023.8010507@bingham.xyz>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Kieran Bingham <kieran@ksquared.org.uk>
Cc: linux-renesas-soc@vger.kernel.org, magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 01, 2016 at 03:37:23PM +0100, Kieran Bingham wrote:
> Hi Simon,
> 
> The bindings for this have now been acked by RobH.

Thanks, I have queued these up for v4.9.

There was a small amount of fuzz when applying the first patch,
please check to make sure it has been applied correctly once
it hits the devel branch of the renesas tree.
