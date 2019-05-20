From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v3 2/4] arm64: dts: allwinner: h6: add watchdog node
Date: Mon, 20 May 2019 22:57:04 +0800
Message-ID: <CAGb2v65P1tne+-FuJ-tLTRMaPdBPYd9eJS+rS5TXaAULNCLBZg@mail.gmail.com>
References: <20190518152355.11134-1-peron.clem@gmail.com> <20190518152355.11134-3-peron.clem@gmail.com>
 <20190520073652.itk452vrpnicta5v@flea> <CAJiuCceEL9xH45P6Gj99YTir_1tkyraf5HefDNfm9p+UtdLs8w@mail.gmail.com>
 <20190520144404.zprbuqt3d7uuxgr2@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190520144404.zprbuqt3d7uuxgr2@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-watchdog@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 20, 2019 at 10:44 PM Maxime Ripard
<maxime.ripard@bootlin.com> wrote:
>
> On Mon, May 20, 2019 at 10:21:40AM +0200, Clément Péron wrote:
> > Hi,
> >
> > On Mon, 20 May 2019 at 09:36, Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> > >
> > > On Sat, May 18, 2019 at 05:23:53PM +0200, Clément Péron wrote:
> > > > Allwinner H6 has a watchog node which seems broken
> > > > on some boards.
> > > >
> > > > Test has been performed on several boards.
> > > >
> > > > Chen-Yu Tsai boards:
> > > > Pine H64 - H6448BA 7782 => OK
> > > > OrangePi Lite 2 - H8068BA 61C2 => KO
> > > >
> > > > Martin Ayotte boards:
> > > > Pine H64 - H8069BA 6892 => OK
> > > > OrangePi 3 - HA047BA 69W2 => KO
> > > > OrangePi One Plus - H7310BA 6842 => KO
> > > > OrangePi Lite2 - H6448BA 6662 => KO
> > > >
> > > > Clément Péron board:
> > > > Beelink GS1 - H7309BA 6842 => KO
> > > >
> > > > As it seems not fixable for now, declare the node
> > > > but leave it disable with a comment.
> > > >
> > > > Signed-off-by: Clément Péron <peron.clem@gmail.com>
> > >
> > > If it doesn't work most boards, then why do we need to merge that
> > > patch in the first place?
> >
> > My personnal opinion, is that having the IP declared and disabled with
> > a comment saying "it's broken on some boards" in the device-tree is
> > better than not having at all.
> >
> > This will explicit say "the IP exist but don't use it!".
> > Maybe some people with a functionnal board would like to explicitly
> > use it on their dts.
>
> Yeah, that makes sense. Chen-Yu, any opinion on the matter?

Works for me.
