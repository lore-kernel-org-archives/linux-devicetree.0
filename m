From: Harald Geyer <harald-95f8Dae0BrPYtjvyW6yDsg@public.gmane.org>
Subject: Re: [PATCH] regulator: fixed, gpio: dt: regulator-name is required property
Date: Fri, 23 Jun 2017 15:55:09 +0200
Message-ID: <E1dOP3F-0000NF-Pe@stardust.g4.wien.funkfeuer.at>
References: <1488836249-1193-1-git-send-email-harald@ccbib.org> <20170315171009.4raoe35x4mdtsw4w@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20170315171009.4raoe35x4mdtsw4w@rob-hp-laptop>
Content-ID: <1439.1498226108.1-rvrRdOlaWMmli2aaYNgTVBW+3FKk/ZpWT2auq/jSWdo@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Mark,

what happened to this patch? Since it was written to your specification
and got an ack from a devicetree maintainer more then 3 months ago,
I don't see what is holding it back. I can't find it in any tree.

TIA,
Harald

Rob Herring writes:
> On Mon, Mar 06, 2017 at 09:37:29PM +0000, Harald Geyer wrote:
> > These two drivers fail to probe if no name is provided. For details see:
> > https://www.spinics.net/lists/kernel/msg2457515.html
> > 
> > Signed-off-by: Harald Geyer <harald-95f8Dae0BrPYtjvyW6yDsg@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/regulator/fixed-regulator.txt | 1 +
> >  Documentation/devicetree/bindings/regulator/gpio-regulator.txt  | 2 ++
> >  2 files changed, 3 insertions(+)
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
