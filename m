From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] of: add vendor prefix for Socionext Inc.
Date: Fri, 21 Aug 2015 17:04:11 +0900
Message-ID: <CAK7LNAQbO153yeLZrHepNtFO66aGk5wAdKnHO5sRHwT9WDhmxw@mail.gmail.com>
References: <1438163133-4539-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438163133-4539-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, Grant Likely <grant.likely@linaro.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Arnd Bergmann <arnd@arndb.de>, Hayato Suzuki <hytszk@gmail.com>, Thierry Reding <treding@nvidia.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Arnaud Ebalard <arno@natisbad.org>, Rob Herring <robh+dt@kernel.org>, Antony Pavlov <antonynpavlov@gmail.com>, Pawel Moll <pawel.moll@arm.com>, Lee Jones <lee.jones@linaro.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Hi Grant,

I guess this patch should go in thru the devicetree subsystem.
(or ARM-SOC?)

It is really trivial, so could you apply it for 4.3-rc1, please?


2015-07-29 18:45 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index d444757..5ab8f6b 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -192,6 +192,7 @@ sitronix    Sitronix Technology Corporation
>  skyworks       Skyworks Solutions, Inc.
>  smsc   Standard Microsystems Corporation
>  snps   Synopsys, Inc.
> +socionext      Socionext Inc.
>  solidrun       SolidRun
>  solomon        Solomon Systech Limited
>  sony   Sony Corporation
> --
> 1.9.1
>


-- 
Best Regards
Masahiro Yamada
