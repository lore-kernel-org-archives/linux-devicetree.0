From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] ASoC: cs35l32: avoid uninitialized variable access
Date: Mon, 04 Jan 2016 16:17:47 +0100
Message-ID: <9222694.IRNnfpj6Tn@wuerfel>
References: <2884997.s8B8BuE04L@wuerfel> <20160102141746.GH16023@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160102141746.GH16023-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Brian Austin <brian.austin-jGc1dHjMKG3QT0dZR+AlfA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paul Handrigan <Paul.Handrigan-jGc1dHjMKG3QT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Saturday 02 January 2016 14:17:46 Mark Brown wrote:
> On Sat, Jan 02, 2016 at 12:19:52AM +0100, Arnd Bergmann wrote:
> 
> > -             if (i2c_client->dev.of_node) {
> > +             if (IS_ENABLED(CONFIG_OF) && i2c_client->dev.of_node) {
> 
> This would be a lot nicer if there was an __always_null annotation we
> could put on of_node for !OF configurations, that'd Just Work and this
> can't be the only case where we have this idiom.
> 

How about an inline helper like

static inline struct device_node *dev_of_node(struct device *dev)
{
	if (IS_ENABLED(CONFIG_OF))
		return dev->of_node;	
}

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
