From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 1/6] clk: actions: Add configurable PLL delay
Date: Fri, 22 Feb 2019 00:03:00 -0800
Message-ID: <155082258002.77512.8979526306640099690@swboyd.mtv.corp.google.com>
References: <20190115033340.25016-1-manivannan.sadhasivam@linaro.org> <20190115033340.25016-2-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190115033340.25016-2-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: afaerber@suse.de, devicetree@vger.kernel.org, linux-actions@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, mturquette@baylibre.com, robh+dt@kernel.org
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

Quoting Manivannan Sadhasivam (2019-01-14 19:33:35)
> S500 SoC requires configurable delay for different PLLs. Hence, add
> a separate macro for declaring a PLL with configurable delay and also
> modify the existing OWL_PLL_NO_PARENT macro to use default delay so
> that no need to modify the existing S700/S900 drivers.
>=20
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---

Applied to clk-next
