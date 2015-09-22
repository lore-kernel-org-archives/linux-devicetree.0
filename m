From: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v4 1/4] edac: Export edac_debugfs
Date: Tue, 22 Sep 2015 18:34:05 +0200
Message-ID: <20150922163405.GC3437@pd.tnic>
References: <1439534769-22811-1-git-send-email-lho@apm.com>
 <1439534769-22811-2-git-send-email-lho@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1439534769-22811-2-git-send-email-lho-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Cc: dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, patches-qTEPVZfXA3Y@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 14, 2015 at 12:46:06AM -0600, Loc Ho wrote:
> This patch exports and expose the edac_debugfs file node. This allows
> EDAC driver to create debugfs node under the EDAC debugfs node.

...

> -#ifdef CONFIG_EDAC_DEBUG
> -static struct dentry *edac_debugfs;
> +struct dentry *edac_debugfs;
> +EXPORT_SYMBOL_GPL(edac_debugfs);

Hmm, so Arnd was right about this being the wrong direction we're
chasing. We should rather be exporting a bunch of EDAC debugfs wrappers
which EDAC drivers can call instead of exposing edac_debugfs itself.

And this is much better and the right(tm) approach IMO. So I went
and hacked it in, it builds on those !x86 targets (as far as my
cross-compilers are concerned, build succeeds :-)).

So here it is as a follow-up to this message.

-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
