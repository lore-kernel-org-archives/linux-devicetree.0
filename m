From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/3] devicetree: add vendor prefix for Aurora VLSI
Date: Thu, 22 Oct 2015 09:35:36 -0500
Message-ID: <CAL_JsqJkUEDoVf1n-X2kXsTVS5-ojO=deurSLcpuL_BQVAjDmQ@mail.gmail.com>
References: <1445522558-5808-1-git-send-email-mans@mansr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445522558-5808-1-git-send-email-mans@mansr.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mans Rullgard <mans@mansr.com>
Cc: Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 22, 2015 at 9:02 AM, Mans Rullgard <mans@mansr.com> wrote:
> This adds the vendor prefix "aurora" for Aurora VLSI, Inc.
>
> Signed-off-by: Mans Rullgard <mans@mansr.com>

Acked-by: Rob Herring <robh@kernel.org>

> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 82d2ac9..380ce10 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -30,6 +30,7 @@ artesyn       Artesyn Embedded Technologies Inc.
>  asahi-kasei    Asahi Kasei Corp.
>  atmel  Atmel Corporation
>  auo    AU Optronics Corporation
> +aurora Aurora VLSI, Inc.
>  avago  Avago Technologies
>  avic   Shanghai AVIC Optoelectronics Co., Ltd.
>  axis   Axis Communications AB
> --
> 2.5.3
>
