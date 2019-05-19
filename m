From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] of_net: fix of_get_mac_address retval if compiled
 without CONFIG_OF
Date: Sun, 19 May 2019 10:35:33 -0700 (PDT)
Message-ID: <20190519.103533.1752298588551711978.davem@davemloft.net>
References: <1558268324-5596-1-git-send-email-ynezz@true.cz>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-15
Content-Transfer-Encoding: 8BIT
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1558268324-5596-1-git-send-email-ynezz@true.cz>
Sender: netdev-owner@vger.kernel.org
To: ynezz@true.cz
Cc: robh+dt@kernel.org, frowand.list@gmail.com, andrew@lunn.ch, f.fainelli@gmail.com, hkallweit1@gmail.com, mlindner@marvell.com, stephen@networkplumber.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Petr ¦tetiar <ynezz@true.cz>
Date: Sun, 19 May 2019 14:18:44 +0200

> of_get_mac_address prior to commit d01f449c008a ("of_net: add NVMEM
> support to of_get_mac_address") could return only valid pointer or NULL,
> after this change it could return only valid pointer or ERR_PTR encoded
> error value, but I've forget to change the return value of
> of_get_mac_address in case where the kernel is compiled without
> CONFIG_OF, so I'm doing so now.
> 
> Cc: Mirko Lindner <mlindner@marvell.com>
> Cc: Stephen Hemminger <stephen@networkplumber.org>
> Fixes: d01f449c008a ("of_net: add NVMEM support to of_get_mac_address")
> Reported-by: Octavio Alvarez <octallk1@alvarezp.org>
> Signed-off-by: Petr ¦tetiar <ynezz@true.cz>

Applied, thanks.
