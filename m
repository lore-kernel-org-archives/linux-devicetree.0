From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 1/6] arm64: dts: meson: libretech-cc: set eMMC as removable
Date: Thu, 18 Apr 2019 22:21:49 +0200
Message-ID: <CAFBinCBU4hPYTXUBJwiN+mJeqrC_a8aw6kNnUBYaAkBbrC+Uiw@mail.gmail.com>
References: <20190418122714.30805-1-jbrunet@baylibre.com> <20190418122714.30805-2-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190418122714.30805-2-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patchwork-bot+notify@kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Apr 18, 2019 at 2:27 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> The eMMC on this board is add-on module which is not mandatory. Removing
> 'non-removable' property should prevent some errors when booting a board
> w/o an eMMC module present.
>
> Fixes: 72fb2c852188 ("ARM64: dts: meson-gxl-s905x-libretech-cc: fixup board definition")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Reviewed-by: Martin Blumenstingl<martin.blumenstingl@googlemail.com>
