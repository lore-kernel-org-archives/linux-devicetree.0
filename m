From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 0/3] Add clock driver for Actions S700 SoC
Date: Fri, 29 Jun 2018 10:38:44 -0700
Message-ID: <153029392426.143105.1931235700216822088@swboyd.mtv.corp.google.com>
References: <20180626192820.28237-3-sravanhome@gmail.com>
 <20180628191805.3722-1-sravanhome@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180628191805.3722-1-sravanhome@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: afaerber@suse.de
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Saravanan Sekar <sravanhome@gmail.com>, catalin.marinas@arm.com, mturquette@baylibre.com, will.deacon@arm.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, manivannan.sadhasivam@linaro.org, pn@denx.de, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Quoting Saravanan Sekar (2018-06-28 12:18:02)
> Changelog v2:
> Fixed 0 day compilation warning
> Modified existing dts Actions S900 clock bindings common to Actions
> Soc family
> =

> This patchset adds clock support for Actions Semi OWL series S700 SoC
> with relevant clock bindings and device tree info. =

> =

> Changed the UART clock using CMU instance and changes are tested in
> cubieboard7
> =

> Thanks and regards,
> Saravanan,
> Parthiban
> =

> Saravanan Sekar (3):
>   arm64: dts: actions: Enable clock controller for S700
>   clk: actions: Add S700 SoC clock support
>   dt-bindings: clock: Modify Actions Soc clock bindings

Normally this patch comes first, and then clk driver, and then dts bits.
Also, the header file for the #define constants would be part of the
bindings patch.
