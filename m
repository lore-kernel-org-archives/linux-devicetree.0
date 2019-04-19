From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v3 0/3] net: add reset-controller driven PHY reset
Date: Thu, 18 Apr 2019 17:43:38 -0700 (PDT)
Message-ID: <20190418.174338.1500943178623114227.davem@davemloft.net>
References: <20190417215922.30472-1-mail@david-bauer.net>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190417215922.30472-1-mail@david-bauer.net>
Sender: netdev-owner@vger.kernel.org
To: mail@david-bauer.net
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: David Bauer <mail@david-bauer.net>
Date: Wed, 17 Apr 2019 23:59:19 +0200

> This patchset adds support for a PHY reset driven by a reset-controller.
> Currently, only GPIO driven resets are supported by the PHY subsystem.
> It also renames the reset-gpio from 'reset' to 'reset_gpio' to
> better differentiate between resets wired to a GPIO and resets wired to
> a reset-controller driven pin.
> 
> Some systems have the PHY reset-line wired to a pin controlled by a
> reset-controller (eg. some Atheros AR9132 based boards). In case the
> bootloader asserts reset before loading the kernel, we currently do not
> have a clean way of deasserting reset to probe the PHY.
> 
> v3:
>  - add missing newline in mdio_bus.c
> 
> v2:
>  - fixed missed rename of "reset" in at803x.c
>  - move initial reset to mdio_device_reset

Series applied to net-next, thanks.
