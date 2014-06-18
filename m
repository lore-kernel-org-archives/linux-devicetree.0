From: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v3 3/4] edac: Add APM X-Gene SoC EDAC driver
Date: Thu, 19 Jun 2014 00:10:46 +0200
Message-ID: <20140618221046.GL24024@pd.tnic>
References: <1401761660-11515-1-git-send-email-lho@apm.com>
 <1401761660-11515-2-git-send-email-lho@apm.com>
 <1401761660-11515-3-git-send-email-lho@apm.com>
 <1401761660-11515-4-git-send-email-lho@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1401761660-11515-4-git-send-email-lho-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Cc: dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, patches-qTEPVZfXA3Y@public.gmane.org, Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 02, 2014 at 08:14:19PM -0600, Loc Ho wrote:
> This patch adds support for the APM X-Gene SoC EDAC driver and
> requires ARM64 EDAC support patch [1] to compile.
> 
> [1] http://www.spinics.net/lists/arm-kernel/msg324093.html
> 
> Signed-off-by: Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>
> Signed-off-by: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>

This is starting to look ok, I'd guess it needs to go after the atomic
scrub patch goes in, right?

Also, I'd need the device tree pieces acked by device tree maintainers
before I pick them up together with this driver.

Thanks.

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
