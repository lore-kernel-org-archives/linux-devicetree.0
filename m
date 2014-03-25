From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/3] devicetree: bindings: add Zarlink to the vendor prefixes
Date: Tue, 25 Mar 2014 08:56:45 -0500
Message-ID: <CAL_JsqJScfzfaCiNWU5zqjvpebxk3geEnm2pPwvBq+m0mWR07w@mail.gmail.com>
References: <1395754915-14534-1-git-send-email-valentin.longchamp@keymile.com>
	<1395754915-14534-2-git-send-email-valentin.longchamp@keymile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1395754915-14534-2-git-send-email-valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Valentin Longchamp <valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>
Cc: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 25, 2014 at 8:41 AM, Valentin Longchamp
<valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org> wrote:
> Even though the company belongs to Microsemi, many chips are still
> labeled as Zarlink. Among them is the family of network clock generators,
> the zl3034x.
>
> Signed-off-by: Valentin Longchamp <valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>
> ---
> Changes in v3: None
> Changes in v2:
> - add a patch so that the Zarlink vendor prefix is defined
>
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 40ce2df..4a6eba0 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -95,3 +95,4 @@ winbond Winbond Electronics corp.
>  wlf    Wolfson Microelectronics
>  wm     Wondermedia Technologies, Inc.
>  xlnx   Xilinx
> +zarlink        Zarlink Semiconductor
> --
> 1.8.0.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
