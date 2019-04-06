From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/3] media: dt-bindings: media: meson-ao-cec: Add G12A  AO-CEC-B Compatible
Date: Sat, 06 Apr 2019 01:06:04 -0500
Message-ID: <5ca841ce.1c69fb81.b2f88.e449@mx.google.com>
References: <20190401081959.16474-1-narmstrong@baylibre.com> <20190401081959.16474-2-narmstrong@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190401081959.16474-2-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: hverkuil@xs4all.nl, mchehab@kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon,  1 Apr 2019 10:19:57 +0200, Neil Armstrong wrote:
> The Amlogic G12A embeds a second CEC controller named AO-CEC-B, and
> the other one is AO-CEC-A described by the current bindings.
> 
> The register interface is very close but the internal architecture
> is totally different.
> 
> The other difference is the clock source, the AO-CEC-B takes the
> "oscin", the Always-On Oscillator clock, as input and embeds a
> dual-divider clock divider to provide the precise 32768Hz base
> clock for CEC communication.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../devicetree/bindings/media/meson-ao-cec.txt      | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
