From: Patrick Venture <venture@google.com>
Subject: Re: [PATCH] dt-bindings: Add vendor prefix for intersil
Date: Tue, 16 Apr 2019 08:26:28 -0700
Message-ID: <CAO=noty9DwJO9sU19C30zTAigkrOYbAhqjEFkxNv5+eZ1k7kQQ@mail.gmail.com>
References: <20190416145257.101945-1-venture@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190416145257.101945-1-venture@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Patrick Venture <venture@google.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: treding@nvidia.com, khilman@baylibre.com, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, heiko@sntech.de, martin.blumenstingl@googlemail.com, johan@kernel.org, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 16, 2019 at 7:53 AM Patrick Venture <venture@google.com> wrote:
>
> Add vendor prefix for intersil, known as Intersil, a subsidiary of
> Renesas Electronic Corporation.
>
> Signed-off-by: Patrick Venture <venture@google.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 8162b0eb4b50..ffc69a8bedaf 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -191,6 +191,7 @@ innolux     Innolux Corporation
>  inside-secure  INSIDE Secure
>  intel  Intel Corporation
>  intercontrol   Inter Control Group
> +intersil       Intersil

I see there's already isil for this.  I'll update my device-tree
patches to use isil.

>  invensense     InvenSense Inc.
>  inversepath    Inverse Path
>  iom    Iomega Corporation
> --
> 2.21.0.392.gf8f6787159e-goog
>
