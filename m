From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 04/22] clk: at91: audio-pll: separate registration from DT
 parsing
Date: Wed, 17 Oct 2018 10:49:46 -0700
Message-ID: <153979858672.5275.14300177764052679778@swboyd.mtv.corp.google.com>
References: <20181016142200.19741-1-alexandre.belloni@bootlin.com>
 <20181016142200.19741-5-alexandre.belloni@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181016142200.19741-5-alexandre.belloni@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, Michael Turquette <mturquette@baylibre.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>
List-Id: devicetree@vger.kernel.org

Quoting Alexandre Belloni (2018-10-16 07:21:42)
> Separate registration out of of_sama5d2_clk_audio_pll*_setup to allow oth=
er
> code to use it.
> =

> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---

Applied to clk-next
