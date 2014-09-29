From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 6/6] Documentation: Add entry for Spreadtrum's Shark64 SoC
Date: Mon, 29 Sep 2014 15:30:34 +0200
Message-ID: <7195852.7nSHtIu8oc@wuerfel>
References: <1411992293-7729-1-git-send-email-zhang.lyra@gmail.com> <1411992293-7729-7-git-send-email-zhang.lyra@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1411992293-7729-7-git-send-email-zhang.lyra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: zhang.lyra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, jslaby-AlSwsSmVLrQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, m-karicheri2-l0cyMroinI0@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, artagnon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rrichter-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, orsonzhai-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, geng.ren-lxIno14LUO0EEoCn2XhGlw@public.gmane.org, zhizhou.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Monday 29 September 2014 20:04:53 zhang.lyra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> diff --git a/Documentation/devicetree/bindings/arm/sprd.txt b/Documentation/devicetree/bindings/arm/sprd.txt
> new file mode 100644
> index 0000000..b6dc143
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/sprd.txt
> @@ -0,0 +1,6 @@
> +Spreadtrum Platforms Device Tree Bindings
> +----------------------------------------------------
> +
> +Shark64 Board
> +Required root node properties:
> +        - compatible = "sprd,shark64";
> 

Is Shark a board or an SOC? The subject line of the patch and the contents
seem to disagree here.

It's generally better to have the exact SoC product numbers in here, e.g.
"sprd,sc1234", in case we have to apply fixups based on the SoC. You should
also have a board specific string in addition to the SoC-specific one.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
