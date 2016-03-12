From: Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [v5] powerpc/mpc85xx: Add MDIO bus muxing support to the board
 device tree(s)
Date: Fri, 11 Mar 2016 19:59:34 -0600
Message-ID: <20160312015934.GA3286@home.buserror.net>
References: <1438589651-15007-1-git-send-email-igal.liberman@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1438589651-15007-1-git-send-email-igal.liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Igal.Liberman" <igal.liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shaohui.Xie-KZfg59tc24xl57MIdRCFDg@public.gmane.org, madalin.bucur-KZfg59tc24xl57MIdRCFDg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 03, 2015 at 11:14:10AM +0300, Igal.Liberman wrote:
> From: Igal Liberman <Igal.Liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> 
> Describe the PHY topology for all configurations supported by each board
> 
> Based on prior work by Andy Fleming <afleming-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> 
> Signed-off-by: Shruti Kanetkar <Shruti-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Signed-off-by: Emil Medve <Emilian.Medve-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
> Signed-off-by: Igal Liberman <Igal.Liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
> 
> Depends on the following patch set:
> 	https://patchwork.ozlabs.org/patch/503107/
> 	https://patchwork.ozlabs.org/patch/503108/
> 
> v4 ---> v5:
> 	- Correct "Signed-off-by" order
> 
> v3 ---> v4:
> 	- Added T1024 support
> 
> v2 ---> v3:
> 	- Fixed incorrect E-Mail address (signed-off-by)
> 
> v1 ---> v2
> 	- Remove 'Change-Id'
> 
>  arch/powerpc/boot/dts/fsl/b4860qds.dts    |   60 ++++-
>  arch/powerpc/boot/dts/fsl/b4qds.dtsi      |   51 ++++-
>  arch/powerpc/boot/dts/fsl/p1023rdb.dts    |   24 +-
>  arch/powerpc/boot/dts/fsl/p2041rdb.dts    |   92 +++++++-
>  arch/powerpc/boot/dts/fsl/p3041ds.dts     |  112 ++++++++-
>  arch/powerpc/boot/dts/fsl/p4080ds.dts     |  184 ++++++++++++++-
>  arch/powerpc/boot/dts/fsl/p5020ds.dts     |  112 ++++++++-
>  arch/powerpc/boot/dts/fsl/p5040ds.dts     |  234 ++++++++++++++++++-
>  arch/powerpc/boot/dts/fsl/t1023rdb.dts    |   41 ++++
>  arch/powerpc/boot/dts/fsl/t1024rdb.dts    |   45 ++++
>  arch/powerpc/boot/dts/fsl/t1040rdb.dts    |   32 ++-
>  arch/powerpc/boot/dts/fsl/t1042rdb.dts    |   30 ++-
>  arch/powerpc/boot/dts/fsl/t1042rdb_pi.dts |   18 +-
>  arch/powerpc/boot/dts/fsl/t104xqds.dtsi   |  178 ++++++++++++++-
>  arch/powerpc/boot/dts/fsl/t104xrdb.dtsi   |   33 ++-
>  arch/powerpc/boot/dts/fsl/t2080qds.dts    |  158 ++++++++++++-
>  arch/powerpc/boot/dts/fsl/t2080rdb.dts    |   67 +++++-
>  arch/powerpc/boot/dts/fsl/t2081qds.dts    |  221 +++++++++++++++++-
>  arch/powerpc/boot/dts/fsl/t4240qds.dts    |  400 ++++++++++++++++++++++++++++++++-
>  arch/powerpc/boot/dts/fsl/t4240rdb.dts    |  149 +++++++++++-
>  20 files changed, 2221 insertions(+), 20 deletions(-)

p1023rdb removed when applying, as it has dtc errors due to missing base
fman support.

-SCott
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
