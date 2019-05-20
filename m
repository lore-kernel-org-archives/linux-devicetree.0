From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH] of_net: fix of_get_mac_address retval if compiled without
 CONFIG_OF
Date: Mon, 20 May 2019 12:36:50 +0300
Message-ID: <421e4a76-dbd7-73ac-d8cd-af0bcd789a03@cogentembedded.com>
References: <1558268324-5596-1-git-send-email-ynezz@true.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1558268324-5596-1-git-send-email-ynezz@true.cz>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: =?UTF-8?Q?Petr_=c5=a0tetiar?= <ynezz@true.cz>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Mirko Lindner <mlindner@marvell.com>, Stephen Hemminger <stephen@networkplumber.org>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello!

On 19.05.2019 15:18, Petr Štetiar wrote:

> of_get_mac_address prior to commit d01f449c008a ("of_net: add NVMEM
> support to of_get_mac_address") could return only valid pointer or NULL,
> after this change it could return only valid pointer or ERR_PTR encoded
> error value, but I've forget to change the return value of

    It's either "I've forgotten" or just "I forgot".

> of_get_mac_address in case where the kernel is compiled without
> CONFIG_OF, so I'm doing so now.

    Well, better late... :-)

> Cc: Mirko Lindner <mlindner@marvell.com>
> Cc: Stephen Hemminger <stephen@networkplumber.org>
> Fixes: d01f449c008a ("of_net: add NVMEM support to of_get_mac_address")
> Reported-by: Octavio Alvarez <octallk1@alvarezp.org>
> Signed-off-by: Petr Štetiar <ynezz@true.cz>
[...]

MBR, Sergei
