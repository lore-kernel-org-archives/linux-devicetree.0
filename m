From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v3 0/4] net: dsa: Add Vitesse VSC73xx parallel mode
Date: Sun, 07 Jul 2019 14:16:58 -0700 (PDT)
Message-ID: <20190707.141658.287409083361510441.davem@davemloft.net>
References: <20190704222907.2888-1-paweldembicki@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190704222907.2888-1-paweldembicki@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: paweldembicki@gmail.com
Cc: linus.walleij@linaro.org, andrew@lunn.ch, vivien.didelot@gmail.com, f.fainelli@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Pawel Dembicki <paweldembicki@gmail.com>
Date: Fri,  5 Jul 2019 00:29:03 +0200

> Main goal of this patch series is to add support for CPU attached parallel
> bus in Vitesse VSC73xx switches. Existing driver supports only SPI mode.
> 
> Second change is needed for devices in unmanaged state.
> 
> V3:
> - fix commit messages and descriptions about memory-mapped I/O mode
> 
> V2:
> - drop changes in compatible strings
> - make changes less invasive
> - drop mutex in platform part and move mutex from core to spi part
> - fix indentation 
> - fix devm_ioremap_resource result check
> - add cover letter 

Series applied to net-next, thank you.
