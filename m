From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of: fix the error message handling
Date: Fri, 2 Dec 2016 15:44:35 -0600
Message-ID: <CAL_Jsq+vWN19D3SDwBU-t22KC_2N1P1BWsbKb7AraGnULajBVQ@mail.gmail.com>
References: <20161202145003.18965-1-gary.bisson@boundarydevices.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161202145003.18965-1-gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 2, 2016 at 8:50 AM, Gary Bisson
<gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org> wrote:
> The previous patch to add back an error message didn't take the
> successful case into account. This results in the following trace
> showing when a symbol is properly resolved:
> OF: resolver: overlay phandle fixup failed: 0
>
> So remove the 'err_out' label and test 'err' value in the 'out' label
> before printing the error message.
>
> Signed-off-by: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
> ---
> Hi all,
>
> While experimenting with dt-overlays on linux-next I've realized that
> a new trace was showing up:
> OF: resolver: overlay phandle fixup failed: 0
>
> This patch should fix it in a simple way.

Thanks Gary. There's already the same fix posted that I plan to apply.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
