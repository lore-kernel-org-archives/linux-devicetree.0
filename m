From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH V3 0/2] add Qualcomm QCA7000 ethernet driver
Date: Mon, 29 Sep 2014 00:24:45 -0400 (EDT)
Message-ID: <20140929.002445.1795924959329545473.davem@davemloft.net>
References: <1411770081-20995-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1411770081-20995-1-git-send-email-stefan.wahren@i2se.com>
Sender: netdev-owner@vger.kernel.org
To: stefan.wahren@i2se.com
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, f.fainelli@gmail.com, netdev@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Stefan Wahren <stefan.wahren@i2se.com>
Date: Fri, 26 Sep 2014 22:21:19 +0000

> This patch series adds support for the Qualcomm QCA7000 Homeplug GreenPHY.
> The QCA7000 is serial-to-powerline bridge with two interfaces: UART and SPI.
> These patches handles only the last one, with an Ethernet over SPI protocol
> driver.

Applied to net-next, thanks.
