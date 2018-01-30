From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v6 2/2] media: V3s: Add support for
 Allwinner CSI.
Date: Tue, 30 Jan 2018 10:24:48 +0100
Message-ID: <CAK8P3a0QxQE=GM=SGPtT82=UreiqsgY6uMThvQ_woA3rjK0zjA@mail.gmail.com>
References: <1516695531-23349-1-git-send-email-yong.deng@magewell.com>
 <CACRpkdan52UB7HOyH1gnHWg4CDke_VQxAdq8cBgwUroibE59Ow@mail.gmail.com>
 <20180129082533.6edmqgbauo6q5dgz@flea.lan> <CACRpkdYAGwUjr2C-w5U+WuG48pZAOUcnxFjznLbdF6Lmy1uZuQ@mail.gmail.com>
 <CAK8P3a2HmPOTHAzqBnmim388pcWOE=fG50mG5HJifT=vzKOaTg@mail.gmail.com> <20180130075441.rqxzkwero6sdfak6@flea.lan>
Reply-To: arnd-r2nGTMty4D4@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDEKVJM7XAHRBYXTYDJQKGQEQDSQ7VQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: arndbergmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
In-Reply-To: <20180130075441.rqxzkwero6sdfak6-ZC1Zs529Oq4@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Yong Deng <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Stanimir Varbanov <stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Rick Chang <rick.chang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
List-Id: devicetree@vger.kernel.org

On Tue, Jan 30, 2018 at 8:54 AM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> On Mon, Jan 29, 2018 at 03:34:02PM +0100, Arnd Bergmann wrote:
>> On Mon, Jan 29, 2018 at 10:25 AM, Linus Walleij
>> <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> > On Mon, Jan 29, 2018 at 9:25 AM, Maxime Ripard
>> > <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
>> >> On Sat, Jan 27, 2018 at 05:14:26PM +0100, Linus Walleij wrote:

>>
>> At one point we had discussed adding a 'dma-masters' property that
>> lists all the buses on which a device can be a dma master, and
>> the respective properties of those masters (iommu, coherency,
>> offset, ...).
>>
>> IIRC at the time we decided that we could live without that complexity,
>> but perhaps we cannot.
>
> Are you talking about this ?
> https://elixir.free-electrons.com/linux/latest/source/Documentation/devicetree/bindings/dma/dma.txt#L41
>
> It doesn't seem to be related to that issue to me. And in our
> particular cases, all the devices are DMA masters, the RAM is just
> mapped to another address.

No, that's not the one I was thinking of. The idea at the time was much
more generic, and not limited to dma engines. I don't recall the details,
but I think that Thierry was either involved or made the proposal at the
time.

       Arnd
