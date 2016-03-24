From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: veyron: enable the tsadc on pinky board
Date: Thu, 24 Mar 2016 22:12:31 +0100
Message-ID: <2324215.uYLQVgh5FL@diego>
References: <1450607434-6733-1-git-send-email-wxt@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1450607434-6733-1-git-send-email-wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Caesar,

Am Sonntag, 20. Dezember 2015, 18:30:34 schrieb Caesar Wang:
> I think the tsadc is fakly hand on pinky board,
> maybe that's fixed in newest kernel.
> As the following patch is a example:
> https://patchwork.kernel.org/patch/7472051/
> 
> I don't have meet this issue on pinky board.
> Let me know if that's still hanging on pinky board.
> 
> Signed-off-by: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

I just gave that a try again on my pinky-rev2. And while the tsadc did produce 
some results and didn't hang the system in my tries, the temperature values 
seemed to be frozen (only changing once on every reboot).

Running the same kernel on a Jerry produced the expected results of the 
temperature changing over time and differing cpu frequencies.

Pinky also is a sort of dinosaur and only you and me seem to still like them 
:-) . And something is definitly strange here, and I'd tend to keep the tsadc 
disabled for the time being. 


Heiko

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
