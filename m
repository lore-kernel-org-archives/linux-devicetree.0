From: Harald Geyer <harald-95f8Dae0BrPYtjvyW6yDsg@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx23-olinuxino: Add i2c support
Date: Fri, 10 Apr 2015 19:37:15 +0200
Message-ID: <E1Ygcrj-00010H-H6@stardust.g4.wien.funkfeuer.at>
References: <1428515100-1496-1-git-send-email-harald@ccbib.org> <1158701263.68321.1428531175931.JavaMail.open-xchange@oxbaltgw03.schlund.de> <3f0efa88b69ea2e8eb22909b6fbe6f91@imap.cosmopool.net> <5526444A.3060805@i2se.com> <d8d27c22eb78aed693a977b88ebcc327@imap.cosmopool.net> <1893593729.135182.1428597263856.JavaMail.open-xchange@oxbaltgw02.schlund.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1893593729.135182.1428597263856.JavaMail.open-xchange-h4m1HHXQYNFuz1KIG1bTI8gmgJlYmuWJ@public.gmane.org>
Content-ID: <3859.1428687435.1-rvrRdOlaWMmli2aaYNgTVBW+3FKk/ZpWT2auq/jSWdo@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Fabio.Estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Stefan Wahren writes:
> > On Thu, 09 Apr 2015 11:20:10 +0200, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
> > wrote:
> >
> > > Btw i read that Shawn only want used muxes [1].
> > >
> > > [1] -
> > >
> > http://lists.infradead.org/pipermail/linux-arm-kernel/2012-August/115779.html
> >
> > If that is an issue, then I'll just test all three pin groups on my
> > olinuxino
> > board. After all it would be really awkward to have only one pin group and
> > that
> > one is labeled "i2c_pins_b" ...
> 
> from my understanding you are free about the labels. So you could
> rename it to "i2c_pins_a" and change the other pin groups.

Theoretically yes, but there are two reasons not to do that:
1) When Fadil Berisha chose the labels he didn't do so arbitrarily. The
   labels make sense the way the pinmux table is organised in the datasheet.
   (otherwise he sure would have chosen "i2c_pins_a" for the default pin
   group on olinuxino).
2) The labels are in use for about two years now by a lot of people. (Yes
   it really takes that long to have this merged.) I would hate to break
   their setups for no strong reason.

Harald
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
