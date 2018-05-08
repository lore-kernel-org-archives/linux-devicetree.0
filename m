From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH 2/2] kbuild: disable new dtc graph and unit-address warnings
Date: Wed, 9 May 2018 08:51:43 +0900
Message-ID: <CAK7LNAQnFrZNJetQRrB_KuV_=oRneSFXj-KJ=SK6ZTZWjdn1tg@mail.gmail.com>
References: <20180508135150.27762-1-robh@kernel.org> <20180508135150.27762-2-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180508135150.27762-2-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

2018-05-08 22:51 GMT+09:00 Rob Herring <robh@kernel.org>:
> dtc gained some new warnings for OF graphs and unique unit addresses,
> but they are currently much too noisy. So turn off
> 'graph_child_address', 'graph_port', and 'unique_unit_address' warnings
> by default. They can be enabled by building dtbs with W=1.
>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Michal Marek <michal.lkml@markovi.net>
> Cc: linux-kbuild@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> I plan to take this via DT tree as it is dependent on a dtc update in
> patch 1.


Yes, please do so.

Acked-by: Masahiro Yamada <yamada.masahiro@socionext.com>





>  scripts/Makefile.lib | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 5af34a2b0cd9..1bb594fcfe12 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -251,6 +251,9 @@ DTC_FLAGS += -Wno-unit_address_vs_reg \
>         -Wno-unit_address_format \
>         -Wno-avoid_unnecessary_addr_size \
>         -Wno-alias_paths \
> +       -Wno-graph_child_address \
> +       -Wno-graph_port \
> +       -Wno-unique_unit_address \
>         -Wno-pci_device_reg
>  endif
>
> --
> 2.17.0
>



-- 
Best Regards
Masahiro Yamada
