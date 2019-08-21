From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2 08/14] arm64: dts: meson-gxl: fix internal phy compatible
Date: Wed, 21 Aug 2019 23:16:08 +0200
Message-ID: <CAFBinCDd7fnUxysHFK7DTSRwYOO788TRPtB=CSHRkGVSXW6xSg@mail.gmail.com>
References: <20190821142043.14649-1-narmstrong@baylibre.com> <20190821142043.14649-9-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190821142043.14649-9-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: khilman@baylibre.com, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 21, 2019 at 4:23 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> This fixes the following DT schemas check errors:
> meson-gxl-s805x-libretech-ac.dt.yaml: ethernet-phy@8: compatible: ['ethernet-phy-id0181.4400', 'ethernet-phy-ieee802.3-c22'] is not valid under any of the given schemas
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
based on the explanation in v1 we can program any arbitrary PHY ID so
Jerome's argument to list the PHY ID here applies
with that:
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
