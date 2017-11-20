From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 0/2] Add R8A77970/Eagle I2C support
Date: Mon, 20 Nov 2017 11:24:07 +0100
Message-ID: <20171120102407.v7pqrv7e4zmpwmdb@verge.net.au>
References: <20171116210629.732112911@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171116210629.732112911@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 17, 2017 at 12:06:29AM +0300, Sergei Shtylyov wrote:
> Hello!
> 
> Here's the set of 2 patches against Simon Horman's 'renesas.git' repo's
> 'renesas-devel-20171113-v4.14' tag. We're adding the R8A77970 I2C nodes
> and then describing the PCA9654 I/O expander connected to the I2C0 bus.
> These patches depend on the R8A77970/Eagle PFC suport patchset in order
> to apply/compile.

Given the dependency above I have marked these patches as deferred.
Please repost or otherwise ping me once the dependency has been
included in an RC release.

Thanks!
