From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] ARM64: dts: Mediatek: mt8173-evb: fix access MMC fail issue
Date: Mon, 22 Feb 2016 16:32:54 -0800
Message-ID: <7h37skw9jd.fsf@baylibre.com>
References: <1455861643-24307-1-git-send-email-eddie.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1455861643-24307-1-git-send-email-eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
	(Eddie Huang's message of "Fri, 19 Feb 2016 14:00:43 +0800")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Henry Chen <henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Chaotian Jing <chaotian.jing-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> writes:

> MT8173 E1 chip has one bug that if turn off USB power domain, vcore
> power will also be off, thus cause modules using vcore power domain
> fail, like MMC. The E1 chip only found on MT8173-evb board and this
> board only has E1 chip, so implement this as a board specific
> workaround.
>
> Pwrapper use vcore power, so add pwrapper using USB power domain to
> keep USB power domain not to zero and disabled.
>
> Signed-off-by: Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

Tested-by: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>

I verified that this gets my mt8173-evb booting again when I enable MMC
support.

Thanks,

Kevin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
