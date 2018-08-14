From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: Re: [PATCH v2 00/18] Allwinner R40 HDMI refactoring
Date: Tue, 14 Aug 2018 13:47:20 +0800
Message-ID: <CAGb2v644n_CLYkLVqu6ALhpQ+nF-OQ=JRR0KcLENs4LQbDcPHg@mail.gmail.com>
References: <20180710203511.18454-1-jernej.skrabec@siol.net>
 <20180711083036.7attjq4hm5ay5gmn@flea> <2309112.TTVI9Fv1ar@jernej-laptop>
 <20180724123741.bbkjgy2uwmzsj45k@flea> <87f1db37e70473cd1a77f5e0d2f9a779c6afe7db.camel@aosc.io>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCMILY6JWQBBB76ZZHNQKGQEVW5R2YI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <87f1db37e70473cd1a77f5e0d2f9a779c6afe7db.camel-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 14, 2018 at 1:43 PM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
> =E5=9C=A8 2018-07-24=E4=BA=8C=E7=9A=84 14:37 +0200=EF=BC=8CMaxime Ripard=
=E5=86=99=E9=81=93=EF=BC=9A
>> On Sun, Jul 22, 2018 at 04:43:56PM +0200, Jernej =C5=A0krabec wrote:
>> > Hi Maxime,
>> >
>> > Dne sreda, 11. julij 2018 ob 10:30:36 CEST je Maxime Ripard
>> > napisal(a):
>> > > On Tue, Jul 10, 2018 at 10:34:53PM +0200, Jernej Skrabec wrote:
>> > > > This series fixes several issues found in R40 HDMI patch series
>> > > > after
>> > > > it was applied. Conversation can be found here:
>> > > >
> http://lists.infradead.org/pipermail/linux-arm-kernel/2018-June/586011.ht=
m
>> > > > l
>> > > >
>> > > > Patches are based on latest linux-next (next-20180710) and are
>> > > > ordered
>> > > > in such way that they don't break R40 HDMI at any time. Because
>> > > > of that
>> > > > I suggest that whole series goes through drm-misc to preserve
>> > > > that order.
>> > > >
>> > > > I also tested those patches on H3 to make sure it doesn't break
>> > > > other
>> > > > platforms. However, it would be nice to test for regressions
>> > > > also on
>> > > > older SoCs (with DE1).
>> > > >
>> > > > Best regards,
>> > > > Jernej
>> > >
>> > > Applied all patches but the patch 10, thanks!
>> > > Maxime
>> >
>> > It seems that you forgot to merge some patches:
>> >
>> > [PATCH v2 12/18] drm/sun4i: tcon: Add another way for matching
>> > mixers with
>> > tcon
>> > [PATCH v2 13/18] drm/sun4i: tcon: Add support for R40 TCON
>> >
>> > Without them, R40 display pipeline can't work.
>> >
>> > Maybe they are in your spam folder?
>>
>> Thanks for telling me, I'm not quite sure what happened.
>>
>> I've applied them.
>
> Sorry, but I still didn't find them in linux-next/master.

They were applied too late and missed the -rc6 deadline for drm-misc.
We either have to revert the DT changes in 4.19-rc or somehow sneak
in a patch that prevents it from crashing.

ChenYu

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
