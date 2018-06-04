From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: v3hsk: specify GEther PHY IRQ
Date: Mon, 4 Jun 2018 12:34:09 +0200
Message-ID: <20180604103408.fonnt5qtzne3qfhn@verge.net.au>
References: <4acc208e-c593-1e8a-00ca-fc9a5574074e@cogentembedded.com>
 <9e6c40eb-71d0-d35b-1cf7-9179e093ed10@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <9e6c40eb-71d0-d35b-1cf7-9179e093ed10@cogentembedded.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 01, 2018 at 11:47:14PM +0300, Sergei Shtylyov wrote:
> Specify GEther PHY IRQ in the V3H Starter Kit board's device tree, now
> that we have the GPIO support (previously phylib had to resort to polling).
> 
> Based on the original (and large) patch by Vladimir Barinov.
> 
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Given Olof Johansson's recent comments in ("Re: [GIT PULL] Renesas      
ARM64 Based SoC DT Updates for v4.18") please consider squashing this patch
and the previous one.

Other than that, this patch looks good to me.
