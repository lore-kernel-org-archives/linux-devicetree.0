From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 6/8 v2] arm: orion5x: Add DT-based support for Netgear WNR854T
Date: Tue, 13 Sep 2016 21:16:28 +0200
Message-ID: <87r38nehkj.fsf@free-electrons.com>
References: <1472203264-21089-7-git-send-email-jm@lentin.co.uk>
        <1473109646-23366-1-git-send-email-jm@lentin.co.uk>
        <20160912170625.GA7420@rob-hp-laptop> <2920481.EgEQnLmOkM@wuerfel>
        <20160912220344.GM11400@lunn.ch>
        <88e40f0c6cafec244dc16af5a03cfb44@jamie.lentin.co.uk>
        <20160913123639.GB15332@lunn.ch>
        <b7d442f9d26249976d7698b6a32db2a3@jamie.lentin.co.uk>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b7d442f9d26249976d7698b6a32db2a3-SBYVURHw+sBNwP/n92qj9LVCufUGDwFn@public.gmane.org> (Jamie
        Lentin's message of "Tue, 13 Sep 2016 15:15:23 +0100")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Vivien Didelot <vivien.didelot-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Imre Kaloz <kaloz-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Jamie,
 
 On mar., sept. 13 2016, Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org> wrote:

> On 2016-09-13 13:36, Andrew Lunn wrote:
>> On Tue, Sep 13, 2016 at 10:10:41AM +0100, Jamie Lentin wrote:
>>> On 2016-09-12 23:03, Andrew Lunn wrote:
>>> >>Maybe we can instead leave out the PCI support from the new
>>> >>file for now and not delete the legacy board file?
>>>
>>> This seems a reasonable compromise. The PCI card the router comes
>>> with isn't supported by mwl8k mainline anyway (There's STA-only
>>> firmware that can be extracted from a windows driver and PCI IDs
>>> added, but stats reporting uses a different format), so it's not a
>>> huge loss, although many did replace the card with something
>>> Atheros-based.
>>
>> O.K. So dropping the PCI code gets us going forward.
>
> Is an arch/arm/mach-mvebu/orion5x.c also required? Or is continuing to
> use arch/arm/mach-orion5x/board-dt.c until everything has been
> converted the favoured approach?
>
>> Have we missed the merge window?
>
> I got the impression Gregory Clement had merged them? If not a good
> portion of this patchset is uncontroversial generic orion5x stuff,
> it'd be nice to get those in even if none of the router-specific stuff
> doesn't make it.

I applied on mvebu/for-next in order to find any merge conflict. It
seems ok on this side. However, I didn't make the pull request to
arm-soc with these patches so I fear it is too late.

Arnd would you agree to accept a new pull request?

Gregory


-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
