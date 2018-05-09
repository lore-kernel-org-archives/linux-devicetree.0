From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 0/2] arm64: dts: renesas: r8a77970: Add SMP Support
Date: Wed, 9 May 2018 21:08:05 +0200
Message-ID: <20180509190804.l6luktwhrfeasspc@verge.net.au>
References: <1525879403-12207-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1525879403-12207-1-git-send-email-geert+renesas@glider.be>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
List-Id: devicetree@vger.kernel.org

On Wed, May 09, 2018 at 05:23:21PM +0200, Geert Uytterhoeven wrote:
>         Hi Simon, Magnus,
> 
> This patch series enables SMP support on the R-Car V3M SoC, by adding
> the second Cortex-A53 CPU core.  It also adds the performance monitor
> unit, and links it to both CPU cores.
> 
> Changes compared to v1:
>   - Adjust GIC_CPU_MASK_SIMPLE(),
>   - Use symbolic core clock and power domain indices,
>   - Move the pmu node from the soc subnode to the root node, as it
>     doesn't have registers.
> 
> Note that the PSCI implementation on Eagle may be a preliminary version
> with some familiar quirks:
>   - SMP bringup works, and both CPUs can be used,
>   - Offlining CPU0 crashes the system,
>   - CPU1 can be offlined, but trying to bring it online again crashes
>     the system, too.
> 
> I'm confident these will be fixed in future firmware versions, just like
> on H3/Salvator-X.  Note that
> git@github.com:renesas-rcar/arm-trusted-firmware.git does not have
> support for R-Car V3M, V3H, and D3.
> 
> Thanks!
> 
> Geert Uytterhoeven (2):
>   arm64: dts: renesas: r8a77970: Add secondary CA53 CPU core
>   arm64: dts: renesas: r8a77970: Add Cortex-A53 PMU node

Thanks, applied.
