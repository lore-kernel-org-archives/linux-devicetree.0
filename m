From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4 02/10] dt-bindings: doc: reflect new NVMEM
 of_get_mac_address behaviour
Date: Tue, 7 May 2019 11:44:57 -0500
Message-ID: <CAL_JsqLt6UFU_6bmh3Pc0taXUgMtAEV7kL7eZU13cLOjoakf=Q@mail.gmail.com>
References: <1556893635-18549-1-git-send-email-ynezz@true.cz> <1556893635-18549-3-git-send-email-ynezz@true.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1556893635-18549-3-git-send-email-ynezz@true.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Petr_=C5=A0tetiar?= <ynezz@true.cz>
Cc: netdev <netdev@vger.kernel.org>, devicetree@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Yisen Zhuang <yisen.zhuang@huawei.com>, Salil Mehta <salil.mehta@huawei.com>, Woojung Huh <woojung.huh@microchip.com>, Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Jassi Brar <jaswinder.singh@linaro.org>, Kalle Valo <kvalo@codeaurora.org>, Matthias Brugger <matthias.bgg@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Frank Rowand <frowand.list@gmail.com>, Srinivas Kandagatla <sriniv>
List-Id: devicetree@vger.kernel.org

On Fri, May 3, 2019 at 9:27 AM Petr =C5=A0tetiar <ynezz@true.cz> wrote:
>
> As of_get_mac_address now supports NVMEM under the hood, we need to updat=
e
> the bindings documentation with the new nvmem-cell* properties, which wou=
ld
> mean copy&pasting a lot of redundant information to every binding
> documentation currently referencing some of the MAC address properties.
>
> So I've just removed all the references to the optional MAC address
> properties and replaced them with the small note referencing
> net/ethernet.txt file.
>
> Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
> ---
>
>  Changes since v2:
>
>  * replaced only MAC address related optional properties with a text
>    referencing ethernet.txt
>
>  Documentation/devicetree/bindings/net/altera_tse.txt           |  5 ++--=
-
>  Documentation/devicetree/bindings/net/amd-xgbe.txt             |  5 +++-=
-
>  Documentation/devicetree/bindings/net/brcm,amac.txt            |  4 ++--
>  Documentation/devicetree/bindings/net/cpsw.txt                 |  4 +++-
>  Documentation/devicetree/bindings/net/davinci_emac.txt         |  5 +++-=
-
>  Documentation/devicetree/bindings/net/dsa/dsa.txt              |  5 ++--=
-
>  Documentation/devicetree/bindings/net/ethernet.txt             |  6 ++++=
--
>  Documentation/devicetree/bindings/net/hisilicon-femac.txt      |  4 +++-
>  .../devicetree/bindings/net/hisilicon-hix5hd2-gmac.txt         |  4 +++-
>  Documentation/devicetree/bindings/net/keystone-netcp.txt       | 10 ++++=
+-----
>  Documentation/devicetree/bindings/net/macb.txt                 |  5 ++--=
-
>  Documentation/devicetree/bindings/net/marvell-pxa168.txt       |  4 +++-
>  Documentation/devicetree/bindings/net/microchip,enc28j60.txt   |  3 ++-
>  Documentation/devicetree/bindings/net/microchip,lan78xx.txt    |  5 ++--=
-
>  Documentation/devicetree/bindings/net/qca,qca7000.txt          |  4 +++-
>  Documentation/devicetree/bindings/net/samsung-sxgbe.txt        |  4 +++-
>  .../devicetree/bindings/net/snps,dwc-qos-ethernet.txt          |  5 +++-=
-
>  .../devicetree/bindings/net/socionext,uniphier-ave4.txt        |  4 ++--
>  Documentation/devicetree/bindings/net/socionext-netsec.txt     |  5 +++-=
-
>  .../devicetree/bindings/net/wireless/mediatek,mt76.txt         |  5 +++-=
-
>  Documentation/devicetree/bindings/net/wireless/qca,ath9k.txt   |  4 ++--
>  21 files changed, 58 insertions(+), 42 deletions(-)

[...]

> diff --git a/Documentation/devicetree/bindings/net/keystone-netcp.txt b/D=
ocumentation/devicetree/bindings/net/keystone-netcp.txt
> index 04ba1dc..3a65aab 100644
> --- a/Documentation/devicetree/bindings/net/keystone-netcp.txt
> +++ b/Documentation/devicetree/bindings/net/keystone-netcp.txt
> @@ -135,14 +135,14 @@ Optional properties:
>                 are swapped.  The netcp driver will swap the two DWORDs
>                 back to the proper order when this property is set to 2
>                 when it obtains the mac address from efuse.
> -- local-mac-address:   the driver is designed to use the of_get_mac_addr=
ess api
> -                       only if efuse-mac is 0. When efuse-mac is 0, the =
MAC
> -                       address is obtained from local-mac-address. If th=
is
> -                       attribute is not present, then the driver will us=
e a
> -                       random MAC address.
>  - "netcp-device label":        phandle to the device specification for e=
ach of NetCP
>                         sub-module attached to this interface.
>
> +The MAC address will be determined using the optional properties defined=
 in
> +ethernet.txt, as provided by the of_get_mac_address API and only if efus=
e-mac

Don't make references to Linux in bindings. You can talk about
expectations of client programs (e.g Linux, u-boot, BSD, etc.) though.

Rob
