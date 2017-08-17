From: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 0/5] Add clk and scpsys support for MT6755
Date: Thu, 17 Aug 2017 10:47:59 +0800
Message-ID: <1502938079.4027.3.camel@mtksdaap41>
References: <1502180014-7995-1-git-send-email-mars.cheng@mediatek.com>
         <1502855993.4599.1.camel@mtkswgap22>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1502855993.4599.1.camel@mtkswgap22>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, cc.hwang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, wsd_upstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, wendell.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org



On Wed, 2017-08-16 at 11:59 +0800, Mars Cheng wrote:
> Hi Rob, Stephen, Matthias
> 
> gentle ping.
> 
> Thanks.
> 
> On Tue, 2017-08-08 at 16:13 +0800, Mars Cheng wrote:
> > Mars Cheng (3):
> >   clk: mediatek: add mt6755 clock ID
> >   clk: mediatek: add clk support for MT6755
> >   soc: mediatek: add MT6755 scpsys support

Hi Mars,

Sean reworked the scpsys driver to remove code duplication, see:
http://lists.infradead.org/pipermail/linux-mediatek/2017-August/009687.html
http://lists.infradead.org/pipermail/linux-mediatek/2017-August/009820.html

I think current driver will have conflict and can't merge as-is, you'll
need to rebase to Matthias' for-next branch.

Joe.C


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
