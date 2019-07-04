From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v2 0/4] net: dsa: Add Vitesse VSC73xx parallel mode
Date: Thu, 04 Jul 2019 12:34:47 -0700 (PDT)
Message-ID: <20190704.123447.693100990166600946.davem@davemloft.net>
References: <20190703171924.31801-1-paweldembicki@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190703171924.31801-1-paweldembicki@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: paweldembicki@gmail.com
Cc: linus.walleij@linaro.org, andrew@lunn.ch, vivien.didelot@gmail.com, f.fainelli@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Pawel Dembicki <paweldembicki@gmail.com>
Date: Wed,  3 Jul 2019 19:19:20 +0200

> Main goal of this patch series is to add support for parallel bus in
> Vitesse VSC73xx switches. Existing driver supports only SPI mode.
> 
> Second change is needed for devices in unmanaged state.

Please respin with the documentation description changes suggested
in the review for this series.

Thanks.
