From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2] arm64: dts: Remove inconsistent use of 'arm,armv8'
 compatible string
Date: Wed, 30 Jan 2019 17:33:57 +0100
Message-ID: <CAK8P3a28_=urR1h95GN_wvYxJSOTUr_gL-cOzk9Pt1CZFGnJCA@mail.gmail.com>
References: <20190114174533.6134-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190114174533.6134-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: arm-soc <arm@kernel.org>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>, Will Deacon <will.deacon@arm.com>, Michal Simek <michal.simek@xilinx.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Nishanth Menon <nm@ti.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Chanho Min <chanho.min@lge.com>, Krzysztof Kozlowski <krzk@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Gregory CLEMENT <gregory.clement@bootlin.com>, Thierry Reding <treding@nvidia.com>, Heiko Stuebner <heiko@sntech.de>, Simon Horman <horms+renesas@verge.net.au>, Tero Kristo <t-kristo@t>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 14, 2019 at 6:45 PM Rob Herring <robh@kernel.org> wrote:
>
> The 'arm,armv8' compatible string is only for software models. It adds
> little value otherwise and is inconsistently used as a fallback on some
> platforms. Remove it from those platforms.

Applied on arm/dt, thanks!

      Arnd
