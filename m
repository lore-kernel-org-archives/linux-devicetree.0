From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH] of_net: fix of_get_mac_address retval if compiled
 without CONFIG_OF
Date: Sun, 19 May 2019 16:02:47 +0200
Message-ID: <20190519140247.GB30854@lunn.ch>
References: <1558268324-5596-1-git-send-email-ynezz@true.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1558268324-5596-1-git-send-email-ynezz@true.cz>
Sender: netdev-owner@vger.kernel.org
To: Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Mirko Lindner <mlindner@marvell.com>, Stephen Hemminger <stephen@networkplumber.org>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, May 19, 2019 at 02:18:44PM +0200, Petr Štetiar wrote:
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
> Signed-off-by: Petr Štetiar <ynezz@true.cz>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
