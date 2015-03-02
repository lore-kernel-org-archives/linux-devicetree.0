From: Emil Medve <Emilian.Medve-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] powerpc/mpc85xx: Add MDIO bus muxing support to the board
 device tree(s)
Date: Mon, 2 Mar 2015 09:42:22 -0600
Message-ID: <54F484DE.30204@Freescale.com>
References: <1425310332-21744-1-git-send-email-Emilian.Medve@Freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425310332-21744-1-git-send-email-Emilian.Medve-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: scottwood-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: afleming-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Igal Liberman <Igal.Liberman-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>, Shruti Kanetkar <Kanetkar.Shruti-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Scott,


On 03/02/2015 09:32 AM, Emil Medve wrote:
> From: Igal Liberman <Igal.Liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> 
> Describe the PHY topology for all configurations supported by each board
> 
> Based on prior work by Andy Fleming <afleming-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> Change-Id: I4fbcc5df9ee7c4f784afae9dab5d1e78cdc24f0f

Bah, I'll remove this...

> Signed-off-by: Igal Liberman <Igal.Liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Signed-off-by: Shruti Kanetkar <Kanetkar.Shruti-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Emil Medve <Emilian.Medve-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
> ---
>  arch/powerpc/boot/dts/b4860qds.dts    |  60 ++++-
>  arch/powerpc/boot/dts/b4qds.dtsi      |  51 ++++-
>  arch/powerpc/boot/dts/p1023rdb.dts    |  24 +-
>  arch/powerpc/boot/dts/p2041rdb.dts    |  92 +++++++-
>  arch/powerpc/boot/dts/p3041ds.dts     | 112 +++++++++-
>  arch/powerpc/boot/dts/p4080ds.dts     | 184 +++++++++++++++-
>  arch/powerpc/boot/dts/p5020ds.dts     | 112 +++++++++-
>  arch/powerpc/boot/dts/p5040ds.dts     | 234 +++++++++++++++++++-
>  arch/powerpc/boot/dts/t1040rdb.dts    |  32 ++-
>  arch/powerpc/boot/dts/t1042rdb.dts    |  30 ++-
>  arch/powerpc/boot/dts/t1042rdb_pi.dts |  18 +-
>  arch/powerpc/boot/dts/t104xqds.dtsi   | 178 ++++++++++++++-
>  arch/powerpc/boot/dts/t104xrdb.dtsi   |  33 ++-
>  arch/powerpc/boot/dts/t2080qds.dts    | 158 +++++++++++++-
>  arch/powerpc/boot/dts/t2080rdb.dts    |  67 +++++-
>  arch/powerpc/boot/dts/t2081qds.dts    | 221 ++++++++++++++++++-
>  arch/powerpc/boot/dts/t4240qds.dts    | 400 +++++++++++++++++++++++++++++++++-
>  arch/powerpc/boot/dts/t4240rdb.dts    | 149 ++++++++++++-
>  18 files changed, 2135 insertions(+), 20 deletions(-)


Cheers,
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
