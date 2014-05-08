From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 4/6] powerpc/corenet: Create the dts components for the
 DPAA FMan
Date: Wed, 7 May 2014 22:36:31 -0500
Message-ID: <1399520191.15726.371.camel@snotra.buserror.net>
References: <1397823693-27977-1-git-send-email-Shruti@Freescale.com>
	 <1397823693-27977-4-git-send-email-Shruti@Freescale.com>
	 <1398118262.1694.188.camel__8135.6513932862$1398128944$gmane$org@snotra.buserror.net>
	 <5364BEB3.6000904@Freescale.com>
	 <1399332359.15726.154.camel@snotra.buserror.net>
	 <53687913.70900@Freescale.com>
	 <1399431248.15726.255.camel@snotra.buserror.net>
	 <536AF8C7.8080304@Freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <536AF8C7.8080304-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Emil Medve <Emilian.Medve-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
Cc: Shruti Kanetkar <Shruti-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2014-05-07 at 22:23 -0500, Emil Medve wrote:
> Hello Scott,
> 
> 
> At this point, I'm getting a bit lost in this thread and I feel we're
> getting into more generic comments. I'll continue to answer to some of
> your comments to make sure I understand them. However, one major comment
> I feel you made was about seeing a full FMan binding. If that's a deal
> breaker, please let me know and we'll just drop the patches

It's not an absolute deal breaker -- I did suggest the possibility of
providing the mdio node as an ordinary ccsr node, not underneath an fman
container.

I'm just frustrated that getting a proper fman node is such a big deal.
That should have been the first step of the upstreaming process -- not
something that waits until everything is finished.

-Scott


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
