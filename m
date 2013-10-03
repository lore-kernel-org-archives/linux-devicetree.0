From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] arm: Fix conversion to early_init_dt_scan() for non-DT platforms
Date: Thu, 3 Oct 2013 09:39:45 -0700
Message-ID: <CAOesGMgJS7Ou1Y6i9O+_A-+dkHCXGaX_eDMw5zrEDi-40V0pew@mail.gmail.com>
References: <1380804633-14130-1-git-send-email-broonie@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1380804633-14130-1-git-send-email-broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 3, 2013 at 5:50 AM, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> From: Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>
> Commit 67a964490bfd14 (arm: use early_init_dt_scan) in the OF tree in
> -next converts ARM to use early_init_dt_scan(), factoring out some common
> code. However it ignores the return value of the function meaning that on
> non-DT platforms the kernel fails to boot as it attempts to configure
> itself using DT.
>
> Fix this by adding the appropriate return value check.
>
> Signed-off-by: Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Hm, I thought I had reported this to Rob and he had fixed it already.
Is a stale version of the patches in the DT tree?


-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
