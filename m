From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 0/5] Add R8A77980/Condor board support
Date: Mon, 19 Feb 2018 10:13:59 +0100
Message-ID: <20180219091359.satlh3tmdftre6mt@verge.net.au>
References: <ae31804b-969b-9b20-16d0-50f5dea42f08@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <ae31804b-969b-9b20-16d0-50f5dea42f08@cogentembedded.com>
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

On Fri, Feb 16, 2018 at 09:25:30PM +0300, Sergei Shtylyov wrote:
> Hello!
> 
> Here's the set of 11 patches against Simon Horman's 'renesas.git' repo's
> 'renesas-devel-20180216-v4.16-rc1' tag. I'm adding the device tree support
> for the R8A77980-based Condor board (note that NFS root would only work on
> the Condor boards [re]wired for booting from EtherAVB -- we haven't been
> able to get the 'sh_eth' driver working in either U-Boot or Linux so far).
> The necessary SYS-DMAC, [H]SCIF, and EtherAVB bindings updates have been
> posted, the clock driver has been reposted yesterday, and the merged patches
> have been dropped from this respin of the series...
> 
> [1/5] soc: renesas: rcar-sysc: add R8A77980 support
> [2/5] arm64: dts: renesas: r8a77980: add [H]SCIF support
> [3/5] arm64: dts: renesas: r8a77980: add EtherAVB support
> [4/5] arm64: dts: renesas: initial Condor board device tree
> [5/5] arm64: dts: renesas: condor: add EtherAVB support

Thanks, applied.
