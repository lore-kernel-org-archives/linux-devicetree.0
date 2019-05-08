From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v4 02/10] dt-bindings: doc: reflect new NVMEM
 of_get_mac_address behaviour
Date: Wed, 8 May 2019 13:48:50 +0200
Message-ID: <20190508114850.GC30557@lunn.ch>
References: <1556893635-18549-1-git-send-email-ynezz@true.cz>
 <1556893635-18549-3-git-send-email-ynezz@true.cz>
 <CAL_JsqLt6UFU_6bmh3Pc0taXUgMtAEV7kL7eZU13cLOjoakf=Q@mail.gmail.com>
 <20190508084152.GM81826@meh.true.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190508084152.GM81826@meh.true.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>
Cc: Rob Herring <robh+dt@kernel.org>, netdev <netdev@vger.kernel.org>, devicetree@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Mark Rutland <mark.rutland@arm.com>, Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Yisen Zhuang <yisen.zhuang@huawei.com>, Salil Mehta <salil.mehta@huawei.com>, Woojung Huh <woojung.huh@microchip.com>, Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Jassi Brar <jaswinder.singh@linaro.org>, Kalle Valo <kvalo@codeaurora.org>, Matthias Brugger <matthias.bgg@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Frank Rowand <frowand.list@gmail.com>, Srinivas Kandagatla <sr>
List-Id: devicetree@vger.kernel.org

> I've just tried to reword what was already there, anyway, did I understood
> your remark properly, would this be more appropriate?
> 
>  The MAC address will be determined using the optional properties defined in
>  ethernet.txt and only if efuse-mac is set to 0. If any of the optional MAC
>  address properties are not present, then the driver will use random MAC
>  address.

If _all_ of the optional ...

   Andrew
