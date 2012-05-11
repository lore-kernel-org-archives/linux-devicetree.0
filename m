From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH RESEND v8] gpio: Device tree support for LPC32xx
Date: Fri, 11 May 2012 12:19:09 +0000
Message-ID: <201205111219.10025.arnd@arndb.de>
References: <1336679838-30738-1-git-send-email-stigge@antcom.de> <20120510234100.7F5463E04A6@localhost>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120510234100.7F5463E04A6@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Roland Stigge <stigge@antcom.de>, arm@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linus.walleij@stericsson.com, kevin.wells@nxp.com, srinivas.bakki@nxp.com, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com
List-Id: devicetree@vger.kernel.org

On Thursday 10 May 2012, Grant Likely wrote:
> How about the following instead (very rough, there should be a cleaner
> way to update the gc pointer in of_xlate):
> 
>         gpio: gpio@40028000 {
>                 compatible = "nxp,lpc3220-gpio";
>                 reg = <0x40028000 0x1000>;
>                 gpio-controller;
>                 #gpio-cells = <3>; /* bank, pin, flags */
>         }
> 

I thought about that when I suggested the current binding to Roland,
but the problem with this is that passing the bank as a number is
not very intuitive when the data sheet has separate number spaces
for gpio, gpi and gpo here, so it seemed more natural to go with what
the data sheet describes.

	Arnd
