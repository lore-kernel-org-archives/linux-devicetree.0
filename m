From: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH] powerpc/85xx:DTS: Fix tbi node location for Px020RDB
Date: Wed, 22 Jun 2011 06:34:11 -0500
Message-ID: <F9CD495E-12BF-467D-BE96-CC11486F70B8@kernel.crashing.org>
References: <1307501379-3160-1-git-send-email-prabhakar@freescale.com>
Mime-Version: 1.0 (Apple Message framework v1084)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1307501379-3160-1-git-send-email-prabhakar-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Prabhakar Kushwaha <prabhakar-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: meet2prabhu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


On Jun 7, 2011, at 9:49 PM, Prabhakar Kushwaha wrote:

> ten-bit interface (TBI) module is part of SoC not board.
> 
> Move tbi entries from board related dts files to Si dts.
> 
> Signed-off-by: Prabhakar Kushwaha <prabhakar-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
> Based upon http://git.kernel.org/pub/scm/linux/kernel/git/galak/powerpc.git (branch next)
> 
> arch/powerpc/boot/dts/p1020rdb.dts            |    9 ---------
> arch/powerpc/boot/dts/p1020rdb_camp_core0.dts |    8 --------
> arch/powerpc/boot/dts/p1020si.dtsi            |    6 +++++-
> arch/powerpc/boot/dts/p2020rdb.dts            |    8 --------
> arch/powerpc/boot/dts/p2020rdb_camp_core0.dts |    8 --------
> arch/powerpc/boot/dts/p2020si.dtsi            |    6 +++++-
> 6 files changed, 10 insertions(+), 35 deletions(-)
> 
> diff --git a/arch/powerpc/boot/dts/p1020rdb.dts b/arch/powerpc/boot/dts/p1020rdb.dts
> index d6a8ae4..a4e5d6c 100644
> --- a/arch/powerpc/boot/dts/p1020rdb.dts
> +++ b/arch/powerpc/boot/dts/p1020rdb.dts
> @@ -211,14 +211,6 @@
> 			};
> 		};
> 
> -		mdio@25000 {
> -
> -			tbi0: tbi-phy@11 {
> -				reg = <0x11>;
> -				device_type = "tbi-phy";
> -			};
> -		};
> -
> 		enet0: ethernet@b0000 {
> 			fixed-link = <1 1 1000 0 0>;
> 			phy-connection-type = "rgmii-id";
> @@ -227,7 +219,6 @@
> 
> 		enet1: ethernet@b1000 {
> 			phy-handle = <&phy0>;
> -			tbi-handle = <&tbi0>;
> 			phy-connection-type = "sgmii";
> 
> 		};

I'm not sure we should do this.  The phy address we pick is board specific so it should NOT be in .dtsi

- k
