From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 2/6] arm64: dts: meson: libretech-cc: switch eMMC to 1.8v
Date: Thu, 18 Apr 2019 21:46:05 +0200
Message-ID: <CAFBinCC3+VXwmzCQFL+3zPbi1r1PK6StfaXwT-fk4ogGqgAXRg@mail.gmail.com>
References: <20190418122714.30805-1-jbrunet@baylibre.com> <20190418122714.30805-3-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190418122714.30805-3-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patchwork-bot+notify@kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Apr 18, 2019 at 2:27 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> While some 3.3v eMMC 4.0 are available from libretech, Only the 1.8v 5.0
> modules are recommended and supported for the aml-s905x-cc.
>
> the 1.8v is provided by LDOs on the eMMC card, from vcc 3.3v
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

(I don't have an eMMC module for my Libretech-CC so I can't add a Tested-by)
