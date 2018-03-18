Return-Path: <robherring2@gmail.com>
Date: Sun, 18 Mar 2018 07:49:17 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 07/14] mmc: dt-bindings: add MMC support to JZ4740 SoC
Message-ID: <20180318124917.sfptnnnqsmsxewdj@rob-hp-laptop>
References: <20180312215554.20770-1-ezequiel@vanguardiasur.com.ar>
 <20180312215554.20770-8-ezequiel@vanguardiasur.com.ar>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180312215554.20770-8-ezequiel@vanguardiasur.com.ar>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Paul Cercueil <paul@crapouillou.net>, linux-mmc@vger.kernel.org, linux-mips@linux-mips.org, James Hogan <jhogan@kernel.org>, Ezequiel Garcia <ezequiel@collabora.co.uk>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, Mar 12, 2018 at 06:55:47PM -0300, Ezequiel Garcia wrote:
> From: Ezequiel Garcia <ezequiel@collabora.co.uk>
> 
> Add the devicetree binding for JZ4740/JZ4780 SoC.

... SoC MMC/SD controller.

> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.co.uk>
> ---
>  Documentation/devicetree/bindings/mmc/jz4740.txt | 38 ++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mmc/jz4740.txt

Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>
