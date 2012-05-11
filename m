From: Roland Stigge <stigge@antcom.de>
Subject: Re: [PATCH RESEND v8] gpio: Device tree support for LPC32xx
Date: Fri, 11 May 2012 14:47:53 +0200
Message-ID: <4FAD0A79.8040207@antcom.de>
References: <1336679838-30738-1-git-send-email-stigge@antcom.de> <20120510234100.7F5463E04A6@localhost> <201205111219.10025.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201205111219.10025.arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Grant Likely <grant.likely@secretlab.ca>, arm@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linus.walleij@stericsson.com, kevin.wells@nxp.com, srinivas.bakki@nxp.com, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com
List-Id: devicetree@vger.kernel.org

On 05/11/2012 02:19 PM, Arnd Bergmann wrote:
> On Thursday 10 May 2012, Grant Likely wrote:
>> How about the following instead (very rough, there should be a cleaner
>> way to update the gc pointer in of_xlate):
>>
>>         gpio: gpio@40028000 {
>>                 compatible = "nxp,lpc3220-gpio";
>>                 reg = <0x40028000 0x1000>;
>>                 gpio-controller;
>>                 #gpio-cells = <3>; /* bank, pin, flags */
>>         }
>>
> 
> I thought about that when I suggested the current binding to Roland,
> but the problem with this is that passing the bank as a number is
> not very intuitive when the data sheet has separate number spaces
> for gpio, gpi and gpo here, so it seemed more natural to go with what
> the data sheet describes.

Right. Personally, I would be fine with either of my v8 (all banks in
dt, referenced naturally by name) and v9 (one simple DT entry for the
whole GPIO controller, integer index for referencing banks) patches.

Consider the DT-documented mapping in the latter case:

      0: GPIO P0
      1: GPIO P1
      2: GPIO P2
      3: GPIO P3
      4: GPI P3
      5: GPO P3

Not too difficult and would also be acceptable, IMO.

So Arnd and Grant, please agree one of those and pick it. :-)

Thanks in advance,

Roland
