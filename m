From: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH] arch: arm: common: edma.c:  Remove some unused functions
Date: Mon, 29 Dec 2014 09:53:12 +0200
Message-ID: <54A10868.70001@ti.com>
References: <1417906406-5527-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417906406-5527-1-git-send-email-rickard_strandqvist-IW2WV5XWFqGZkjO+N0TKoMugMpMbD5Xr@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rickard Strandqvist <rickard_strandqvist-IW2WV5XWFqGZkjO+N0TKoMugMpMbD5Xr@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 12/07/2014 12:53 AM, Rickard Strandqvist wrote:
> Removes some functions that are not used anywhere:
> edma_shadow0_read() edma_or_array()
>=20
> This was partially found by using a static code analysis program call=
ed cppcheck.

Acked-by: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>

>=20
> Signed-off-by: Rickard Strandqvist <rickard_strandqvist@spectrumdigit=
al.se>
> ---
>  arch/arm/common/edma.c |    8 --------
>  1 file changed, 8 deletions(-)
>=20
> diff --git a/arch/arm/common/edma.c b/arch/arm/common/edma.c
> index d86771a..163273d 100644
> --- a/arch/arm/common/edma.c
> +++ b/arch/arm/common/edma.c
> @@ -160,10 +160,6 @@ static inline void edma_modify_array(unsigned ct=
lr, int offset, int i,
>  {
>  	edma_modify(ctlr, offset + (i << 2), and, or);
>  }
> -static inline void edma_or_array(unsigned ctlr, int offset, int i, u=
nsigned or)
> -{
> -	edma_or(ctlr, offset + (i << 2), or);
> -}
>  static inline void edma_or_array2(unsigned ctlr, int offset, int i, =
int j,
>  		unsigned or)
>  {
> @@ -174,10 +170,6 @@ static inline void edma_write_array2(unsigned ct=
lr, int offset, int i, int j,
>  {
>  	edma_write(ctlr, offset + ((i*2 + j) << 2), val);
>  }
> -static inline unsigned int edma_shadow0_read(unsigned ctlr, int offs=
et)
> -{
> -	return edma_read(ctlr, EDMA_SHADOW0 + offset);
> -}
>  static inline unsigned int edma_shadow0_read_array(unsigned ctlr, in=
t offset,
>  		int i)
>  {
>=20


--=20
P=E9ter
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
