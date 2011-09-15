From: Kumar Gala <kumar.gala@freescale.com>
Subject: Re: [PATCH] [v2] powerpc/85xx: clean up FPGA device tree nodes for
	Freecsale QorIQ boards
Date: Thu, 15 Sep 2011 11:29:13 -0500
Message-ID: <454A6F08-BD85-4C80-BF0D-3BC04D95EA36@freescale.com>
References: <1316036538-311-1-git-send-email-timur@freescale.com>
Mime-Version: 1.0 (Apple Message framework v1244.3)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <1316036538-311-1-git-send-email-timur@freescale.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: Timur Tabi <timur@freescale.com>
Cc: linuxppc-dev@ozlabs.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org


On Sep 14, 2011, at 4:42 PM, Timur Tabi wrote:

> Standarize and document the FPGA nodes used on Freescale QorIQ reference
> boards.  There are different kinds of FPGAs used on the boards, but
> only two are currently standard: "pixis" and "qixis".  Although there are
> minor differences among the boards that have one kind of FPGA, most of the
> functionality is the same, so it makes sense to create common compatibility
> strings.
> 
> Signed-off-by: Timur Tabi <timur@freescale.com>
> ---
> 
> v2: removed references to the CPLD
> 
> This patch applies on top of "[PATCH 3/4] powerpc/p3060qds: Add support for
> P3060QDS board", but it also assumes that the 'ranges' property for the
> localbus node on the P3060QDS device tree includes the missing line for
> the NAND devices.
> 
> .../devicetree/bindings/powerpc/fsl/board.txt      |   30 ++++++++++++--------
> arch/powerpc/boot/dts/p1022ds.dts                  |    2 +-
> arch/powerpc/boot/dts/p2020ds.dts                  |    5 +++
> arch/powerpc/boot/dts/p3041ds.dts                  |    4 +-
> arch/powerpc/boot/dts/p3060qds.dts                 |    8 ++++-
> arch/powerpc/boot/dts/p4080ds.dts                  |    8 ++++-
> arch/powerpc/boot/dts/p5020ds.dts                  |    4 +-
> 7 files changed, 42 insertions(+), 19 deletions(-)

What happened to looking at pixis vs ngpixis ?

- k
