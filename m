From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v4] arm64: dts: renesas: r8a7795: Move nodes which have
 no reg property out of bus
Date: Thu, 7 Dec 2017 11:00:45 +0100
Message-ID: <20171207100040.kv4mf2bbwvw2hnj2@verge.net.au>
References: <20171130102539.19130-1-horms+renesas@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171130102539.19130-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Magnus Damm <magnus.damm@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 30, 2017 at 11:25:39AM +0100, Simon Horman wrote:
> Move pmu_a5[73], timer and thermal-zones nodes from soc node to root node.
> The nodes that have been moved do not have any register properties and thus
> shouldn't be placed on the bus.
> 
> This problem is flagged by the compiler as follows:

...

> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
> v4
> * Use interrupts-extended rather than interrupt-parent + interrupts
>   in /pmu_* and /timer nodes as seems to be preferred.
> v3
> * Add interrupt-parent property to /pmu_* and /timer nodes as
>   it is no longer inherited from the parent node
> v2
> * Preserve alphabetical order of nodes present in root node.

I have applied this with Geert's review tag from v2.
