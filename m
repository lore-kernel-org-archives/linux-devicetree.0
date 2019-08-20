From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 13/14] arm64: dts: meson-gxbb-p201: fix snps,
 reset-delays-us format
Date: Tue, 20 Aug 2019 22:23:34 +0200
Message-ID: <CAFBinCBPebpiKtMv3KuKRHsp3puZqAUeR0+V6d3k6gAX2ZNO5Q@mail.gmail.com>
References: <20190814142918.11636-1-narmstrong@baylibre.com> <20190814142918.11636-14-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190814142918.11636-14-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: khilman@baylibre.com, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 14, 2019 at 4:33 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> This fixes the following DT schemas check errors:
> meson-gxbb-p201.dt.yaml: ethernet@c9410000: snps,reset-delays-us: [[0, 10000, 1000000]] is too short
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
