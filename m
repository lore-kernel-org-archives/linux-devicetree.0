From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] dts: ls1021a: Add dts nodes for eTSEC0, eTSEC1 and eTSEC2
Date: Tue, 14 Jul 2015 12:57:21 -0300
Message-ID: <CAOMZO5A2ftfUhioXpSnbGMxiV-fTePgHqk6zj2ysHe2wUY7JFg@mail.gmail.com>
References: <20150713133138.GO23464@tiger>
	<1436888777-29742-1-git-send-email-claudiu.manoil@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1436888777-29742-1-git-send-email-claudiu.manoil-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Claudiu Manoil <claudiu.manoil-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alison Wang <alison.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 14, 2015 at 12:46 PM, Claudiu Manoil
<claudiu.manoil-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> This patch adds generic dts nodes for eTSEC0, eTSEC1 and eTSEC2.
>
> Signed-off-by: Alison Wang <alison.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>
> Enable support for the second interrupt group register block
> and the corresponding Rx/Tx/Err interrupt sources, for each
> eTSEC node.  DT binding documentation updates.
>
> Signed-off-by: Claudiu Manoil <claudiu.manoil-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

It seems you missed to put Alison in the From field.

You should also put his Signed-off-by tag just before yours.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
