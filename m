From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/7] dt-bindings: timer: renesas,cmt: Fix SoC-specific
 compatible values
Date: Thu, 21 Sep 2017 18:10:20 -0500
Message-ID: <20170921231020.jehitdqvlpkxw6dp@rob-hp-laptop>
References: <1505742407-31576-1-git-send-email-geert+renesas@glider.be>
 <1505742407-31576-2-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1505742407-31576-2-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Cc: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Magnus Damm <damm+renesas-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Sep 18, 2017 at 03:46:41PM +0200, Geert Uytterhoeven wrote:
> While the new family-specific compatible values introduced by commit
> 6f54cc1adcc8957f ("devicetree: bindings: R-Car Gen2 CMT0 and CMT1
> bindings") use the recommended order "<vendor>,<family>-<device>", the
> new SoC-specific compatible values still use the old and deprecated
> order "<vendor>,<device>-<soc>".
> 
> Switch the SoC-specific compatible values to the recommended order while
> there are no upstream users of these compatible values yet.
> 
> Fixes: 7f03a0ecfdc786c1 ("devicetree: bindings: r8a73a4 and R-Car Gen2 CMT bindings")
> Fixes: 63d9e8ca0dd4bfa4 ("devicetree: bindings: Deprecate property, update example")
> Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
> ---
> v3:
>   - New.
> ---
>  .../devicetree/bindings/timer/renesas,cmt.txt      | 24 +++++++++++-----------
>  1 file changed, 12 insertions(+), 12 deletions(-)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
