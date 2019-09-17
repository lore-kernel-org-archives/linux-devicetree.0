From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v5 3/8] clk: Add clk_hw_unregister_composite helper function definition
Date: Tue, 17 Sep 2019 13:40:42 -0700
Message-ID: <20190917204042.D69A52054F@mail.kernel.org>
References: <20190916161447.32715-1-manivannan.sadhasivam@linaro.org> <20190916161447.32715-4-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190916161447.32715-4-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mturquette@baylibre.com, robh+dt@kernel.org
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, haitao.suo@bitmain.com, darren.tsao@bitmain.com, fisher.cheng@bitmain.com, alec.lin@bitmain.com, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

Quoting Manivannan Sadhasivam (2019-09-16 09:14:42)
> This function has been delcared but not defined anywhere. Hence, this
> commit adds definition for it.
>=20
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---

Can you add a fixes tag?

Fixes: 49cb392d3639 ("clk: composite: Add hw based registration APIs")
