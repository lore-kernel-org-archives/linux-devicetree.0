Return-Path: <SRS0=uGxy=OQ=linaro.org=linus.walleij@kernel.org>
MIME-Version: 1.0
References: <20181123124341.21431-1-thierry.reding@gmail.com>
In-Reply-To: <20181123124341.21431-1-thierry.reding@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 7 Dec 2018 11:08:28 +0100
Message-ID: <CACRpkdYGnQNGePViRz-M6Ku=MP063as2G_vJqNx2HDgGdW1UQQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: tegra186-gpio: Add Tegra186 specific prefix
Content-Type: text/plain; charset="UTF-8"
To: "thierry.reding@gmail.com" <thierry.reding@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Jon Hunter <jonathanh@nvidia.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-tegra@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Fri, Nov 23, 2018 at 1:43 PM Thierry Reding <thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> Subsequent generations of Tegra, such as Tegra194, contain a completely
> different set of GPIOs. In order to clarify that the Tegra186 defines
> are indeed specific to Tegra186, change the prefix from TEGRA_ to
> TEGRA186_.
>
> Note that for now we need to keep the old definitions in place to avoid
> breaking compilation in file that use this header. Once all users have
> been converted to use the new defines, the old ones can be removed.
>
> Also note that this is only a naming change and doesn't affect device
> tree ABI.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Patch applied for v4.21 with Jon's ACK.

I assume this is not something that needs coordinating with
some other git tree but part of some long term plan, so just
optimistically applied it.

Yours,
Linus Walleij
