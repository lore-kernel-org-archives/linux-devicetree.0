From: Aaron Sierra <asierra-AQeFf1F/bRxBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 2/2 v3 RESEND] mtd: fsl_upm: Support NAND ECC DTS
 properties
Date: Thu, 29 Jan 2015 10:40:53 -0600 (CST)
Message-ID: <8497653.67473.1422549653131.JavaMail.zimbra@xes-inc.com>
References: <1136776275.110939.1421109367310.JavaMail.zimbra@xes-inc.com> <447095612.147126.1421278909058.JavaMail.zimbra@xes-inc.com> <20150123083026.GE3268@brian-ubuntu> <1309767342.94086.1422491856685.JavaMail.zimbra@xes-inc.com> <20150129012042.GX9759@ld-irv-0074>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150129012042.GX9759@ld-irv-0074>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

----- Original Message -----
> From: "Brian Norris" <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Sent: Wednesday, January 28, 2015 7:20:42 PM
> 
> On Wed, Jan 28, 2015 at 06:37:36PM -0600, Aaron Sierra wrote:
> > ----- Original Message -----
> > > From: "Brian Norris" <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> > > I was thinking about this a bit more, and it seems like we could really
> > > just factor this all into the core nand_base code with something like
> > > the following patch. It could possibly use some smarter logic to rule
> > > out certain combinations (but some of those are already caught in
> > > nand_scan_tail() anyway). What do you think?
> > 
> > Brian,
> > If the NAND device tree property fetching were moved out of fsl_upm,
> > I think it should not be called within nand_scan(). I think that
> > it's imperative that each driver be able to access these properties
> > before handing off to nand_scan(), since there are hardware ECC
> > modes that only drivers will know how to error check.
> 
> That's why nand_scan() is broken into nand_scan_ident() and
> nand_scan_tail() functions which can be called individually. This allows
> drivers to do the up-front initialization in nand_scan_ident(), do their
> own error checking and handling of these parameters, and then call
> nand_scan_tail(). See, for example, drivers/mtd/nand/omap2.c.

Thanks for pointing that out; I'll take a look.
 
> > Also, catching errors in nand_scan_tail() tends to result in BUG()s.
> 
> Well, some of those can be changed. Feel free to propose changes. I'd
> prefer to make nand_scan_tail() play nicer than to compensate in
> individual drivers.
> 
> > That said, this could be useful as a publicly exported function that
> > individual drivers are responsible for calling (maybe in of_mtd.c).
> 
> I don't think of_mtd.c should really contain a lot of mtd_info /
> nand_chip knowledge, if we can avoid it.
>
> I really do think that the nand_scan() option is a better idea, if we
> can work out the other details (BUG(), error checking, and keeping it
> flexible enough). I think it provides the best place to flesh out any
> other common DT handling for all NAND drivers.
> 
> Related: I believe the question came up recently about how to support a
> generic DT binding for using a GPIO as a NAND write-protect line. This
> would be another candidate for handling transparently in
> nand_scan_ident() and would then immediately apply to all NAND drivers,
> not just those that were rewritten to call another specialized init
> function.
> 
> I really don't want to encourage the anti-pattern of each driver
> reimplementing code that might as well be shared, if at all possible.
> Adding more decentralized helpers to of_mtd.c does not really help that
> cause.

Understood.

[ snipped function prototype discussion ]

> > You hinted at implementing stronger error checking. If we went
> > this route, would it make sense to only error check the software
> > ECC modes?
> 
> Yes. I just elided some of the details for now, since it's not actually
> necessary to do some of it (many other drivers can use SW ECC without
> the extra error checks).

OK, I'll rework the fsl_upm patch to work with your proposed patch.

-Aaron
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
