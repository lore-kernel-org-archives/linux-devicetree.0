From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH 2/3] net: phy: realtek: Enable accessing RTL8211E
 extension pages
Date: Mon, 1 Jul 2019 14:21:49 -0700
Message-ID: <20190701212149.GA250418@google.com>
References: <20190701195225.120808-1-mka@chromium.org>
 <20190701195225.120808-2-mka@chromium.org>
 <20190701200248.GJ30468@lunn.ch>
 <35db1bff-f48e-5372-06b7-3140cb7cbb71@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <35db1bff-f48e-5372-06b7-3140cb7cbb71@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 01, 2019 at 10:37:16PM +0200, Heiner Kallweit wrote:
> On 01.07.2019 22:02, Andrew Lunn wrote:
> > On Mon, Jul 01, 2019 at 12:52:24PM -0700, Matthias Kaehlcke wrote:
> >> The RTL8211E has extension pages, which can be accessed after
> >> selecting a page through a custom method. Add a function to
> >> modify bits in a register of an extension page and a few
> >> helpers for dealing with ext pages.
> >>
> >> rtl8211e_modify_ext_paged() and rtl821e_restore_page() are
> >> inspired by their counterparts phy_modify_paged() and
> >> phy_restore_page().
> > 
> > Hi Matthias
> > 
> > While an extended page is selected, what happens to the normal
> > registers in the range 0-0x1c? Are they still accessible?
> > 
> AFAIK: no

>From my observations it looks like registers 0x00 to 0x0f are still
accessible, but not the ones above. IIUC 0x00-0x0f are standard
registers, the others are vendor specific.
