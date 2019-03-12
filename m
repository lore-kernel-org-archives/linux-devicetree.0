From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] dt-bindings: clock: imx8mq: Fix numbering overlaps and gaps
Date: Tue, 12 Mar 2019 13:39:50 -0700
Message-ID: <155242319026.20095.4334777579139010310@swboyd.mtv.corp.google.com>
References: <1551779342-2640-1-git-send-email-abel.vesa@nxp.com> <155181110921.20095.1641360339603928947@swboyd.mtv.corp.google.com> <20190306130941.dqf3swx66bchm5k2@fsr-ub1664-175> <155205894567.20095.2782332899458282059@swboyd.mtv.corp.google.com> <20190312073654.GA85609@thor.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190312073654.GA85609@thor.local>
Sender: linux-kernel-owner@vger.kernel.org
To: Patrick Wildt <patrick@blueri.se>
Cc: Abel Vesa <abel.vesa@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Quoting Patrick Wildt (2019-03-12 00:36:54)
> On Fri, Mar 08, 2019 at 07:29:05AM -0800, Stephen Boyd wrote:
> > It's mostly about making sure that any existing dtbs don't have their
> > numbers shifted around. So hopefully any overlapping identifiers aren't
> > in use yet and then those ids can be changed while leaving the ones that
> > are in use how they are.
>=20
> In practice I bet no one uses Linux 5.0's i.MX8M device trees since they
> lack too much support.  It's so basic it's not useful.  You'd still run
> your existing non-mainline bindings until it is.  Thus I would argue
> changing the ABI right now would be the only chance there is.
>=20
> If you think that chance is gone, then I guess the reasonable thing is
> to keep the numbers and only move those (to the end) which overlap.  Or
> put them into that erreneous number gap.
>=20

The chance is quickly slipping away because we're going to be at -rc1
soon. I'm not the one to decide what is and isn't being used by people
out there, so I'm happy to apply this patch now before the next -rc1
comes out as long as it doesn't break anything in arm-soc area. The
confidence I'm getting isn't high though. Has anyone from NXP reviewed
this change? Maybe I can get an ack from someone else that normally
looks after the arm-soc/dts side of things here indicating that nothing
should go wrong? That would increase my confidence levels.
