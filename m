From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 2/6] ARM: rockchip: add debug uart used by rk3288
Date: Wed, 16 Jul 2014 08:09:27 -0700
Message-ID: <CAD=FV=U9NviQ24CkbUCEMrWTLyXFb2FwT2wAHtKA7SF2PSFVdw@mail.gmail.com>
References: <1471578.ILeMmG2DL6@diego>
	<2866950.oXmKFGy9mh@diego>
	<CAD=FV=W3aWeT3RP5_g9r8kV8ToeHfyn57JY-py2zGVW9DF_7RQ@mail.gmail.com>
	<4054962.m70Hhy4CVc@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4054962.m70Hhy4CVc@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Eddie Cai <eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Heiko,

On Wed, Jul 16, 2014 at 2:11 AM, Heiko St=C3=BCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> w=
rote:
> Am Dienstag, 15. Juli 2014, 21:13:10 schrieb Doug Anderson:
>> Heiko,
>>
>> On Tue, Jul 15, 2014 at 4:00 PM, Heiko St=C3=BCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org=
> wrote:
>> > The uarts on rk3288 are still compatible with the dw_8250, but loc=
ated
>> > at a different position and need DEBUG_UART_8250_WORD enabled.
>> >
>> > Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
>> > ---
>> >
>> >  arch/arm/Kconfig.debug | 12 +++++++++++-
>> >  1 file changed, 11 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
>> > index 8f90595..f68def0 100644
>> > --- a/arch/arm/Kconfig.debug
>> > +++ b/arch/arm/Kconfig.debug
>> > @@ -613,6 +613,14 @@ choice
>> >
>> >                   Say Y here if you want kernel low-level debuggin=
g
>> >                   support
>> >                   on Rockchip based platforms.
>> >
>> > +       config DEBUG_RK32_UART2
>>
>> It's slightly confusing that you didn't rename the old "DEBUG_RK3X_U=
ART2".
>
> My problem is, to what :-) ... DEBUG_RK30_UART2 ?
>
> RK30xx and RK31xx share these, but I guess at least the description s=
hould be
> adapted.

Yeah, trying to get these things right is an impossible task.  The
only thing I've ever seen that's sane is to just name things after the
first person in the code base to use them rather than trying to guess
ahead of time how similar products with similar marketing name will be
in the future.

=2E..agree that even if you don't do the rename here that updating the
description would be nice.

-Doug
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
