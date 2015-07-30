From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v5 01/10] clk: mediatek: Removed unused dpi_ck clock from MT8173
Date: Thu, 30 Jul 2015 22:07:55 +0200
Message-ID: <2512315.QAADqjoYKs@diego>
References: <1438152754-11970-1-git-send-email-jamesjj.liao@mediatek.com> <1450634.BBmUdb8ZLk@diego> <55BA7E34.2050206@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <55BA7E34.2050206@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: James Liao <jamesjj.liao@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Mike Turquette <mturquette@baylibre.com>, srv_heupstream@mediatek.com, Daniel Kurtz <djkurtz@chromium.org>, Ricky Liang <jcliang@chromium.org>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am Donnerstag, 30. Juli 2015, 12:42:44 schrieb Stephen Boyd:
> On 07/30/2015 11:04 AM, Heiko St=FCbner wrote:
> > Am Donnerstag, 30. Juli 2015, 10:36:43 schrieb Stephen Boyd:
> >> Is it being used in DT right now and causing regressions on
> >> v4.2-rcX? Sorry, I'm trying to understand why this patch matters
> >> for the 4.2 release.
> >=20
> > it's not been used in an actual devicetree file, but as far as I
> > understand it, the dt-binding headers themself are also part of the=
 ABI.
> >=20
> > And it is new in 4.2, so has not been part of an official release y=
et.
> >=20
> > The reason for the removal from what I understand is that the remov=
ed
> > clock is not documented at all (it's source, what it does), which g=
ot it
> > the "clk_null" parent in the first place.
>=20
> Right, so my understanding of the DT ABI thing is that newer kernels
> should keep working with older DTs. If there isn't any DT using the
> binding, then we don't have a problem because the only thing that cou=
ld
> happen would be a newer DT working with an older kernel, which doesn'=
t
> make any sense from a backwards incompatible standpoint.
>=20
> If you feel strongly that some sort of DT ABI rule would be broken an=
d
> you want to make sure that doesn't happen I guess we can queue this u=
p
> to be sent off to Linus, but if you aren't worried (and I'm obviously
> not worried) then I'd prefer we just queue it up for 4.3.

I don't feel strongly, it was only based on what I remember about all t=
he dt-
ABI talk :-) . Aka if you're ok with it simply going into 4.3 that shou=
ld be=20
ok too from my pov.
