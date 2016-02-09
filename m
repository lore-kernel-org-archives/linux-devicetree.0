From: Amitkumar Karwar <akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: RE: [PATCH v3 3/3] mwifiex: parse host wakeup configuration from
 device tree
Date: Tue, 9 Feb 2016 13:46:32 +0000
Message-ID: <22cf216e43834751b9148f0bf86dfaf9@SC-EXCH04.marvell.com>
References: <1454926528-17480-1-git-send-email-akarwar@marvell.com>
 <1454926528-17480-3-git-send-email-akarwar@marvell.com>
 <2675319.xbIeWCdnho@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2675319.xbIeWCdnho@wuerfel>
Content-Language: en-US
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Nishant Sarmukadam <nishants-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, "wnhuang-F7+t8E8rja9Wk0Htik3J/w@public.gmane.org" <wnhuang-F7+t8E8rja9Wk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Xinming Hu <huxm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Arnd

> mwifiex_platform_driver = {
> >  	.driver = {
> >  		.name	= "mwifiex_plt",
> >  		.of_match_table = mwifiex_dt_match,
> > +#ifdef CONFIG_PM_SLEEP
> > +		.pm             = &mwifiex_plt_pm_ops,
> > +#endif
> >  	}
> >  };
> 
> Just remove the #ifdef here, and mark the functions as __maybe_unused.
> 

Sure. I will take care of this.

Regards,
Amitkumar Karwar
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
