From: Kim Phillips <kim.phillips@freescale.com>
Subject: Re: [PATCH] libfdt: introduce fdt type annotation for use
 by endian checkers
Date: Tue, 30 Oct 2012 17:27:34 -0500
Message-ID: <20121030172734.887f5b3c0bb547b62b84c95c@freescale.com>
References: <1350433728-24120-1-git-send-email-kim.phillips@freescale.com>
	<507F4B0B.1020401@gmail.com>
	<20121018121112.GI23523@truffula.fritz.box>
	<20121018173022.32f1745249d162d1aa453694@freescale.com>
	<20121019004324.GN23523@truffula.fritz.box>
	<20121030165754.65b34c78cd0d3a0d6ab7d34e@freescale.com>
	<50905385.5040808@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <50905385.5040808@wwwdotorg.org>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: u-boot@lists.denx.de, Jon Loeliger <jdl@jdl.com>, devicetree-discuss@lists.ozlabs.org, David Gibson <david@gibson.dropbear.id.au>
List-Id: devicetree@vger.kernel.org

On Tue, 30 Oct 2012 16:24:05 -0600
Stephen Warren <swarren@wwwdotorg.org> wrote:

> On 10/30/2012 03:57 PM, Kim Phillips wrote:
> > Projects such as linux and u-boot run sparse on libfdt.  libfdt
> > contains the notion of endianness via usage of endian conversion
> > functions such as fdt32_to_cpu.  As such, in order to pass endian
> > checks, libfdt has to annotate its fdt variables as big endian.
> > This patch does that ifdef __CHECKER__ (a symbol sparse defines),
> > for two new fdt types: fdt32_t and fdt64_t, and subsequently
> > silences warnings emitted by sparse when parsing libfdt.
> 
> Should libfdt patches be committed to the main dtc repository (which I
> assume is also upstream for libfdt?) rather than U-Boot first?

that's what this is meant to be: a patch for dtc, cc: u-boot, since
it was originally a patch to u-boot's copy.  Fyi, dtc sumbission
guidelines dictate To: jdl, Cc: devicetree-discuss...

> Otherwise, if we want to bring in a new libfdt from upstream, that would
> trash all the U-Boot-specific changes in U-Boot's copy of libfdt.

right, this patch is for the dtc.  I assume gvb will pull it into
u-boot once it's applied.

Kim
