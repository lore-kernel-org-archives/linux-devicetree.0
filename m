From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH_V3 0/2] mtd: nand: jz4780: Add nand and bch driver
Date: Fri, 24 Jul 2015 12:34:23 -0700
Message-ID: <20150724193423.GJ8876@google.com>
References: <1427821181-40843-1-git-send-email-Zubair.Kakakhel@imgtec.com>
 <20150331172030.GE19571@brian-ubuntu>
 <551BBA9F.1010809@imgtec.com>
 <CAFLxGvxsatxukr0ohuWsbm9cgPSkL_aod8527Ue02kY-ksPyqg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAFLxGvxsatxukr0ohuWsbm9cgPSkL_aod8527Ue02kY-ksPyqg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Weinberger <richard.weinberger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 03, 2015 at 11:02:05AM +0200, Richard Weinberger wrote:
> On Wed, Apr 1, 2015 at 11:30 AM, Zubair Lutfullah Kakakhel
> <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org> wrote:
> > NEMC is going via greg-kh. They went through greg's char-misc-testing and
> > just got applied here.
> >
> > https://git.kernel.org/cgit/linux/kernel/git/gregkh/char-misc.git/log/?h=char-misc-next
> >
> > Do you think that can work for compile testing? It is the upstream tree with nemc.
> >
> > I could point our github ones for the ci20 board.
> > But it has quite a bit of other code too for jz4780 support.
> 
> what's the state of this driver? It would be nice to see it upstream.

Status: doesn't build against mainline. Looks like a lot of 'jz47xx...'
names changed to 'jz4780...'. Please resubmit.

Thanks,
Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
