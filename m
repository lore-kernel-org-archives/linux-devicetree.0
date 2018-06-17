From: Jiri Pirko <jiri@resnulli.us>
Subject: Re: [PATCH 1/3] net: dsa: Add DT bindings for Vitesse VSC73xx
 switches
Date: Sun, 17 Jun 2018 09:40:39 +0200
Message-ID: <20180617074039.GB2141@nanopsycho>
References: <20180614123534.8063-1-linus.walleij@linaro.org>
 <20180614123534.8063-2-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180614123534.8063-2-linus.walleij@linaro.org>
Sender: netdev-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, openwrt-devel@lists.openwrt.org, LEDE Development List <lede-dev@lists.infradead.org>, Gabor Juhos <juhosg@openwrt.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Thu, Jun 14, 2018 at 02:35:32PM CEST, linus.walleij@linaro.org wrote:
>This adds the device tree bindings for the Vitesse VSC73xx
>switches. We also add the vendor name for Vitesse.
>
>Cc: devicetree@vger.kernel.org
>Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>---
> .../bindings/net/dsa/vitesse,vsc73xx.txt      | 81 +++++++++++++++++++
> .../devicetree/bindings/vendor-prefixes.txt   |  1 +
> 2 files changed, 82 insertions(+)
> create mode 100644 Documentation/devicetree/bindings/net/dsa/vitesse,vsc73xx.txt
>
>diff --git a/Documentation/devicetree/bindings/net/dsa/vitesse,vsc73xx.txt b/Documentation/devicetree/bindings/net/dsa/vitesse,vsc73xx.txt
>new file mode 100644
>index 000000000000..474cdba5fa37
>--- /dev/null
>+++ b/Documentation/devicetree/bindings/net/dsa/vitesse,vsc73xx.txt
>@@ -0,0 +1,81 @@
>+Vitess VSC73xx Switches

s/Vitess/Vitesse/

[...]
