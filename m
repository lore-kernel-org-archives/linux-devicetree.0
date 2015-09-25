From: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 4/6] extcon: arizona: Add device binding for second
 jack detect pin on GPIO5
Date: Fri, 25 Sep 2015 10:10:42 +0100
Message-ID: <20150925091042.GD5432@ck-lbox>
References: <1442397404-7579-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1442397404-7579-5-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <56049B42.7030509@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56049B42.7030509-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 25, 2015 at 09:54:26AM +0900, Chanwoo Choi wrote:
> Hi Charles,
> 
> I have one comment.
> I think current extcon-arizona.c has the many platform data
> so, extcon-arizona.c use the too much if statement to support each feature
> for different wolfsonmicro codec. I think it cause the complicated code.
> 
> For example,
> You may use 'struct of_device_id' as following. You used already this method
> on drivers/mfd/arizona-core.c. If you separate the function of each wmXXXX arizona,
> it makes improved readability for extcon-arizona.c and some user will use extcon-arizora
> more easily.
> 
> struct arizona_extcon_data {
> 	void (*init)(...);
> 	void (*irq_handler)(...);
> 	...	
> };
> 
> struct arizona_extcon_data wm8994_data {
> 	.init = wm8994_extcon_init,
> 	.irq_handler = wm8994_extcon_irq_handler;
> 	...
> };
> 
> static const struct of_device_id arizona_extcon_dt_match[] = {
> 	{
> 		.compatible = "wm8994-arizona-extcon",
> 		.data = (void *)wm8994_data;
> 	}, {
> 		.compatible = "wmXXXX-arizona-extcon",
> 		.data = (void *)wmXXXX_data;
> 	}, 
> };
> 
> I expect that you will revise the arizona-extcon.c driver on next time.

I will have an investigation to see what ideas I can come up with
here and send through some patches.

But I am slightly worried you think the gains will be better than
they actually will be. Most of the platform data is just that
platform data, and needs to be configured based on the system not
based on the CODEC.

Thanks,
Charles
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
