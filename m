From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH 2/8] devicetree: vendor-prefixes: Add CompuLab to known vendors
Date: Tue, 17 Feb 2015 13:37:28 -0600
Message-ID: <CAL_JsqL=xiWoQPLDWOSY=nEWCr48B4kLKCLf7u1t6hKvng_hzw@mail.gmail.com>
References: <1424199129-22099-1-git-send-email-sebastian.hesselbarth@gmail.com>
 <1424199129-22099-3-git-send-email-sebastian.hesselbarth@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1424199129-22099-3-git-send-email-sebastian.hesselbarth@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, Gabriel Dobato <dobatog@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 17, 2015 at 12:52 PM, Sebastian Hesselbarth
<sebastian.hesselbarth@gmail.com> wrote:
> This adds "compulab" as a vendor-prefix for CompuLab (compulab.co.il),
> an Israeli company that builds ARM-based SoMs and CoMs.
>
> Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>

Acked-by: Rob Herring <robh@kernel.org>

> ---
> Cc: Jason Cooper <jason@lakedaemon.net>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Gregory Clement <gregory.clement@free-electrons.com>
> Cc: Gabriel Dobato <dobatog@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Pawel Moll <pawel.moll@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
> Cc: Kumar Gala <galak@codeaurora.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index d443279c95dc..2de628532d4b 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -35,6 +35,7 @@ chrp  Common Hardware Reference Platform
>  chunghwa       Chunghwa Picture Tubes Ltd.
>  cirrus Cirrus Logic, Inc.
>  cnm    Chips&Media, Inc.
> +compulab       CompuLab
>  cortina        Cortina Systems, Inc.
>  crystalfontz   Crystalfontz America, Inc.
>  dallas Maxim Integrated Products (formerly Dallas Semiconductor)
> --
> 2.1.0
>
