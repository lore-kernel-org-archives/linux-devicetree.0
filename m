From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [RFC PATCH 4/6] dt-bindings: update mvneta binding document
Date: Fri, 7 Dec 2018 11:33:01 +0000
Message-ID: <20181207113301.GZ30658@n2100.armlinux.org.uk>
References: <20181112122933.GD30658@n2100.armlinux.org.uk>
 <E1gMBMs-00089t-Fd@rmk-PC.armlinux.org.uk>
 <20181203235455.GA5851@bogus>
 <20181205110009.GQ30658@n2100.armlinux.org.uk>
 <CAL_JsqJXMDqQVQJoq0sXn0VEA1iFpcsK+Hjsxwt-7aWNreAkPw@mail.gmail.com>
 <2b832258-0b8f-a8f9-2907-878d0e4d6ee7@ti.com>
 <20181207104142.GY30658@n2100.armlinux.org.uk>
 <2ac6488c-a060-6875-bc92-c14fe2dbf8af@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2ac6488c-a060-6875-bc92-c14fe2dbf8af@ti.com>
Sender: netdev-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, netdev <netdev@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>, Gregory CLEMENT <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Mark Rutland <mark.rutland@arm.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 07, 2018 at 04:43:27PM +0530, Kishon Vijay Abraham I wrote:
> Russell,
> 
> No, I haven't merged patches from this series. That would have failed
> compilation since Grygorii modified enum phy_mode which is used in this series.
> You have also noted this in your cover letter.

Ok, but in any case, given the complexities of modifying the patch
and properly testing it, I think I'll wait until those changes have
hit mainline before re-spinning this series.  Alternatively, if
you're happy to take just build-tested version, I could re-spin
with that so at least we can get the phy bits queued for the merge
window.

In any case, I'm busy trying to get to the bottom of several OMAP4
bugs while ill, so this isn't something I want to do at the moment.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
