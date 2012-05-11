From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH RESEND v8] gpio: Device tree support for LPC32xx
Date: Fri, 11 May 2012 13:22:14 +0000
Message-ID: <201205111322.15191.arnd@arndb.de>
References: <1336679838-30738-1-git-send-email-stigge@antcom.de> <201205111219.10025.arnd@arndb.de> <4FAD0A79.8040207@antcom.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4FAD0A79.8040207@antcom.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Roland Stigge <stigge@antcom.de>
Cc: Grant Likely <grant.likely@secretlab.ca>, arm@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linus.walleij@stericsson.com, kevin.wells@nxp.com, srinivas.bakki@nxp.com, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com
List-Id: devicetree@vger.kernel.org

On Friday 11 May 2012, Roland Stigge wrote:
> Right. Personally, I would be fine with either of my v8 (all banks in
> dt, referenced naturally by name) and v9 (one simple DT entry for the
> whole GPIO controller, integer index for referencing banks) patches.
> 
> Consider the DT-documented mapping in the latter case:
> 
>       0: GPIO P0
>       1: GPIO P1
>       2: GPIO P2
>       3: GPIO P3
>       4: GPI P3
>       5: GPO P3
> 
> Not too difficult and would also be acceptable, IMO.
> 
> So Arnd and Grant, please agree one of those and pick it. :-)
> 

Grant is maintainer for both GPIO and DT, so his opinion is what
counts in this case.
I was merely giving the background on how we got there so he
can make an informed decision.

	Arnd
