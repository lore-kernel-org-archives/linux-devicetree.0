From: Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 0/5] Add clk and scpsys support for MT6755
Date: Sat, 19 Aug 2017 16:17:20 +0800
Message-ID: <1503130640.8938.1.camel@mtkswgap22>
References: <1502180014-7995-1-git-send-email-mars.cheng@mediatek.com>
         <1502855993.4599.1.camel@mtkswgap22> <1502938079.4027.3.camel@mtksdaap41>
         <341316e9-d7ce-85f1-4e54-f872771f530f@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <341316e9-d7ce-85f1-4e54-f872771f530f-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, cc.hwang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, wsd_upstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, wendell.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Matthias, Yingjoe

On Thu, 2017-08-17 at 12:19 +0200, Matthias Brugger wrote:
> 
...
> > Hi Mars,
> > 
> > Sean reworked the scpsys driver to remove code duplication, see:
> > http://lists.infradead.org/pipermail/linux-mediatek/2017-August/009687.html
> > http://lists.infradead.org/pipermail/linux-mediatek/2017-August/009820.html
> > 
> > I think current driver will have conflict and can't merge as-is, you'll
> > need to rebase to Matthias' for-next branch.
> > 
> 
> Yes, please rebase, which should be trivial. Other then that the scpsys driver 
> looks good.
> 

Thanks for your review. I will rebase it and send the patch again soon.

Regards,
Mars

> Regards,
> Matthias


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
