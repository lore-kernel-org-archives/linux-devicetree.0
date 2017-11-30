From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a77970: use CPG core clock
 macros
Date: Thu, 30 Nov 2017 11:09:11 +0100
Message-ID: <20171130100911.rdymtxswidey4bol@verge.net.au>
References: <20171128202105.552196002@cogentembedded.com>
 <20171129095558.wvvcvfctwfmtrkq4@verge.net.au>
 <d904863e-e8c9-76ad-9d12-fd36ed68c3b4@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <d904863e-e8c9-76ad-9d12-fd36ed68c3b4@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 29, 2017 at 08:00:52PM +0300, Sergei Shtylyov wrote:
> On 11/29/2017 12:55 PM, Simon Horman wrote:
> 
> > > Now that the commit ecadea00f588 ("dt-bindings: clock: Add R8A77970 CPG
> > > core clock definitions") has hit Linus' tree, we  can replace the bare
> > > numbers (we had to use to avoid a cross tree dependency) with these macro
> > > definitions...
> > > 
> > > Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> > 
> > Thanks, applied.
> 
>    Not seeing these 2 patches in the today's devel branch tho...

Strange, I don't see them either.
I have queued them up (again?).
