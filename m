From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 4/5] clk: Aspeed: Setup video engine clocking
Date: Thu, 18 Apr 2019 14:56:04 -0700
Message-ID: <155562456441.15276.6879645599643373488@swboyd.mtv.corp.google.com>
References: <1554229504-5661-1-git-send-email-eajames@linux.ibm.com> <1554229504-5661-5-git-send-email-eajames@linux.ibm.com> <CACPK8Xc5vA6M06QgXMAm9angZMdobxNOqFMNwzq30_GQNaBT9A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACPK8Xc5vA6M06QgXMAm9angZMdobxNOqFMNwzq30_GQNaBT9A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Eddie James <eajames@linux.ibm.com>
Cc: linux-media@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-aspeed@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, mchehab@kernel.org, linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, devicetree <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

Quoting Joel Stanley (2019-04-10 19:50:16)
> On Tue, 2 Apr 2019 at 18:25, Eddie James <eajames@linux.ibm.com> wrote:
> >
> > Add eclk mux and clock divider table. Also change the video engine reset
> > to the correct clock; it was previously on the video capture but needs
> > to be on the video engine clock.
> >
> > Signed-off-by: Eddie James <eajames@linux.ibm.com>
>=20
> Reviewed-by: Joel Stanley <joel@jms.id.au>
>=20
> Stephen, Eddie and I have worked together on this change and I am
> happy with it now.
>=20

Thanks! Applied to clk-next.
