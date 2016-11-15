From: Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH 3/3] powerpc/fsl/dts: add FMan node for t1042d4rdb
Date: Tue, 15 Nov 2016 00:18:42 -0600
Message-ID: <1479190722.21746.33.camel@buserror.net>
References: <1478879598-3362-1-git-send-email-madalin.bucur@nxp.com>
         <1478879598-3362-3-git-send-email-madalin.bucur@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1478879598-3362-3-git-send-email-madalin.bucur-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: madalin.bucur-3arQi8VN3Tc@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 2016-11-11 at 17:53 +0200, Madalin Bucur wrote:
> Signed-off-by: Madalin Bucur <madalin.bucur-3arQi8VN3Tc@public.gmane.org>
> ---
>  arch/powerpc/boot/dts/fsl/t1042d4rdb.dts | 47
> ++++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
> 
> diff --git a/arch/powerpc/boot/dts/fsl/t1042d4rdb.dts
> b/arch/powerpc/boot/dts/fsl/t1042d4rdb.dts
> index 2a5a90d..8c0c318 100644
> --- a/arch/powerpc/boot/dts/fsl/t1042d4rdb.dts
> +++ b/arch/powerpc/boot/dts/fsl/t1042d4rdb.dts
> @@ -48,6 +48,53 @@
>  					"fsl,deepsleep-cpld";
>  		};
>  	};
> +	soc: soc@ffe000000 {

Please leave a blank line between nodes, especially here at the top level.

-Scott

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
