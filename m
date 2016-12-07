From: Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [v2,2/3] powerpc/fsl/dts: add QMan and BMan portal nodes on t1024
Date: Tue, 6 Dec 2016 18:59:04 -0600
Message-ID: <20161207005904.GA12811@home.buserror.net>
References: <1481030019-31854-2-git-send-email-madalin.bucur@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1481030019-31854-2-git-send-email-madalin.bucur-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Madalin Bucur <madalin.bucur-3arQi8VN3Tc@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 06, 2016 at 03:13:38PM +0200, Madalin Bucur wrote:
> Signed-off-by: Madalin Bucur <madalin.bucur-3arQi8VN3Tc@public.gmane.org>
> ---
>  arch/powerpc/boot/dts/fsl/t1024qds.dts | 29 +++++++++++++++++++++++++++++
>  arch/powerpc/boot/dts/fsl/t1024rdb.dts | 33 +++++++++++++++++++++++++++++++++
>  2 files changed, 62 insertions(+)

So, in patch 1/3 you add qman and bman nodes to t1023si-post.dtsi and
call it "add QMan and BMan portal nodes on t1023rdb" as if it were
board-specific (the only board-specific part is the reserved-memory
nodes, not the portals).

Then, in this patch you only touch board-specific files, and label it
"add QMan and BMan portal nodes on t1024"...

> diff --git a/arch/powerpc/boot/dts/fsl/t1024rdb.dts b/arch/powerpc/boot/dts/fsl/t1024rdb.dts
> index 302cdd2..73a6453 100644
> --- a/arch/powerpc/boot/dts/fsl/t1024rdb.dts
> +++ b/arch/powerpc/boot/dts/fsl/t1024rdb.dts
> @@ -41,6 +41,31 @@
>  	#size-cells = <2>;
>  	interrupt-parent = <&mpic>;
>  
> +	aliases {
> +		sg_2500_aqr105_phy4 = &sg_2500_aqr105_phy4;
> +	};

What does this have to do with the qman and bman portal nodes?  Why is
this alias needed?

-Scott
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
