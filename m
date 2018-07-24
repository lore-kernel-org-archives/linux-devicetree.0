From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: Re: [PATCH 3/3] arm64: allwinner: dts: h6: add
 Wi-Fi support for Pine H64 model A/B
Date: Tue, 24 Jul 2018 22:42:32 +0800
Message-ID: <198DB486-4789-4777-9596-2BD6FAFFB741@aosc.io>
References: <20180724011551.49603-1-icenowy@aosc.io> <20180724011551.49603-4-icenowy@aosc.io> <CAGb2v67zR-Q9n7L6CaFKDUJFHFEC_h8-RYxkdyeyJb_GbNmkJw@mail.gmail.com> <CEA43CB7-1DA6-4983-BF18-82C4A48FB92B@aosc.io> <CAGb2v64Qae4O430kP30DQNhp0Dt774OHt0nMe35ckp8X=CTFLg@mail.gmail.com> <AC678B03-19B7-4110-B333-72188CE71296@aosc.io> <CAGb2v656oPmAX=_y88b05xqrona3HFtU-VmNQhHxK_n-4gD+aw@mail.gmail.com> <20180724144151.myyg7slocsfjjsfi@flea>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBQHW3TNAKGQEOHX2HXI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180724144151.myyg7slocsfjjsfi@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.orgMaxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2018=E5=B9=B47=E6=9C=8824=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=8810=
:41:51, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> =E5=86=99=E5=88=B0:
>On Tue, Jul 24, 2018 at 10:37:51AM +0800, Chen-Yu Tsai wrote:
>> On Tue, Jul 24, 2018 at 10:28 AM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>wrote:
>> >
>> >
>> > =E4=BA=8E 2018=E5=B9=B47=E6=9C=8824=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=
=8810:26:02, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> =E5=86=99=E5=88=B0:
>> >>On Tue, Jul 24, 2018 at 10:23 AM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>> >>wrote:
>> >>>
>> >>>
>> >>> =E4=BA=8E 2018=E5=B9=B47=E6=9C=8824=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=
=8D=8810:21:59, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>=E5=86=99=E5=88=B0:
>> >>>>On Tue, Jul 24, 2018 at 9:15 AM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>> >>wrote:
>> >>>>> The Pine H64 model A has a Wi-Fi module connector and the model
>B
>> >>has
>> >>>>an
>> >>>>> on-board RTL8723BS Wi-Fi module.
>> >>>>>
>> >>>>> Add support for them. For model A, as it's not defaultly
>present,
>> >>>>keep
>> >>>>> it disabled now.
>> >>>>
>> >>>>Nope. Pine64 actually has two WiFi/BT modules. And they require
>> >>>>different
>> >>>>device tree snippets for both the WiFi and BT side. This is
>better
>> >>>>resolved
>> >>>>with device tree overlays.
>> >>>>
>> >>>>I have both, though I've yet found time to work on them.
>> >>>
>> >>> I have also both.
>> >>>
>> >>> The skeleton here can get the Wi-Fi of both to work.
>> >>
>> >>Cool. Then I can put away my RTL module for now. :)
>> >
>> > P.S. SDIO is auto detectable, and for BCM chips, the OOB interrupt
>> > is only a bonus function and it can fall back to standard in-band
>> > interrupt (which doesn't need special binding, and is currently
>> > used by mainline r8723bs driver.)
>>=20
>> Correct. With BT you'll have serdev device nodes with different
>> compatibles. Then you'll have to resort to overlays, and you'd
>probably
>> end up adding WiFi OOB interrupt bits as well.
>>=20
>> So the question remaining is: should we enable the MMC part, along
>> with power sequencing and regulator supplies, by default? Thinking
>> more about it, I'm actually OK with it. The board connectors are
>> clearly marked as being for a WiFi+BT module. The whole space on
>> the board is surrounded by a box in silkscreen. Sorry for the
>> initial nack.
>>=20
>> Maxime, any thoughts?
>
>If there's a need for an overlay anyway, there's no real reason to
>enable it by default, especially if not everything is there.

Everything is there, for model B support.

>
>Maxime

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
