From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH 1/2] dt-binding: add vendor prefix for SolidRun
Date: Wed, 28 May 2014 17:50:50 -0500
Message-ID: <CAL_JsqK-iWc8J6qeZ5LLsS-2-9UP2od6bZwGDUMqpaB7EUEs0A@mail.gmail.com>
References: <1401140009-31505-1-git-send-email-sebastian.hesselbarth@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1401140009-31505-1-git-send-email-sebastian.hesselbarth@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Randy Dunlap <rdunlap@infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 26, 2014 at 4:33 PM, Sebastian Hesselbarth
<sebastian.hesselbarth@gmail.com> wrote:
> SolidRun is a company from Israel producing small-sized home-media
> computers like the Marvell Dove based CuBox and Freescale IMX based
> CuBox-i. Document the missing vendor prefix.
>
> Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> ---
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Pawel Moll <pawel.moll@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
> Cc: Kumar Gala <galak@codeaurora.org>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-doc@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org

Acked-by: Rob Herring <robh@kernel.org>

> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 0f01c9bf19c8..f0c046aff55b 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -102,6 +102,7 @@ sii Seiko Instruments, Inc.
>  sirf   SiRF Technology, Inc.
>  smsc   Standard Microsystems Corporation
>  snps   Synopsys, Inc.
> +solidrun       SolidRun
>  spansion       Spansion Inc.
>  st     STMicroelectronics
>  ste    ST-Ericsson
> --
> 1.9.1
>
