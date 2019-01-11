From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 0/6] Add clock support for Actions Semi S500 SoC
Date: Fri, 11 Jan 2019 14:51:04 -0800
Message-ID: <154724706468.169631.2903523518830581075@swboyd.mtv.corp.google.com>
References: <20181231185517.18517-1-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181231185517.18517-1-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: afaerber@suse.de, mturquette@baylibre.com, robh+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

Quoting Manivannan Sadhasivam (2018-12-31 10:55:11)
> Hello,
>=20
> This patchset adds common clock support for Actions Semi S500 SoC of
> the Owl family SoCs. This series is based on the initial work done
> by Edgar Bernardi Righi. https://patchwork.kernel.org/cover/10587527/
>=20
> Since there isn't any update from him for long time, I took the liberty
> to modify his patches, address review comments and send to list for revie=
w.
>=20
> This series has been tested on Allo Sparky SBC.
>=20
> Thanks,
> Mani
>=20
> Edgar Bernardi Righi (1):
>   dt-bindings: clock: Add DT bindings for Actions Semi S500 CMU
>=20
> Manivannan Sadhasivam (5):
>   clk: actions: Add configurable PLL delay
>   ARM: dts: Add CMU support for Actions Semi Owl S500 SoC
>   ARM: dts: Remove fake UART clock for S500 based SBCs
>   clk: actions: Add clock driver for S500 SoC
>   MAINTAINERS: Add linux-actions mailing list for Actions Semi

What's the merge strategy for these patches? Some are for clk, others
are for arm-soc, etc. I see a sandwich of patches too so it sounds like
I can't even take just the clk ones for fear of breaking something that
the dts bits in the middle clear out of the way.
