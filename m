From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2] arm64: dts: r8a7795: add IMR-LX4 support
Date: Fri, 30 Jun 2017 11:56:35 +0200
Message-ID: <20170630095635.GD26710@verge.net.au>
References: <20170627173152.532417992@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170627173152.532417992@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org, Konstantin Kozhevnikov <Konstantin.Kozhevnikov@cogentembedded.com>, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 27, 2017 at 08:30:53PM +0300, Sergei Shtylyov wrote:
> Describe the IMR-LX4 devices in the R8A7795 device tree.
> 
> Based on the original (and large) patch by Konstantin Kozhevnikov
> <Konstantin.Kozhevnikov@cogentembedded.com>.
> 
> Signed-off-by: Konstantin Kozhevnikov <Konstantin.Kozhevnikov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> ---
> This patch is against the 'renesas-devel-20170626-v4.12-rc7' tag of Simon
> Horman's 'renesas.git' repo.
> 
> The IMR-LX4 bindings were documented in the IMR driver patch and ACK'ed by Rob
> Herring, so I don't expect them to change...

Thanks Sergei,

applied for v4.14.
