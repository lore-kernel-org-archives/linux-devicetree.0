From: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v8] watchdog: ts4800: add driver for TS-4800 watchdog
Date: Wed, 23 Dec 2015 17:03:29 +0100
Message-ID: <20151223160329.GA434@spo001.leaseweb.nl>
References: <1449592648-22701-1-git-send-email-damien.riegel@savoirfairelinux.com> <20151223154359.GA6265@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151223154359.GA6265@localhost>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Damien Riegel <damien.riegel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, kernel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Damien,

> On Tue, Dec 08, 2015 at 11:37:28AM -0500, Damien Riegel wrote:
> > This watchdog is instantiated in a FPGA that is memory mapped. It is
> > made of only one register, called the feed register. Writing to this
> > register will re-arm the watchdog for a given time (and enable it if it
> > was disable). It can be disabled by writing a special value into it.
> > 
> > It is part of a syscon block, and the watchdog register offset in this
> > block varies from board to board. This offset is passed in the syscon
> > property after the phandle to the syscon node.
> > 
> > Signed-off-by: Damien Riegel <damien.riegel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
> > Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
> 
> Hi Guenter,
> 
> 
> You have reviewed this patch but not picked it up in your tree. Shall I
> expect Wim to pick it up directly for the next merge window? The board
> would be quite useless without its watchdog driver.
> 
> 
> Thanks,
> Damien

It's on my todo list for the next merge window.

Kind regards,
Wim.

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
