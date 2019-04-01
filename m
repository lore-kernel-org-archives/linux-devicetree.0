From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: arm: correct dt_binding_check parse error
Date: Mon, 1 Apr 2019 01:07:16 -0500
Message-ID: <CAL_JsqL7ncaz+D_xp17tQfjRp00Y5emnB4zyf-Ms4j8bdwb4Bw@mail.gmail.com>
References: <20190331024240.3012-1-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190331024240.3012-1-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>, Sugaya Taichi <sugaya.taichi@socionext.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Sat, Mar 30, 2019 at 9:42 PM Brian Masney <masneyb@onstation.org> wrote:
>
> 'make dt_binding_check' fails with the following error:
>
>   Documentation/devicetree/bindings/arm/cpus.yaml:  while scanning a
>   plain scalar
>     in "<unicode string>", line 231, column 19
>   found a tab character that violates indentation
>     in "<unicode string>", line 232, column 1
>   make[1]: *** [Documentation/devicetree/bindings/Makefile:12:
>     Documentation/devicetree/bindings/arm/cpus.example.dts] Error 1
>
> Correct the parse error by replacing the tabs with spaces to keep
> 'make dt_binding_check' happy.

There's already a patch for this. Just waiting on arm-soc guys to apply it.

Rob
