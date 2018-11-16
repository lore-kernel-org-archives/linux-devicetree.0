From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Add Kishon as maintainer of PHY bindings
Date: Fri, 16 Nov 2018 14:20:45 -0600
Message-ID: <CAL_JsqJn2EOGJaM9saoYYnbZ+GrEMQWgp_1kSq6W9HX1GnGVWw@mail.gmail.com>
References: <20181018133105.3720-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181018133105.3720-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 18, 2018 at 8:31 AM Rob Herring <robh@kernel.org> wrote:
>
> DT bindings normally go in via subsystem maintainers, so add PHY
> bindings under generic PHY framework.
>
> Reported-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> Signed-off-by: Rob Herring <robh@kernel.org>

Ping? Kishon, any objection?

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9ad052aeac39..b01e77ae79c4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6132,6 +6132,7 @@ T:        git git://git.kernel.org/pub/scm/linux/kernel/git/kishon/linux-phy.git
>  S:     Supported
>  F:     drivers/phy/
>  F:     include/linux/phy/
> +F:     Documentation/devicetree/bindings/phy/
>
>  GENERIC PINCTRL I2C DEMULTIPLEXER DRIVER
>  M:     Wolfram Sang <wsa+renesas@sang-engineering.com>
> --
> 2.17.1
>
