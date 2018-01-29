From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v6 2/2] media: V3s: Add support for Allwinner CSI.
Date: Mon, 29 Jan 2018 15:34:02 +0100
Message-ID: <CAK8P3a2HmPOTHAzqBnmim388pcWOE=fG50mG5HJifT=vzKOaTg@mail.gmail.com>
References: <1516695531-23349-1-git-send-email-yong.deng@magewell.com>
 <CACRpkdan52UB7HOyH1gnHWg4CDke_VQxAdq8cBgwUroibE59Ow@mail.gmail.com>
 <20180129082533.6edmqgbauo6q5dgz@flea.lan> <CACRpkdYAGwUjr2C-w5U+WuG48pZAOUcnxFjznLbdF6Lmy1uZuQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdYAGwUjr2C-w5U+WuG48pZAOUcnxFjznLbdF6Lmy1uZuQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Yong Deng <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Stanimir Varbanov <stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Rick Chang <rick.chang@mediatek>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 29, 2018 at 10:25 AM, Linus Walleij
<linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Mon, Jan 29, 2018 at 9:25 AM, Maxime Ripard
> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
>> On Sat, Jan 27, 2018 at 05:14:26PM +0100, Linus Walleij wrote:
>> However, in DT systems, that
>> field is filled only with the parent's node dma-ranges property. In
>> our case, and since the DT parenthood is based on the "control" bus,
>> and not the "data" bus, our parent node would be the AXI bus, and not
>> the memory bus that enforce those constraints.
>>
>> And other devices doing DMA through regular DMA accesses won't have
>> that mapping, so we definitely shouldn't enforce it for all the
>> devices there, but only the one connected to the separate memory bus.
>>
>> tl; dr: the DT is not really an option to store that info.
>>
>> I suggested setting dma_pfn_offset at probe, but Arnd didn't seem too
>> fond of that approach either at the time.
>>
>> So, well, I guess we could do better. We just have no idea how :)
>
> Usually of Arnd cannot suggest something smart, neither can I :(
>
> If some aspect of the memory layout of the system *really* doesn't
> fit into DT because of the assumptions that DT is doing about
> how systems work, we have a problem.
>
> Is the problem that DT's model assumes that devices have one and
> only one data port to the system memory, and that is how it
> populates the Linux devices?
>
> I guess, if nothing else works, I would use auxdata in the board file.
> It is our definitive last resort when DT doesn't hold.
>
> I.e. I would go into struct of_dev_auxdata
> (from <linux/of_platform.h>) and add a
> dma_pfn_offset field that gets set into the device's dma_pfn_offset
> in drivers/of/platform.c overriding anything else and use that to hammer
> it down in the boardfile.
>
> But I bet some DT people are going to have other ideas.

At one point we had discussed adding a 'dma-masters' property that
lists all the buses on which a device can be a dma master, and
the respective properties of those masters (iommu, coherency,
offset, ...).

IIRC at the time we decided that we could live without that complexity,
but perhaps we cannot.

Another local hack that we can do here is to have two separate
device nodes and let the device driver bind to one device and then
look up the other one through a phandle to look up a platform_device
for it, which it can then use with the DMA mapping interface.

      Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
