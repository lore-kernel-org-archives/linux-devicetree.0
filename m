From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v2 0/7] IP101GR: devicetree based configuration of
 SEL_INTR32
Date: Sun, 18 Nov 2018 16:16:40 -0800 (PST)
Message-ID: <20181118.161640.141528330634887893.davem@davemloft.net>
References: <20181118212359.32414-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181118212359.32414-1-martin.blumenstingl@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: martin.blumenstingl@googlemail.com
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, f.fainelli@gmail.com, andrew@lunn.ch, mark.rutland@arm.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 18 Nov 2018 22:23:52 +0100

> The IP101GR is a 32-pin QFN package variant of the IP101G/IP101GA
> Ethernet PHY. Due to it's limited amount of pins the RXER (receive
> error) and INTR32 (interrupt) functions share pin 21.
 ...

Series applied to net-next, thank you.
