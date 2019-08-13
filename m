From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v6 3/4] net: phy: realtek: Add helpers for accessing
 RTL8211x extension pages
Date: Tue, 13 Aug 2019 22:09:17 +0200
Message-ID: <20190813200917.GK15047@lunn.ch>
References: <20190813191147.19936-1-mka@chromium.org>
 <20190813191147.19936-4-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190813191147.19936-4-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 13, 2019 at 12:11:46PM -0700, Matthias Kaehlcke wrote:
> Some RTL8211x PHYs have extension pages, which can be accessed
> after selecting a page through a custom method. Add a function to
> modify bits in a register of an extension page and a helper for
> selecting an ext page. Use rtl8211x_modify_ext_paged() in
> rtl8211e_config_init() instead of doing things 'manually'.
> 
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
