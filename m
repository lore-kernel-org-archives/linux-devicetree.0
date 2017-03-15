From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] regulator: fixed, gpio: dt: regulator-name is required
 property
Date: Wed, 15 Mar 2017 12:10:09 -0500
Message-ID: <20170315171009.4raoe35x4mdtsw4w@rob-hp-laptop>
References: <1488836249-1193-1-git-send-email-harald@ccbib.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1488836249-1193-1-git-send-email-harald-95f8Dae0BrPYtjvyW6yDsg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Harald Geyer <harald-95f8Dae0BrPYtjvyW6yDsg@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Mar 06, 2017 at 09:37:29PM +0000, Harald Geyer wrote:
> These two drivers fail to probe if no name is provided. For details see:
> https://www.spinics.net/lists/kernel/msg2457515.html
> 
> Signed-off-by: Harald Geyer <harald-95f8Dae0BrPYtjvyW6yDsg@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/regulator/fixed-regulator.txt | 1 +
>  Documentation/devicetree/bindings/regulator/gpio-regulator.txt  | 2 ++
>  2 files changed, 3 insertions(+)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
