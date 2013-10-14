From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [Patch V5] drivers: power: Add support for bq24735 charger
Date: Mon, 14 Oct 2013 12:21:16 -0600
Message-ID: <525C361C.1020703@wwwdotorg.org>
References: <1381526143-20800-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381526143-20800-1-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Anton Vorontsov <anton-9xeibp6oKSgdnm+yROfE0A@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Darbha Sriharsha <dsriharsha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Manish Badarkha <badarkhe.manish-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/11/2013 03:15 PM, Rhyland Klein wrote:
> From: Darbha Sriharsha <dsriharsha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Adds support for the bq24735 charger chipset. The bq24735 is a
> high-efficiency, synchronous battery charger.
> 
> It allows control of the charging current, input current, and the charger
> voltage DAC's through SMBus.

Please CC the DT bindings maintainers on patches that add DT bindings.

> diff --git a/Documentation/devicetree/bindings/power_supply/ti,bq24735.txt b/Documentation/devicetree/bindings/power_supply/ti,bq24735.txt

> +Optional properties :

> + - ti,ac-detect-gpios : This GPIO is optionally used to read the AC adapter
> +   presence.

Is that actually a property of the BQ24735 chip itself (i.e. is it an
output signal from the chip), or part of the board/system?

Aside from that, the binding looks reasonable to me (although I'm no
longer a DT bindings maintainer).
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
