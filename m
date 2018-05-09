From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 0/8] ARM: dts: renesas: Add PMU device nodes
Date: Wed, 9 May 2018 21:12:39 +0200
Message-ID: <20180509191238.rmcmq6ls3bmosxjb@verge.net.au>
References: <1525701427-12914-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1525701427-12914-1-git-send-email-geert+renesas@glider.be>
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
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, May 07, 2018 at 03:56:59PM +0200, Geert Uytterhoeven wrote:
> 	Hi Simon, Magnus,
> 
> This patch series enables support for the ARM Performance Monitor Units
> in Cortex-A7, Cortex-A9, and Cortex-A15 CPU cores on Renesas RZ/A1,
> R-Car Gen2, and RZ/G1 SoCs.  This allows for better performance analysis
> using the "perf" tool.
> 
> Sample output of "perf stat echo" on r8a7791/koelsch:
> 
>   - Before:
> 
>      Performance counter stats for 'echo':
> 
> 	      2,636300      task-clock (msec)         #    0,265 CPUs utilized
> 		     8      context-switches          #    0,003 M/sec
> 		     0      cpu-migrations            #    0,000 K/sec
> 		    43      page-faults               #    0,016 M/sec
>        <not supported>      cycles
>        <not supported>      stalled-cycles-frontend
>        <not supported>      stalled-cycles-backend
>        <not supported>      instructions
>        <not supported>      branches
>        <not supported>      branch-misses
> 
> 	   0,009960300 seconds time elapsed
> 
>   - After:
> 
>      Performance counter stats for 'echo':
> 
> 	      2,455400      task-clock (msec)         #    0,273 CPUs utilized
> 		     3      context-switches          #    0,001 M/sec
> 		     0      cpu-migrations            #    0,000 K/sec
> 		    45      page-faults               #    0,018 M/sec
> 	     3.556.784      cycles                    #    1,449 GHz
>        <not supported>      stalled-cycles-frontend
>        <not supported>      stalled-cycles-backend
> 	     1.350.480      instructions              #    0,38  insns per cycle
> 	       335.542      branches                  #  136,655 M/sec
> 		18.075      branch-misses             #    5,39% of all branches
> 
> 	   0,008987900 seconds time elapsed
> 
> Still missing:
>   - R-Mobile APE6 (no PMU interrupt documented),
>   - R-Car M1A and H1 (the PMU interrupt seems to be routed to the legacy
>     SH INTC only?),
>   - RZ/G1C (SMP support not yet upstream).
> 
> This has been tested on r8a7791/koelsch, and boot-tested on
> r7s72100/genmai, r8a7790/lager, r8a7792/blanche, and r8a7794/silk.

Thanks, applied.
