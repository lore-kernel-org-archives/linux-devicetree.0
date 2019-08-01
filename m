From: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: interrupt-controller: msi: Correct
 msi-controller@c's reg
Date: Thu, 1 Aug 2019 17:53:26 +0800
Message-ID: <CAEUhbmX2LXST-5eDD_UQJP6-XqKPEByVdnQ_KqFM-fR_dH6pyQ@mail.gmail.com>
References: <1564306219-17439-1-git-send-email-bmeng.cn@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1564306219-17439-1-git-send-email-bmeng.cn@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, devicetree <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jul 28, 2019 at 5:30 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> The base address of msi-controller@c should be set to c.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> ---
>
>  Documentation/devicetree/bindings/interrupt-controller/msi.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/msi.txt b/Documentation/devicetree/bindings/interrupt-controller/msi.txt
> index c60c034..c20b51d 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/msi.txt
> +++ b/Documentation/devicetree/bindings/interrupt-controller/msi.txt
> @@ -98,7 +98,7 @@ Example
>         };
>
>         msi_c: msi-controller@c {
> -               reg = <0xb 0xf00>;
> +               reg = <0xc 0xf00>;
>                 compatible = "vendor-b,another-controller";
>                 msi-controller;
>                 /* Each device has some unique ID */
> --

Ping?
