From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 13/18] dt-bindings: vendor: Add Huarui Lighting
Date: Fri, 14 Jul 2017 15:53:40 +0800
Message-ID: <CAGb2v66hWsuQQQQXJwKD-1aub_1aysQ_A9Kn2Ka5WSFMDYHN0Q@mail.gmail.com>
References: <cover.a5e7407c191c66e264164d017f64582039c56acb.1499955058.git-series.maxime.ripard@free-electrons.com>
 <5b7ae43738fb5ea2fb1ebebddfc75d401da94677.1499955058.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5b7ae43738fb5ea2fb1ebebddfc75d401da94677.1499955058.git-series.maxime.ripard@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Chen-Yu Tsai <wens@csie.org>, dri-devel <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, Boris Brezillon <boris.brezillon@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 13, 2017 at 10:13 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> Huarui Lighting makes display panel, add it to the list of panels.

I could not find any information on "Huarui Lighting" within the
context of LCD panels. The company I found makes LED lighting
fixtures, floodlights, and high power LED drivers.

This might not be a legitimate branding?

ChenYu

>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index afbb47ce50dd..cc5850a325f8 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -142,6 +142,7 @@ holt        Holt Integrated Circuits, Inc.
>  honeywell      Honeywell
>  hp     Hewlett Packard
>  holtek Holtek Semiconductor, Inc.
> +huarui Huarui Lighting Co. Ltd
>  hwacom HwaCom Systems Inc.
>  i2se   I2SE GmbH
>  ibm    International Business Machines (IBM)
> --
> git-series 0.9.1
