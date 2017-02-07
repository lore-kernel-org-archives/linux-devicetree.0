From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH 4/4] drivers/mailbox: Add ASpeed mailbox driver
Date: Wed, 8 Feb 2017 09:29:58 +1030
Message-ID: <CACPK8XfxgUvvTYNxJTaUC3yAuiF=Wznr9e1AL_gc0P3SVUUAvg@mail.gmail.com>
References: <20170112002910.3650-1-cyrilbur@gmail.com> <20170112002910.3650-5-cyrilbur@gmail.com>
 <CACPK8XcsScjrit-7VHh4oL=zPiMeEAB5_R550U0uPsuQ4WF1mg@mail.gmail.com> <1486508229.3824.1.camel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1486508229.3824.1.camel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cyril Bur <cyrilbur-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, OpenBMC Maillist <openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Xo Wang <xow-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 8, 2017 at 9:27 AM, Cyril Bur <cyrilbur-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> > diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
>> > index ceff415f201c..10a7f3f2765c 100644
>> > --- a/drivers/mailbox/Kconfig
>> > +++ b/drivers/mailbox/Kconfig
>> > @@ -152,4 +152,13 @@ config BCM_PDC_MBOX
>> >           Mailbox implementation for the Broadcom PDC ring manager,
>> >           which provides access to various offload engines on Broadcom
>> >           SoCs. Say Y here if you want to use the Broadcom PDC.
>> > +
>> > +config ASPEED_MBOX
>>
>> Call this ASPEED_LPC_MAILBOX, as it's a in the LPC IP block.
>>
>
> I think I'll stick with ASPEED_LPC_MBOX, the rest of the file uses MBOX
> more widely when talking about controllers.

No worries. I just wanted the _LPC bit added.

Cheers,

Joel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
