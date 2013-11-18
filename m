From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RFC PATCH V3 1/2] scripts: dtc: build fdtget for extracting
 properties from dtbs
Date: Mon, 18 Nov 2013 15:54:26 -0700
Message-ID: <528A9AA2.30303@wwwdotorg.org>
References: <1384201760-16785-1-git-send-email-jason@lakedaemon.net> <cover.1384809305.git.jason@lakedaemon.net> <55bef0830d336fc1df24e4cbf96822acc70c8f7e.1384809305.git.jason@lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55bef0830d336fc1df24e4cbf96822acc70c8f7e.1384809305.git.jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/18/2013 02:21 PM, Jason Cooper wrote:
> In order for 'make dtbs_install' to be maintainable, we need a reliable
> way to determine the board compatible string for a given dtb.  fdtget
> does that easily as written, but currently isn't built by the kernel.

> diff --git a/scripts/dtc/Makefile b/scripts/dtc/Makefile

> +include $(src)/libfdt/Makefile.libfdt
> +
> +fdtget-objs	:= fdtget.o util.o $(patsubst %, libfdt/%, $(LIBFDT_OBJS))

I observe that there's a scripts/dtc/Makefile.dtc that /isn't/ used by
scripts/dtc/Makefile. Hence, having scripts/dtc/Makefile use
scripts/dtc/libfdt/Makefile.libfdt seems slightly inconsistent. That
said, it's probably a good idea to use Makefile.libfdt, so perhaps the
answer here is to update Makefile to use Makefile.dtc sometime, rather
than not use Makefile.libfdt in this patch?

Otherwise, this patch seems to make sense.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
