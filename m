From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH next] of/fdt: Fix defined but not used compiler warning
Date: Wed, 12 Jun 2019 07:44:36 -0700
Message-ID: <5d010fd5.1c69fb81.e7b77.87ae@mx.google.com>
References: <20190612010011.90185-1-wangkefeng.wang@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190612010011.90185-1-wangkefeng.wang@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Rob Herring <robh@kernel.org>, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

Quoting Kefeng Wang (2019-06-11 18:00:11)
> When CONFIG_OF_EARLY_FLATTREE is disabled, there is a compiler warning,
>=20
> drivers/of/fdt.c:129:19: warning: =E2=80=98of_fdt_match=E2=80=99 defined =
but not used [-Wunused-function]
>  static int __init of_fdt_match(const void *blob, unsigned long node,
>=20
> Move of_fdt_match() and of_fdt_is_compatible() under CONFIG_OF_EARLY_FLAT=
TREE
> to fix it.
>=20
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
