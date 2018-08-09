Return-Path: <robherring2@gmail.com>
Message-ID: <5b6cc31f.1c69fb81.183a5.f380@mx.google.com>
Date: Thu, 09 Aug 2018 16:41:34 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] regulator: maxim: Add SPDX license identifiers
References: <20180807161826.2222-1-krzk@kernel.org>
In-Reply-To: <20180807161826.2222-1-krzk@kernel.org>
To: krzk@kernel.org
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Javier Martinez Canillas <javier@dowhile0.org>, Sangbeom Kim <sbkim73@samsung.com>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi, this is an automated email from Rob's (experimental) review bot. I
found a couple of common problems with your patch. Please see below.

On Tue,  7 Aug 2018 18:18:25 +0200, Krzysztof Kozlowski wrote:
> Replace GPL v2.0 and v2.0+ license statements with SPDX license
> identifiers.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

The preferred subject prefix is "dt-bindings: <binding dir>: ...".

> ---
>  drivers/regulator/max14577-regulator.c         | 22 +++++------------
>  drivers/regulator/max77686-regulator.c         | 32 +++++++-----------------
>  drivers/regulator/max77693-regulator.c         | 32 +++++++-----------------
>  drivers/regulator/max77802-regulator.c         | 34 +++++++++-----------------
>  drivers/regulator/max8997-regulator.c          | 30 ++++++-----------------
>  drivers/regulator/max8998.c                    | 28 ++++++---------------
>  include/dt-bindings/regulator/maxim,max77802.h |  5 +---
>  7 files changed, 52 insertions(+), 131 deletions(-)
> 

DT bindings (including binding headers) should be a separate patch. See
Documentation/devicetree/bindings/submitting-patches.txt.
