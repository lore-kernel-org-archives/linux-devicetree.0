From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: Re: [PATCH 0/3] Add ethernet0 alias for several A64 boards
Date: Wed, 26 Jul 2017 12:12:21 +0800
Message-ID: <CAGb2v64L0fja4hBv=7YDTj41+HdJLNNeeia=4=V2EjH+_wwdiA@mail.gmail.com>
References: <20170722022852.7868-1-icenowy@aosc.io> <20170724075823.7ttjq4tnvoupo776@flea>
 <f4016e61dbe4655a0e672c3377f35dd2@aosc.io> <20170725031819.ryllvq5a3tdwyblj@angband.pl>
 <20170725143127.ioojcafwaeimvren@flea> <00809C21-F663-4A54-8A9C-31A39739F539@aosc.io>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCMILY6JWQBBBPVN4DFQKGQEO7RSPVY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <00809C21-F663-4A54-8A9C-31A39739F539-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Adam Borowski <kilobyte-b9QjgO8OEXPVItvQsEIGlw@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 26, 2017 at 7:54 AM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
>
>
> =E4=BA=8E 2017=E5=B9=B47=E6=9C=8825=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=88=
10:31:27, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> =E5=86=99=E5=88=
=B0:
>>On Tue, Jul 25, 2017 at 05:18:19AM +0200, Adam Borowski wrote:
>>> On Tue, Jul 25, 2017 at 11:04:24AM +0800, icenowy-h8G6r0blFSE@public.gmane.org wrote:
>>> > =E5=9C=A8 2017-07-24 15:58=EF=BC=8CMaxime Ripard =E5=86=99=E9=81=93=
=EF=BC=9A
>>> > > On Sat, Jul 22, 2017 at 10:28:49AM +0800, Icenowy Zheng wrote:
>>> > > > Allwinner A64 SoC has an EMAC which is used to provide Ethernet
>>> > > > function on several boards.
>>> > > >
>>> > > > The EMAC itself doesn't have a fixed MAC address, but the sunxi
>>> > > > mainline U-Boot have the ability to generate one based on the
>>eFUSE
>>> > > > SID in the chip, and add the generated MAC address to the
>>device
>>> > > > tree when booting.
>>> > > >
>>> > > > The MAC address setting step is based on the device tree's
>>aliases,
>>> > > > and device tree nodes prefixed "ethernet" will get the MAC
>>address
>>> > > > added. However, in several A64 boards' device tree, the alias
>>is not
>>> > > > set up, so that the U-Boot won't set the MAC address.
>>> > > >
>>> > > > Add the ethernet0 aliases to these boards.
>>> > > >
>>> > > > I hope this patchset can be queued in 4.13, otherwise 4.13
>>kernels
>>> > > > won't get non-volatile MAC addresses, and will use random ones
>>> > > > instead, which is annoying to many users.
>>> > > >
>>> > > > Icenowy Zheng (3):
>>> > > >   arm64: allwinner: a64: add ethernet0 alias for BPi M64 EMAC
>>node
>>> > > >   arm64: allwinner: a64: add ethernet0 alias for Pine64 EMAC
>>node
>>> > > >   arm64: allwinner: a64: add ethernet0 alias for SoPine EMAC
>>node
>>> > >
>>> > > Applied all three, thanks!
>>> >
>>> > Sorry, but could you queue them to 4.13?
>>> >
>>> > Otherwise 4.13 kernel release will have annoying random MAC
>>problem,
>>> > which heavily affects headless usages.
>>>
>>> Perhaps it would be better to reword the commit subject as "fix
>>missing
>>> ethernet0 alias ..."?  That'd convey that the previous behaviour is a
>>defect
>>> that needs these patches as a fix.
>>
>>Yes, definitely.
>>
>>That and having a fixes: tag.
>
> Should I resend them with different commit message?

Yes please. And add the "Fixes:" tag.

ChenYu

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
