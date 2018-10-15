From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 3/5] clk: lochnagar: Add support for the Cirrus Logic Lochnagar
Date: Mon, 15 Oct 2018 14:53:56 -0700
Message-ID: <153964043651.5275.8596868422770600346@swboyd.mtv.corp.google.com>
References: <20181008132542.19775-1-ckeepax@opensource.cirrus.com>
 <20181008132542.19775-3-ckeepax@opensource.cirrus.com>
 <153924124658.207691.10370075148426001371@swboyd.mtv.corp.google.com>
 <20181011132602.GD1653@imbe.wolfsonmicro.main>
 <153935999691.5275.1587207165396958375@swboyd.mtv.corp.google.com>
 <20181015104905.GF1653@imbe.wolfsonmicro.main>
 <153962159992.5275.9275448716859702011@swboyd.mtv.corp.google.com>
 <20181015165528.GD12949@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181015165528.GD12949@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, lee.jones@linaro.org, linus.walleij@linaro.org, mturquette@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Mark Brown (2018-10-15 09:55:28)
> On Mon, Oct 15, 2018 at 09:39:59AM -0700, Stephen Boyd wrote:
> =

> > Ok if there's going to be read/volatile regs and defaults then it makes
> > sense to leave the defines in some shared header file, which is
> > unfortunate for the independent merge of driver bits. Either way, I
> =

> Kconfig dependencies take care of that pretty well - if there's a
> dependency on the MFD then the function driver just won't get built
> until the MFD gets merged.  =


Yep. I'm just saying that I can't merge the clk driver part by itself
when there's a shared header dependency, unless someone provides a
stable tree with the header file patch applied to it.
