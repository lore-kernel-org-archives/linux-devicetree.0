From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 00/15] musb: Add support for the Allwinner
 sunxi musb controller
Date: Tue, 10 Mar 2015 23:35:15 +0100
Message-ID: <54FF71A3.7080802@redhat.com>
References: <1425933628-9672-1-git-send-email-hdegoede@redhat.com> <20150310174116.GX5085@lukather>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBDRZXY4CYYORBL7D7WTQKGQEJQPEWLA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20150310174116.GX5085@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 03/10/2015 06:41 PM, Maxime Ripard wrote:
> On Mon, Mar 09, 2015 at 09:40:13PM +0100, Hans de Goede wrote:
>> Hi All,
>>
>> This patch set has been a while in the making, so I'm very happy to present
>> the end result here, and I hope everyone likes it.
>>
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
>
> And I disagree with your disagreement :)
>
>> 1) syscon was specifically designed for global system control registers like
>> this and is fine to use as long as there are no conflicts where 1 bit is of
>> interest to multiple drivers, and there is no such conflict here
>
> No. Syscon has been designed for being lazy.
>
> This is a huge abstraction non-sense. You have to put all the logic of
> dealing with some external register layout in clients drivers,
> including dealing with the different revisions/SoC that are different
> from that aspect, and duplicating that code across all client drivers.
>
>> 2) Maxime's other arguments seem to boil down to it would be nice / prettier
>> to have a specific driver for this, without really proving a hard need for
>> such a driver. But writing such a driver is going to be a lot of work, and
>> we've a ton of other work to do, and as said there is no real need for a
>> separate driver, syscon works fine for this.
>
> Actually, I already wrote some prototype for this. I'll clean this up
> and send it tonight/tomorrow.

Ok, lets see your prototype and then we'll go from there.

Regards,

Hans
