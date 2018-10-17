From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: uniphier: move cache-uniphier.txt to
 vendor directory
Date: Wed, 17 Oct 2018 14:59:09 -0500
Message-ID: <20181017195909.GA13070@bogus>
References: <1539318324-4938-1-git-send-email-yamada.masahiro@socionext.com>
 <1539318324-4938-2-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1539318324-4938-2-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Masami Hiramatsu <mhiramat@kernel.org>, Jassi Brar <jaswinder.singh@linaro.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Fri, 12 Oct 2018 13:25:24 +0900, Masahiro Yamada wrote:
> Now, the Socionext vendor directory is available at
> Documentation/devicetree/bindings/arm/socionext/
> 
> Move cache-uniphier.txt over to it.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
> Changes in v2:
>   - New patch
> 
>  .../devicetree/bindings/arm/{uniphier => socionext}/cache-uniphier.txt    | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename Documentation/devicetree/bindings/arm/{uniphier => socionext}/cache-uniphier.txt (100%)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
