From: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
Subject: Re: [PATCH v3 01/18] clk: ingenic: Use const pointer to clk_ops in
 struct
Date: Thu, 13 Jul 2017 13:49:16 +0200
Message-ID: <20170713114916.GA17495@linux-mips.org>
References: <20170607200439.24450-2-paul@crapouillou.net>
 <20170702163016.6714-1-paul@crapouillou.net>
 <20170702163016.6714-2-paul@crapouillou.net>
 <20170712232037.GR22780@codeaurora.org>
 <ca4da3fa3067a7301f8fc1539e9e4362@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <ca4da3fa3067a7301f8fc1539e9e4362-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
Cc: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Maarten ter Huurne <maarten-Ph2Y2OKCxY1M656bX5wj8A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jul 13, 2017 at 12:07:25PM +0200, Paul Cercueil wrote:

> > Sorry I forgot, did you want an ack for these clk patches or for
> > me to take them through clk tree. If it's the ack case,
> > 
> > Acked-by: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> > 
> > for patches 1 through 6.
> 
> I think ACK; then Ralf can take them in 4.13 :)

My pull request for 4.13 is already finalized so it'd be great if this
could make it to 4.13 through the clk tree.  If that should be impossible
I'd like to merge this via the MIPS tree for 4.14.

Thanks,

  Ralf
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
