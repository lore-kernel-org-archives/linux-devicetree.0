From: Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: mtd: fsl-quadspi: Pass the qspi clock names
Date: Mon, 4 Dec 2017 13:59:46 +0100
Message-ID: <e41fd38e-1d41-8bc5-aee6-17473c7a0988@wedev4u.fr>
References: <1512340584-26894-1-git-send-email-festevam@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1512340584-26894-1-git-send-email-festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Le 03/12/2017 à 23:36, Fabio Estevam a écrit :
> From: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
> 
> In order to improve the bindings documentation, explicitly pass the name
> of the clocks: "qspi_en" and "qspi", which are mandatory.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>

Acked-by: Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>

> ---
>  Documentation/devicetree/bindings/mtd/fsl-quadspi.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt b/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
> index c34aa6f..cc3f579 100644
> --- a/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
> +++ b/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
> @@ -12,7 +12,7 @@ Required properties:
>    - reg-names: Should contain the reg names "QuadSPI" and "QuadSPI-memory"
>    - interrupts : Should contain the interrupt for the device
>    - clocks : The clocks needed by the QuadSPI controller
> -  - clock-names : the name of the clocks
> +  - clock-names : Should contain the name of the clocks: "qspi_en" and "qspi".
>  
>  Optional properties:
>    - fsl,qspi-has-second-chip: The controller has two buses, bus A and bus B.
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
