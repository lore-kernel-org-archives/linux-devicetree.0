From: "'Arend Van Spriel' via linux-sunxi" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Subject: Re: Re: [PATCH 1/4] brcmfmac: Add brcm,nvram_file_name
 dt property
Date: Mon, 18 Jul 2016 09:51:14 +0200
Message-ID: <44803976-7e34-991f-5ee0-0a548f6cefc6@broadcom.com>
References: <1467209074-15634-1-git-send-email-hdegoede@redhat.com>
 <3354017.XSBSmHHtrQ@wuerfel>
 <bb1beb8d-652d-aa97-e24b-e3e27397dd2e@broadcom.com>
 <3996482.D5xdKXDiGl@wuerfel> <20160717214502.GA11498@rob-hp-laptop>
Reply-To: arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRYNGWEWYDBB6EUWK6AKGQERH6MOFQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20160717214502.GA11498@rob-hp-laptop>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>, "John W . Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 17-7-2016 23:45, Rob Herring wrote:
> On Thu, Jul 07, 2016 at 10:46:28AM +0200, Arnd Bergmann wrote:
>> On Wednesday, July 6, 2016 9:19:41 PM CEST Arend Van Spriel wrote:
>>> On 6-7-2016 15:42, Arnd Bergmann wrote:
>>>> On Wednesday, July 6, 2016 10:08:55 AM CEST Arend Van Spriel wrote:
>>>>> On Tue, Jul 5, 2016 at 3:43 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
>>>> All existing uses of the model property in arch/arm/boot/dts and most of
>>>> the ones in arch/powerpc/boot/dts are against the intended usage in
>>>> one way or another, but adding different kind of incorrect usage won't
>>>> improve that.
>>>>
>>>> The only way I can see the model property being used correctly would
>>>> be to have it match the first entry in the compatible property, but
>>>> that is completely redundant, so we tend to omit it, except for the
>>>> root node in which it is required. For the root node however, the
>>>> historic practice that has crept in on ARM is to put something completely
>>>> different in there, which is a human-readable description of the
>>>> machine rather than something we can use as a unique indentifier.
>>>>
>>>> I'd just consider the "model" property burned, and not use it for anything
>>>> that doesn't already use it, just like we handle "device_type": a few
>>>> things require it, nothing else should use it.
>>>
>>> If that is the agreed approach in devicetree arena I am fine with it. I
>>> have been unaware of this and just looked at the suggestion from Jonas
>>> seeing a solution to the problem at hand.
>>
>> I don't think it has been discussed or decided before as the question
>> has not come up, so for now this is my personal view. Maybe one of
>> the devicetree maintainers can comment on this.
> 
> Back from vacation and getting caught up.
> 
> I agree with Arnd here. In my view model is the OEM branding on the 
> device, compatible is the h/w. If you have different firmware related 
> files, that goes beyond OEM branding.

Thanks, Rob

We are talking about hardware variants here. So using the model property
is off the table.

Regards,
Arend
