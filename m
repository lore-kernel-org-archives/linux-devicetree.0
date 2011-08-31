From: Kumar Gala <kumar.gala@freescale.com>
Subject: Re: [PATCH] powerpc/85xx: clean up FPGA device tree nodes for
	Freecsale QorIQ boards
Date: Tue, 30 Aug 2011 21:26:40 -0500
Message-ID: <3F34FBCD-3F0B-4D59-A947-C16CC812B42E@freescale.com>
References: <1314644999-16955-1-git-send-email-timur@freescale.com>
Mime-Version: 1.0 (Apple Message framework v1084)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <1314644999-16955-1-git-send-email-timur@freescale.com>
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


On Aug 29, 2011, at 2:09 PM, Timur Tabi wrote:

> Standarize and document the FPGA nodes used on Freescale QorIQ reference
> boards.  There are three kinds of FPGAs used on the boards: pixis, qixis, and
> cpld.  Although their are minor differences among the boards that have one
> kind of FPGA, most of the functionality is the same, so it makes sense
> to create common compatibility strings.
> 
> Signed-off-by: Timur Tabi <timur@freescale.com>
> ---
> 
> Changes for other Freescale boards will be made in future patches.
> 
> .../devicetree/bindings/powerpc/fsl/board.txt      |   30 ++++++++++++--------
> arch/powerpc/boot/dts/p1010rdb.dts                 |   10 ++----
> arch/powerpc/boot/dts/p1020rdb.dts                 |    7 ++++-
> arch/powerpc/boot/dts/p1022ds.dts                  |    2 +-
> arch/powerpc/boot/dts/p2020ds.dts                  |    5 +++
> arch/powerpc/boot/dts/p2020rdb.dts                 |    4 ++
> arch/powerpc/boot/dts/p2040rdb.dts                 |    8 ++++-
> arch/powerpc/boot/dts/p3041ds.dts                  |    4 +-
> arch/powerpc/boot/dts/p4080ds.dts                  |    8 ++++-
> arch/powerpc/boot/dts/p5020ds.dts                  |    4 +-
> 10 files changed, 55 insertions(+), 27 deletions(-)

Do we really want the generic "fsl,fpga-cpld" & "fsl,fpga-pixis"?  This seems to vague.  Also you need "pixis" on MPC8544DS, MPC8572DS, MPC8536DS.

Also fpga-cpld makes no sense if we keep this.  You are either a CPLD or FPGA not both.

- k
