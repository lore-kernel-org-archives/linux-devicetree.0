From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v4 3/4] dtc/libfdt: introduce fdt types for
 annotation by endian checkers
Date: Mon, 3 Dec 2012 15:05:34 +1100
Message-ID: <20121203040534.GD4293@truffula.fritz.box>
References: <E1TYeB5-0003oB-IS@jdl.com>
	<1352941199-19393-1-git-send-email-kim.phillips@freescale.com>
	<1352941199-19393-3-git-send-email-kim.phillips@freescale.com>
	<20121115044340.GI32290@truffula.fritz.box>
	<20121114231204.8f19082c7acc1cea2a2d794f@freescale.com>
	<20121119023039.GK5735@truffula.fritz.box>
	<20121128173301.2b52b22a39fe6c3ce5a088fb@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
Content-Disposition: inline
In-Reply-To: <20121128173301.2b52b22a39fe6c3ce5a088fb@freescale.com>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Kim Phillips <kim.phillips@freescale.com>
Cc: u-boot@lists.denx.de, jdl@jdl.com, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 28, 2012 at 05:33:01PM -0600, Kim Phillips wrote:
> Projects such as linux and u-boot run sparse on libfdt.  libfdt
> contains the notion of endianness via usage of endian conversion
> functions such as fdt32_to_cpu.  As such, in order to pass endian
> checks, libfdt has to annotate its fdt variables such that sparse
> can warn when mixing bitwise and regular integers.  This patch adds
> these new fdtXX_t types and, ifdef __CHECKER__ (a symbol sparse
> defines), includes the bitwise annotation.
> 
> Signed-off-by: Kim Phillips <kim.phillips@freescale.com>

Much better, thanks

Acked-by: David Gibson <david@gibson.dropbear.id.au>

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
