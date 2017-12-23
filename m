From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH] clk: rockchip: Switch dt-binding headers for rk3328 to GPL/X11
Date: Sat, 23 Dec 2017 17:58:46 +0100
Message-ID: <14437743.IJaZOmz2sC@phil>
References: <20171223152254.11617-1-manu@freebsd.org> <58250763.La9K9Nn0rI@phil> <20171223175345.2a8845d2d019a9e5b625c2b0@bidouilliste.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171223175345.2a8845d2d019a9e5b625c2b0-xXdDKFdH5B3kFDPD4ZthVA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Emmanuel Vadot <manu-xXdDKFdH5B3kFDPD4ZthVA@public.gmane.org>
Cc: Emmanuel Vadot <manu-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, kstewart-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Samstag, 23. Dezember 2017, 17:53:45 CET schrieb Emmanuel Vadot:
> On Sat, 23 Dec 2017 17:15:06 +0100
> Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> wrote:
> 
> > Hi Emmanuel,
> > 
> > Am Samstag, 23. Dezember 2017, 16:22:54 CET schrieb Emmanuel Vadot:
> > > Since those files are also needed kernel side, switch their licences
> > > to GPL/X11 so it can be used in BSD kernels.
> > > 
> > > Signed-off-by: Emmanuel Vadot <manu-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
> > 
> > definitly no objection from me (especially as the file only contains
> > constant definitions, so copyrightability might be debateable),
> > but could you:
> > 
> > (1) Adapt all rockchip clock headers in one patch, so we don't do this
> >     for each header invididually
> > (2) Do the same for the power/rk3* headers, but in a separate patch
> >     as this goes through a different tree
> 
>  Sure I can do that, will it be better to wait to have some kind of ack
> from someone from rockchip ?

I don't know if China is somehow affected by the xmas season, but from what
I see, right now you only included Elaine (zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org)
but for example not the relevant list (linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org).

But we also have some other points to clarify in the other subthread
started by Philippe, so it might be best to get the points he made sorted
before as well.


Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
