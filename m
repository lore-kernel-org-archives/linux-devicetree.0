From: Olliver Schinagl <oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: dts: sunxi: Add a olinuxino-lime2-emmc
Date: Wed, 4 May 2016 14:52:12 +0200
Message-ID: <5729F07C.3080308@schinagl.nl>
References: <1461827998-12192-1-git-send-email-oliver@schinagl.nl>
 <CAGb2v66E2TuN3+tYaAbniV3q67waDZOfqKAW14VJz6xZFomZ=Q@mail.gmail.com>
 <57285162.2000704@schinagl.nl>
 <CAGb2v66r9m7qVW6BszeT2wqs0KyEr4x5ivTJYqu2Fes=R9-Ltw@mail.gmail.com>
 <CANCTEQgjiuQXcaw=3Dr5kUsTPc3nsDQf2odwzs4nHvrkREAqrg@mail.gmail.com>
Reply-To: oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBDC2JNWXZAJBBAHBU64QKGQEP56THAI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CANCTEQgjiuQXcaw=3Dr5kUsTPc3nsDQf2odwzs4nHvrkREAqrg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Radoslav Kolev <radoslav.kolev-1W28NRE8jL9DPfheJLI6IQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Tsvetan Usunov <tsvetan-kyXcfZUBQGPQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, dev <dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hey Radoslav,

On 04-05-16 14:30, Radoslav Kolev wrote:
> 2016-05-03 10:25 GMT+03:00 Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>:
>> On Tue, May 3, 2016 at 3:21 PM, Olliver Schinagl <oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org> wrote:
>>>>> +       bus-width = <4>;
>>>> Only 4 bits? We normally see eMMC with 8 bits. 4 bits are some kind of
>>>> embedded SD card.
>>> On A20 as well? Our investigations so far have concluded that the A10 and
>>> A20 have those pins not mapped out to pads. The IP does support it however
>>> we assume.
>> You're right. My bad. First time A10/A20 sees eMMC support.
> I can't say anything about A10/A20, but I have a board with A13 and
> the same eMMC chip and it works fine in 8 bit mode.
Yep, sun5i actually brings them all out to pads, the A20 however does 
not :( We first thought that the A20 would also be an 8bitter, because 
the mmc IP appears to be the same as sun5i, but initial tests show it is 
not. As for A10, it has older IP and it might not even support 8 bit 
mode, let alone bring out the pins.

But with A20's + eMMC being available via the lime2, others may repeat 
my experiments! The lime2 is 8 bit connected.

Olliver
>
> Regards,
> Radoslav
