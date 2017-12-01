From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: Re: [PATCH 3/3] MAINTAINERS: Add entry for Socionext ethernet driver
Date: Fri, 1 Dec 2017 09:14:12 +0000
Message-ID: <CAKv+Gu_Q25irw3-BOO_T17EMV9rFyMRzKphhATqQNX=QtqGh_w@mail.gmail.com>
References: <1512058416-15968-1-git-send-email-jassisinghbrar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1512058416-15968-1-git-send-email-jassisinghbrar@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: "<netdev@vger.kernel.org>" <netdev@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, Arnd Bergmann <arnd.bergmann@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jassi Brar <jaswinder.singh@linaro.org>
List-Id: devicetree@vger.kernel.org

On 30 November 2017 at 16:13,  <jassisinghbrar@gmail.com> wrote:
> From: Jassi Brar <jaswinder.singh@linaro.org>
>
> Add entry for the Socionext Netsec controller driver and DT bindings.
>
> Signed-off-by: Jassi Brar <jaswinder.singh@linaro.org>

Acked-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>

(with Joe's comment addressed)

> ---
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index aa71ab52f..aed9d32 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12617,6 +12617,14 @@ F:     drivers/md/raid*
>  F:     include/linux/raid/
>  F:     include/uapi/linux/raid/
>
> +SOCIONEXT (SNI) NETSEC NETWORK DRIVER
> +M:     Jassi Brar <jaswinder.singh@linaro.org>
> +L:     netdev@vger.kernel.org
> +S:     Supported
> +S:     Maintained
> +F:     drivers/net/ethernet/socionext/netsec.c
> +F:     Documentation/devicetree/bindings/net/socionext-netsec.txt
> +
>  SONIC NETWORK DRIVER
>  M:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
>  L:     netdev@vger.kernel.org
> --
> 2.7.4
>
