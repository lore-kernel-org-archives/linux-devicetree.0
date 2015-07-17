From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 3/6] clk: sunxi: Add A33 clock for compilation
Date: Fri, 17 Jul 2015 16:57:11 +0800
Message-ID: <CAGb2v67NjfNjS_FQoYmEs2=OhKYRszgzuqiNPyww3UtiWCq--Q@mail.gmail.com>
References: <1431240383-12763-1-git-send-email-vishnupatekar0510@gmail.com>
 <1431240383-12763-4-git-send-email-vishnupatekar0510@gmail.com>
 <20150510101750.GC11057@lukather> <CAEzqOZv5pDPJgBfvNKk7vZuTr5H9hLdEOweyxStRFtarNxtFhQ@mail.gmail.com>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBAEHUOWQKGQEJ7O7I7I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <CAEzqOZv5pDPJgBfvNKk7vZuTr5H9hLdEOweyxStRFtarNxtFhQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Vishnu,

This patch did not make v4.2-rc1.

A33 support requires this patch. Otherwise the clock tree
is absent and nothing works.



On Mon, May 11, 2015 at 4:53 PM, Vishnu Patekar
<vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi,
>
> On Sun, May 10, 2015 at 3:47 PM, Maxime Ripard
> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
>> Hi,
>>
>> On Sun, May 10, 2015 at 12:16:20PM +0530, Vishnu Patekar wrote:
>>> A33 clock control unit is similar to A23.
>>>
>>> A33 specific clocks are not yet implemented, added CLK_OF_DECLARE
>>> to get it compiled for A33.
>>
>> That commit log doesn't make any sense.
>>
>> What you're doing isn't about whether or not that will be compiled,
>> but whether you're registering the clocks and which clocks you
>> protect.
> Actually, It's just registering the a33 clocks and reusing a23 code.
> nothing to do with compile. I'll correct it in next patch version.
>>
>>> Signed-off-by: VishnuPatekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>
>> Isn't it supposed to have a space in the middle of your name, just
>> like you have in your mail address?
> Yes, There should be space.
>>
>> Thanks,
>> Maxime
>>
>> --
>> Maxime Ripard, Free Electrons
>> Embedded Linux, Kernel and Android engineering
>> http://free-electrons.com
