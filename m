From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] net: dsa: add support for ksz9897 ethernet switch
Date: Fri, 17 Aug 2018 09:09:37 -0600
Message-ID: <20180817150937.GA20514@rob-hp-laptop>
References: <1534348283-12790-1-git-send-email-prabhakar.csengg@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1534348283-12790-1-git-send-email-prabhakar.csengg@gmail.com>
Sender: netdev-owner@vger.kernel.org
Cc: Woojung Huh <Woojung.Huh@microchip.com>, Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi, this email is from Rob's (experimental) review bot. I found a couple
of common problems with your patch. Please see below.

On Wed, 15 Aug 2018 16:51:23 +0100, Lad Prabhakar wrote:
> From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
> 
> ksz9477 is superset of ksz9xx series, driver just works
> out of the box for ksz9897 chip with this patch.
> 
> Signed-off-by: Lad, Prabhakar <prabhakar.csengg@gmail.com>

The preferred subject prefix is "dt-bindings: <binding dir>: ...".

> ---
>  Documentation/devicetree/bindings/net/dsa/ksz.txt | 4 +++-
>  drivers/net/dsa/microchip/ksz_common.c            | 9 +++++++++
>  drivers/net/dsa/microchip/ksz_spi.c               | 1 +
>  3 files changed, 13 insertions(+), 1 deletion(-)
> 

DT bindings (including binding headers) should be a separate patch. See
Documentation/devicetree/bindings/submitting-patches.txt.
