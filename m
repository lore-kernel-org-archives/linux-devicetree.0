From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [RFC PATCH 4/6] dt-bindings: update mvneta binding document
Date: Fri, 7 Dec 2018 10:41:42 +0000
Message-ID: <20181207104142.GY30658@n2100.armlinux.org.uk>
References: <20181112122933.GD30658@n2100.armlinux.org.uk>
 <E1gMBMs-00089t-Fd@rmk-PC.armlinux.org.uk>
 <20181203235455.GA5851@bogus>
 <20181205110009.GQ30658@n2100.armlinux.org.uk>
 <CAL_JsqJXMDqQVQJoq0sXn0VEA1iFpcsK+Hjsxwt-7aWNreAkPw@mail.gmail.com>
 <2b832258-0b8f-a8f9-2907-878d0e4d6ee7@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2b832258-0b8f-a8f9-2907-878d0e4d6ee7@ti.com>
Sender: netdev-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, netdev <netdev@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>, Gregory CLEMENT <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Mark Rutland <mark.rutland@arm.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 07, 2018 at 09:37:54AM +0530, Kishon Vijay Abraham I wrote:
> Hi Russell,
> 
> On 05/12/18 9:00 PM, Rob Herring wrote:
> > On Wed, Dec 5, 2018 at 5:00 AM Russell King - ARM Linux
> > <linux@armlinux.org.uk> wrote:
> >>
> >> On Mon, Dec 03, 2018 at 05:54:55PM -0600, Rob Herring wrote:
> >>> On Mon, Nov 12, 2018 at 12:31:02PM +0000, Russell King wrote:
> >>>> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> >>>
> >>> Needs a better subject and a commit msg.
> >>
> >> Hmm, not sure why it didn't contain:
> >>
> >> "dt-bindings: net: mvneta: add phys property
> >>
> >> Add an optional phys property to the mvneta binding documentation for
> >> the common phy.
> >>
> >> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>"
> >>
> >> as the commit message.  With the correct commit message, are you happy
> >> with it?
> > 
> > Yes.
> > 
> > Reviewed-by: Rob Herring <robh@kernel.org>
> 
> Are you planning to resend this series?

I'm not - you said previously that you had merged the first three
patches into the phy tree, which are fine.  The next two could be
merged via netdev.  However, we must avoid merging the last patch
with patch 5 if the patches are going via different trees or
mvneta will break.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
