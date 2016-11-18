From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 1/3] ipmi/bt-bmc: change compatible node to
 'aspeed,ast2400-ibt-bmc'
Date: Thu, 17 Nov 2016 16:33:00 -0800
Message-ID: <20161118003300.GA8578@localhost>
References: <1478073426-3714-1-git-send-email-clg@kaod.org>
 <a886778e-a85e-758e-3a61-c4909652e39d@kaod.org>
 <c749ff0a-bc71-bc9f-0e8c-326db2cea0fb@acm.org>
 <2278270.0oJqDfoDd9@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2278270.0oJqDfoDd9@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: minyard-HInyCGIudOg@public.gmane.org, C?dric Le Goater <clg-Bxea+6Xhats@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, openipmi-developer-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, arm <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 09, 2016 at 05:09:12PM +0100, Arnd Bergmann wrote:
> On Tuesday, November 8, 2016 12:15:57 PM CET Corey Minyard wrote:
> > On 11/08/2016 09:52 AM, C?dric Le Goater wrote:
> > > O
> > snip
> > 
> > >>>> While we're modifying the binding, should we add a compat string for
> > >>>> the ast2500?
> > >>> Well, if the change in this patch is fine for all, may be we can add
> > >>> the ast2500 compat string in a followup patch ?
> > >> Sounds good to me.
> > > OK. So, how do we proceed with this patch ? Who would include it in its
> > > tree ?
> > 
> > I don't have anything for 4.9 at the moment.  Arnd, if you have 
> > something, can
> > you take this?  Otherwise I will.
> > 
> > And I guess I should add:
> > 
> > Acked-by: Corey Minyard <cminyard-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>
> 
> Thanks, I've added it to my todo folder.
> 
> Olof, if you do fixes before I do, please pick up this patch with
> Corey's Ack.

Done, applied to fixes.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
