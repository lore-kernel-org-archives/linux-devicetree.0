From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 00/15] musb: Add support for the Allwinner
 sunxi musb controller
Date: Tue, 10 Mar 2015 09:46:24 +0800
Message-ID: <CAGb2v67GkL9Mdr98Chf6MhMff7CO8OGgfF2kaB3Xcnz=SkMG3w@mail.gmail.com>
References: <1425933628-9672-1-git-send-email-hdegoede@redhat.com> <2227491.z0aBeXi5ZG@wuerfel>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBCE27GTQKGQEJVVFT4Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <2227491.z0aBeXi5ZG@wuerfel>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Arnd,

On Tue, Mar 10, 2015 at 5:44 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Monday 09 March 2015 21:40:13 Hans de Goede wrote:
>> Hi All,
>>
>> This patch set has been a while in the making, so I'm very happy to present
>> the end result here, and I hope everyone likes it.
>
> Awesome work!
>
>> Before talking about merging this there are 2 things which I would like to
>> point out:
>>
>> a) The musb controller in the sunxi SoCs uses some SRAM which needs to be
>> mapped to the musb controller by poking some bits in the SRAM controller,
>> just like the EMAC patches which were send a while back I've chosen to use
>> syscon for this, actually 2 of the patches in this set come directly from the
>> SRAM mapping patchset for the EMAC.
>>
>> I know that Maxime is not 100% in favor of using syscon:
>> http://lists.infradead.org/pipermail/linux-arm-kernel/2015-January/320221.html
>>
>> But I disagree with his arguments for writing a special driver for the SRAM
>> controller:
>> 1) syscon was specifically designed for global system control registers like
>> this and is fine to use as long as there are no conflicts where 1 bit is of
>> interest to multiple drivers, and there is no such conflict here
>> 2) Maxime's other arguments seem to boil down to it would be nice / prettier
>> to have a specific driver for this, without really proving a hard need for
>> such a driver. But writing such a driver is going to be a lot of work, and
>> we've a ton of other work to do, and as said there is no real need for a
>> separate driver, syscon works fine for this.
>> 3) I actually believe that having a specific driver for this is a bad idea,
>> because that means inventing a whole new cross driver API for this, and
>> getting those right is, hard, a lot of work, and even then one is still likely
>> to get it wrong. We can avoid all this by going with the proven syscon solution.
>>
>> Maxime, can we please have your ack for moving forward with this using syscon?
>> (see above for my arguments why)
>
> I'd like to understand here why we can't use the existing SRAM DT binding
> instead of the syscon binding.

I believe you are talking about "mmio-sram"?

The syscon here represents a switch, to toggle whether a block of SRAM is
mapped into the CPU memory space, or to a specific devices private address
space. It is not the actual SRAM.

The SRAM DT binding is orthogonal to this, if not irrelevant when the block
is mapped privately, as it is no longer visible from the DT's PoV.

Coincidentally, on the A23 this is no longer needed. The SRAM for the FIFO
is wholly owned by MUSB and not available to the CPU.


ChenYu
