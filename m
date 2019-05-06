From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v4 07/10] net: wireless: support of_get_mac_address new ERR_PTR error
Date: Mon, 06 May 2019 10:59:29 +0300
Message-ID: <878svkvwri.fsf@codeaurora.org>
References: <1556893635-18549-1-git-send-email-ynezz@true.cz>
        <1556893635-18549-8-git-send-email-ynezz@true.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1556893635-18549-8-git-send-email-ynezz@true.cz> ("Petr
        \=\?utf-8\?Q\?\=C5\=A0tetiar\=22's\?\= message of "Fri, 3 May 2019 16:27:12 +0200")
Sender: linux-kernel-owner@vger.kernel.org
To: Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, QCA ath9k Development <ath9k-devel@qca.qualcomm.com>, "David S. Miller" <davem@davemloft.net>, Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Stanislaw Gruszka <sgruszka@redhat.com>, Helmut Schaa <helmut.schaa@googlemail.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Frank Rowand <frowand.list@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Maxime Ripard <maxime.ripard@bootlin.com>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Petr =C5=A0tetiar <ynezz@true.cz> writes:

> There was NVMEM support added to of_get_mac_address, so it could now retu=
rn
> ERR_PTR encoded error values, so we need to adjust all current users of
> of_get_mac_address to this new fact.
>
> Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
> ---
>
>  Changes since v3:
>
>   * IS_ERR_OR_NULL -> IS_ERR
>
>  drivers/net/wireless/ath/ath9k/init.c          | 2 +-
>  drivers/net/wireless/mediatek/mt76/eeprom.c    | 2 +-
>  drivers/net/wireless/ralink/rt2x00/rt2x00dev.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

Via which tree is this supposed to go? In case something else than my
wireless-drivers-next:

Acked-by: Kalle Valo <kvalo@codeaurora.org>

--=20
Kalle Valo
