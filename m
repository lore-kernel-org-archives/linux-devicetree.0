Return-Path: <robherring2@gmail.com>
Message-ID: <5b6cc31e.1c69fb81.84377.d022@mx.google.com>
Date: Thu, 09 Aug 2018 16:41:33 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/3] clk: s2mps11,s3c64xx: Add SPDX license identifiers
References: <20180807161713.28073-1-krzk@kernel.org> <20180807161713.28073-2-krzk@kernel.org>
In-Reply-To: <20180807161713.28073-2-krzk@kernel.org>
To: krzk@kernel.org
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, Mark Rutland <mark.rutland@arm.com>, Javier Martinez Canillas <javier@dowhile0.org>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi, this is an automated email from Rob's (experimental) review bot. I
found a couple of common problems with your patch. Please see below.

On Tue,  7 Aug 2018 18:17:12 +0200, Krzysztof Kozlowski wrote:
> Replace GPL v2.0 and v2.0+ license statements with SPDX license
> identifiers.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

The preferred subject prefix is "dt-bindings: <binding dir>: ...".

> ---
>  drivers/clk/clk-s2mps11.c                         | 21 +++++----------------
>  include/dt-bindings/clock/samsung,s2mps11.h       |  5 +----
>  include/dt-bindings/clock/samsung,s3c64xx-clock.h |  7 ++-----
>  3 files changed, 8 insertions(+), 25 deletions(-)
> 

DT bindings (including binding headers) should be a separate patch. See
Documentation/devicetree/bindings/submitting-patches.txt.
