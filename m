From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77980: add RWDT support
Date: Mon, 23 Jul 2018 18:08:27 +0200
Message-ID: <20180723160827.ziuivshq2mtagexq@verge.net.au>
References: <2368353.xfo5beGC5E@wasted.cogentembedded.com>
 <175a491f-a827-4a92-1884-2f1490d38a52@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <175a491f-a827-4a92-1884-2f1490d38a52@cogentembedded.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Will Deacon <will.deacon@arm.com>, linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 20, 2018 at 10:21:45PM +0300, Sergei Shtylyov wrote:
> Describe RWDT in the R8A77980 SoC device tree.
> 
> Enable RWDT on the Condor and V3H Starter Kit boards.
> 
> Based on the original (and large) patch by Vladimir Barinov.
> 
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> The patch is against the 'renesas-devel-20180720-v4.18-rc5' of Simon Horman's
> 'renesas.git' repo.  It depends on Geert Uytterhoeven's clock driver patches
> (adding the RWDT clock) in order to work...

But it is safe to apply without those patches, right?

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
