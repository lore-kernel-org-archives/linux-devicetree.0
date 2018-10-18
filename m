From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: uniphier: move cache-uniphier.txt to
 vendor directory
Date: Thu, 18 Oct 2018 12:11:21 +0900
Message-ID: <CAK7LNAQ+j4pRxCorfyf23L8ZRXV_mF-uQd3ab7rwP9vKktsE+Q@mail.gmail.com>
References: <1539318324-4938-1-git-send-email-yamada.masahiro@socionext.com>
 <1539318324-4938-2-git-send-email-yamada.masahiro@socionext.com> <20181017200022.GA14782@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181017200022.GA14782@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, DTML <devicetree@vger.kernel.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Masami Hiramatsu <mhiramat@kernel.org>, Jassi Brar <jaswinder.singh@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Hi Rob,


On Thu, Oct 18, 2018 at 5:01 AM Rob Herring <robh@kernel.org> wrote:
>
> On Fri, 12 Oct 2018 13:25:24 +0900, Masahiro Yamada wrote:
> > Now, the Socionext vendor directory is available at
> > Documentation/devicetree/bindings/arm/socionext/
> >
> > Move cache-uniphier.txt over to it.
> >
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > ---
> >
> > Changes in v2:
> >   - New patch
> >
> >  .../devicetree/bindings/arm/{uniphier => socionext}/cache-uniphier.txt    | 0
> >  1 file changed, 0 insertions(+), 0 deletions(-)
> >  rename Documentation/devicetree/bindings/arm/{uniphier => socionext}/cache-uniphier.txt (100%)
> >
>
> Reviewed-by: Rob Herring <robh@kernel.org>


Thanks for your review!

You gave your Reviewed-by twice to 2/2,
but nothing to 1/2.

Is the first patch under review?
Or, did you accidentally do that
instead of replying to each of the two?


-- 
Best Regards
Masahiro Yamada
