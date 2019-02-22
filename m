From: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v2] dt-bindings: Add vendor prefix for techstar
Date: Sat, 23 Feb 2019 00:56:57 +0530
Message-ID: <CAMty3ZCSAAYmMn6x2jTpUWtY94fhX8HRAOydedFjjWNfKQoJsg@mail.gmail.com>
References: <20190212112744.2332-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190212112744.2332-1-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Rob,

On Tue, Feb 12, 2019 at 4:57 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> Add vendor prefix for techstar, known as
> Shenzhen Techstar Electronics Co., Ltd. a known producer for LCD modules.
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v2:
> - rebase for master
>
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 7eae7a95ab2a..a5ad57eaee20 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -397,6 +397,7 @@ tcl Toby Churchill Ltd.
>  technexion     TechNexion
>  technologic    Technologic Systems
>  tempo  Tempo Semiconductor
> +techstar       Shenzhen Techstar Electronics Co., Ltd.
>  terasic        Terasic Inc.
>  thine  THine Electronics, Inc.
>  ti     Texas Instruments
> --

Can you apply this, the relevant driver is mainline already. [1]

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=849b2e3ff9698226ab91e034d52cbb1da92a5b4c
