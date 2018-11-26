From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH v3 2/2] dt-bindings: uniphier: move cache-uniphier.txt to
 vendor directory
Date: Tue, 27 Nov 2018 00:50:32 +0900
Message-ID: <CAK7LNAQ9D2V1bYJxuiuCAOW2yfXrqbHSfODyVTkj4oaW4CzSaA@mail.gmail.com>
References: <1539945019-24950-1-git-send-email-yamada.masahiro@socionext.com> <1539945019-24950-3-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1539945019-24950-3-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: arm-soc <arm@kernel.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 19, 2018 at 7:33 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Now, the Socionext vendor directory is available at
> Documentation/devicetree/bindings/arm/socionext/
>
> Move cache-uniphier.txt over to it.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Applied to linux-uniphier.



> Changes in v3: None
> Changes in v2:
>   - New patch
>
>  .../devicetree/bindings/arm/{uniphier => socionext}/cache-uniphier.txt    | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename Documentation/devicetree/bindings/arm/{uniphier => socionext}/cache-uniphier.txt (100%)
>
> diff --git a/Documentation/devicetree/bindings/arm/uniphier/cache-uniphier.txt b/Documentation/devicetree/bindings/arm/socionext/cache-uniphier.txt
> similarity index 100%
> rename from Documentation/devicetree/bindings/arm/uniphier/cache-uniphier.txt
> rename to Documentation/devicetree/bindings/arm/socionext/cache-uniphier.txt
> --
> 2.7.4
>


-- 
Best Regards
Masahiro Yamada
