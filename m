From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 0/6] mfd/regulator/clk: bd71837: ROHM BD71837 PMIC driver
Date: Wed, 30 May 2018 08:23:47 -0700
Message-ID: <152769382760.144038.10609724773770264610@swboyd.mtv.corp.google.com>
References: <20180528090003.GA8778@localhost.localdomain> <20180529073958.GB4790@dell>
 <20180529083541.GA13528@localhost.localdomain> <20180530111649.GB8038@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180530111649.GB8038@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, mturquette@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com, lgirdwood@gmail.com, broonie@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mikko.mutanen@fi.rohmeurope.com, heikki.haikola@fi.rohmeurope.com
List-Id: devicetree@vger.kernel.org

Quoting Lee Jones (2018-05-30 04:16:49)
> On Tue, 29 May 2018, Matti Vaittinen wrote:
> =

> > Hello,
> > =

> > On Tue, May 29, 2018 at 08:39:58AM +0100, Lee Jones wrote:
> > > On Mon, 28 May 2018, Matti Vaittinen wrote:
> > > =

> > > > Patch series adding support for ROHM BD71837 PMIC.
> > > FYI, this patch-set is going to be difficult to manage since it was
> > > not sent 'threaded'.
> > > =

> > > If/when you send a subsequent version, could you please ensure you
> > > send the set threaded so the patches keep in relation to one another
> > > as they are reviewed?
> > =

> > Thanks for the guidance. I have not sent so many patches to community so
> > I am grateful also from all the practical tips =3D) Just one slight pro=
blem.
> > I have only seen emails being threaded when one is replying to an email.
> > So how should I send my patches in same thread? Just send first one and
> > then send subsequent patches as replies?
> > =

> > I just killed some unused definitions and one unused variable from the
> > code so I am about to send new version. I'll try doing that as a thread=
ed
> > series and resend all the patches as v3.
> =

> You don't need to do this manually.
> =

> Just use `git send-email` with the correct arguments.
> =


I usually send with 'git send-email *.patch' so that git can do the
threading for me. Looks like these patches were sent with Mutt though,
so perhaps 'git format-patch | git imap-send' was used without the
--thread option on format-patch.
