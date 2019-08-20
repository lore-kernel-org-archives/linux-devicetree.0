From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 04/14] arm64: dts: meson-gx: fix spifc compatible
Date: Tue, 20 Aug 2019 22:29:51 +0200
Message-ID: <CAFBinCA73WmyzmwY8uooMFdRCP4iGGZjaHjTU4q_6oNnZrkWqQ@mail.gmail.com>
References: <20190814142918.11636-1-narmstrong@baylibre.com> <20190814142918.11636-5-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190814142918.11636-5-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: khilman@baylibre.com, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 14, 2019 at 4:31 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> This fixes the following DT schemas check errors:
> meson-gxl-s805x-libretech-ac.dt.yaml: spi@8c80: compatible:0: 'amlogic,meson-gx-spifc' is not one of ['amlogic,meson6-spifc', 'amlogic,meson-gxbb-spifc']
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
