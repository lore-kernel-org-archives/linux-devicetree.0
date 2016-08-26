From: "Imre Kaloz" <kaloz-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH 0/8] Convert Netgear WNR854T to devicetree
Date: Fri, 26 Aug 2016 22:30:47 +0200
Message-ID: <op.ymtkllii2s3iss@ecaz>
References: <1468679348-10522-1-git-send-email-jm@lentin.co.uk>
 <1472203264-21089-1-git-send-email-jm@lentin.co.uk> <op.ymsxegsy2s3iss@ecaz>
 <alpine.DEB.2.11.1608261325310.19980@marmot.wormnet.eu>
 <20160826143358.GI25046@lunn.ch>
 <alpine.DEB.2.11.1608261703460.19980@marmot.wormnet.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.11.1608261703460.19980-5X291BYdrx55rAo4AelP/Ydd74u8MsAO@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Vivien Didelot <vivien.didelot-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 26 Aug 2016 18:50:33 +0200, Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org> wrote:

> On Fri, 26 Aug 2016, Andrew Lunn wrote:
>
>>>> - the factory layout gives you almost no space to play with
>>
>> Given that the kernel has grown in size over the years, does the
>> mainline kernel fit in the factory layout?
>
> The factory layout has a 6MB JFFS2 for root & uImage (uboot mounts it by  
> default) + 1MB miscellany. So the main restriction on kernel size is the  
> size of your userland.
>
> The non-DT mainline layout is 1MB JFFS2 for uImage + 7MB rootfs. Which  
> is a closer approximation to other devices with a uImage in it's own  
> partition.
>
>>> Of course, one could also argue I'm breaking backwards compatibility
>>> at this point by changing it, so maybe I should put it back.
>>
>> I don't mind breaking backwards compatibility, if the factory defaults
>> no longer actually work.....
>>
>> Also, lets think about the users here. This is a very old box. Anybody
>> playing with one are probably of the sort who tinker with a classic
>> car in the garage, taking the engine apart and putting it back
>> together again. I doubt there are users of this box who take their car
>> in for a service once they are out of windscreen washing water.
>
> My line of thinking was that the only people that will see this default  
> partition scheme are people that have just compiled a mainline kernel  
> and booted it to see what happens. At which point you probably still  
> have the Netgear image in Flash. If you had OpenWRT in Flash then in all  
> likelihood you'd already be using an OpenWRT kernel too, with it's own  
> flash layout. Finally, you could have rolled your own userland and put  
> that on Flash, but by then you should know enough to do what you like :)

Well, that means you have serial console - otherwise without userland it's  
pretty unusable ;) Anyways, I would stay with a modified version of the  
non-DT partitions, with the kernel size increased to ~1.4MB (didn't check  
how much overhead is DT support).


Imre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
