From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 6/7] dt-bindings: net: realtek: Add property to
 configure LED mode
Date: Wed, 3 Jul 2019 22:07:43 +0200
Message-ID: <20190703200743.GF18473@lunn.ch>
References: <20190703193724.246854-1-mka@chromium.org>
 <20190703193724.246854-6-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190703193724.246854-6-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 03, 2019 at 12:37:23PM -0700, Matthias Kaehlcke wrote:

Hi Matthias

Maybe add a #define for 0, so we know what it does.

> +#define RTL8211E_LINK_10		1
> +#define RTL8211E_LINK_100		2
> +#define RTL8211E_LINK_1000		4
