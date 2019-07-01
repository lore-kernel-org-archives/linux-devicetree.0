From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH 2/3] net: phy: realtek: Enable accessing RTL8211E
 extension pages
Date: Mon, 1 Jul 2019 14:32:36 -0700
Message-ID: <20190701213236.GB250418@google.com>
References: <20190701195225.120808-1-mka@chromium.org>
 <20190701195225.120808-2-mka@chromium.org>
 <d2386f7d-b4bc-d983-1b83-cc2aa4aec38b@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <d2386f7d-b4bc-d983-1b83-cc2aa4aec38b@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 01, 2019 at 10:43:12PM +0200, Heiner Kallweit wrote:
> On 01.07.2019 21:52, Matthias Kaehlcke wrote:
> > The RTL8211E has extension pages, which can be accessed after
> > selecting a page through a custom method. Add a function to
> > modify bits in a register of an extension page and a few
> > helpers for dealing with ext pages.
> > 
> > rtl8211e_modify_ext_paged() and rtl821e_restore_page() are
> > inspired by their counterparts phy_modify_paged() and
> > phy_restore_page().
> > 
> > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > ---
> > This code might be applicable to other Realtek PHYs, but I don't
> > have access to the datasheets to confirm it, so for now it's just
> > for the RTL8211E.
> > 
> This extended page mechanism exists on a number of older Realtek
> PHY's. For most extended pages however Realtek releases no public
> documentation.
> Considering that we use these helpers in one place only,  I don't
> really see a need for them.

I see it as self-documenting code, that may be reused, rather than
inline code with comments.

In any case I'm looking into another patch that would write registers
on extented pages rather than doing a modify, if that materializes I
think we would want the helpers.
