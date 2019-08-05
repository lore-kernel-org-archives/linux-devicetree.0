From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 12/16] net: phy: adin: read EEE setting from device-tree
Date: Mon, 5 Aug 2019 17:19:09 +0200
Message-ID: <20190805151909.GR24275@lunn.ch>
References: <20190805165453.3989-1-alexandru.ardelean@analog.com>
 <20190805165453.3989-13-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190805165453.3989-13-alexandru.ardelean@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, f.fainelli@gmail.com, hkallweit1@gmail.com
List-Id: devicetree@vger.kernel.org

On Mon, Aug 05, 2019 at 07:54:49PM +0300, Alexandru Ardelean wrote:
> By default, EEE is not advertised on system init. This change allows the
> user to specify a device property to enable EEE advertisements when the PHY
> initializes.
 
This patch is not required. If EEE is not being advertised when it
should, it means there is a MAC driver bug.

	Andrew
