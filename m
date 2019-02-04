From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v2 1/2] r8169: Load MAC address from device tree if
 present
Date: Mon, 4 Feb 2019 20:30:03 +0100
Message-ID: <b18567da-110e-ddb9-c9cf-9c7bdf922500@gmail.com>
References: <20190204164213.30727-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190204164213.30727-1-thierry.reding@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, "David S. Miller" <davem@davemloft.net>
Cc: Andrew Lunn <andrew@lunn.ch>, Realtek linux nic maintainers <nic_swsd@realtek.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 04.02.2019 17:42, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> If the system was booted using a device tree and if the device tree
> contains a MAC address, use it instead of reading one from the EEPROM.
> This is useful in situations where the EEPROM isn't properly programmed
> or where the firmware wants to override the existing MAC address.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Reviewed-by: Heiner Kallweit <hkallweit1@gmail.com>
