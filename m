From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 2/2] clk: mediatek: correct cpu clock name for MT8173 SoC
Date: Tue, 26 Feb 2019 10:17:49 -0800
Message-ID: <155120506909.260864.5536692295521525636@swboyd.mtv.corp.google.com>
References: <20190225065112.3400-1-seiya.wang@mediatek.com> <20190225065112.3400-2-seiya.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190225065112.3400-2-seiya.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Seiya Wang <seiya.wang@mediatek.com>
List-Id: devicetree@vger.kernel.org

Quoting Seiya Wang (2019-02-24 22:51:12)
> Correct cpu clock name from ca57 to ca72 since MT8173 does use cortex-a72.
>=20
> Signed-off-by: Seiya Wang <seiya.wang@mediatek.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> ---

Applied to clk-next
