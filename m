From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCHv1 0/3] Odroid c2 missing regulator linking
Date: Thu, 29 Aug 2019 10:28:02 +0200
Message-ID: <8c40f334-c723-b524-857c-73734b7d0827@baylibre.com>
References: <20190828202723.1145-1-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190828202723.1145-1-linux.amoon@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>, Rob Herring <robh+dt@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 28/08/2019 22:27, Anand Moon wrote:
> Below small changes help re-configure or fix missing inter linking
> of regulator node.
> 
> Changes based top on my prevoius series.

For the serie:
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

> 
> [0] https://patchwork.kernel.org/cover/11113091/
> 
> TOOD: Add support for DVFS GXBB odroid board in next series.

I'm curious how you will do this !

> 
> Best Regards
> -Anand
> 
> Anand Moon (3):
>   arm64: dts: meson: odroid-c2: Add missing regulator linked to P5V0
>     regulator
>   arm64: dts: meson: odroid-c2: Add missing regulator linked to
>     VDDIO_AO3V3 regulator
>   arm64: dts: meson: odroid-c2: Add missing regulator linked to HDMI
>     supply
> 
>  .../boot/dts/amlogic/meson-gxbb-odroidc2.dts  | 44 ++++++++++++++++---
>  1 file changed, 38 insertions(+), 6 deletions(-)
> 
