From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH next v2] of/fdt: Fix defined but not used compiler warning
Date: Mon, 17 Jun 2019 08:10:08 -0700
Message-ID: <5d07ad51.1c69fb81.25c8.f3a0@mx.google.com>
References: <20190612010011.90185-1-wangkefeng.wang@huawei.com> <20190615030343.96524-1-wangkefeng.wang@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190615030343.96524-1-wangkefeng.wang@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Rob Herring <robh@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

Quoting Kefeng Wang (2019-06-14 20:03:43)
> When CONFIG_OF_EARLY_FLATTREE is disabled, there is a compiler
> warning,
>=20
> drivers/of/fdt.c:129:19: warning: =E2=80=98of_fdt_match=E2=80=99 defined =
but not used [-Wunused-function]
>  static int __init of_fdt_match(const void *blob, unsigned long node,
>=20
> Since the only caller of of_fdt_match() is of_flat_dt_match(),
> let's move the body of of_fdt_match() into of_flat_dt_match()
> and eliminate of_fdt_match().
>=20
> Meanwhile, move of_fdt_is_compatible() under CONFIG_OF_EARLY_FLATTREE,
> as all callers are over there.
>=20
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Arnd sent something similar now too.
