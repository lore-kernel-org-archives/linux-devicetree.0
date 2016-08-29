From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v3 0/5] meson: Meson8b and GXBB DWMAC glue driver
Date: Sun, 28 Aug 2016 23:40:08 -0400 (EDT)
Message-ID: <20160828.234008.445367966910278179.davem@davemloft.net>
References: <20160820093538.9707-1-martin.blumenstingl@googlemail.com>
        <20160828161637.9941-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20160828161637.9941-1-martin.blumenstingl@googlemail.com>
Sender: netdev-owner@vger.kernel.org
To: martin.blumenstingl@googlemail.com
Cc: linux-amlogic@lists.infradead.org, khilman@baylibre.com, carlo@caione.org, mturquette@baylibre.com, peppe.cavallaro@st.com, alexandre.torgue@st.com, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, sboyd@codeaurora.org, manabian@gmail.com, arnd@arndb.de
List-Id: devicetree@vger.kernel.org

From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 28 Aug 2016 18:16:32 +0200

> This adds a DWMAC glue driver for the PRG_ETHERNET registers found in
> Meson8b and GXBB SoCs. Based on the "old" meson6b-dwmac glue driver
> the register layout is completely different.
> Thus I introduced a separate driver.
> 
> Changes since v2:
> - fixed unloading the glue driver when built as module. This pulls in a
>   patch from Joachim Eastwood (thanks) to get our private data structure
>   (bsp_priv).

This doesn't apply cleanly at all to the net-next tree, so I have
no idea where you expect these changes to be applied.
