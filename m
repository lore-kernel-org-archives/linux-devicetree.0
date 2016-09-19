From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH v4 0/7] ARM: dts: bcm283x: add and use pinctrl groups
Date: Mon, 19 Sep 2016 13:00:51 +0200
Message-ID: <c7b43dbc-7bfc-0aa6-b451-4ef9a11e456e@i2se.com>
References: <1474274603-24215-1-git-send-email-kraxel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1474274603-24215-1-git-send-email-kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am 19.09.2016 um 10:43 schrieb Gerd Hoffmann:
>   Hi,
>
> New in v4:  Patch #6 has been splitted into two:  Patch 6 just moves
> pinctrl from &gpio to &sdhci.  Removing the empty now alt3 group
> -- including all references as pointed out by Stefan Wahren in review --
> is done by the new patch 7.  Patches 1-5 are unchanged.

Acked-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>

for the whole series.

Thanks
Stefan

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
