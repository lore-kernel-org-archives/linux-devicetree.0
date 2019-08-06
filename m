From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v4 3/4] net: phy: realtek: Add helpers for accessing
 RTL8211E extension pages
Date: Tue, 6 Aug 2019 14:58:01 -0700
Message-ID: <20190806215801.GN250418@google.com>
References: <20190801190759.28201-1-mka@chromium.org>
 <20190801190759.28201-4-mka@chromium.org>
 <71d817b9-7bcc-9f83-331d-1c3958c41f51@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <71d817b9-7bcc-9f83-331d-1c3958c41f51@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

On Sun, Aug 04, 2019 at 10:33:30AM +0200, Heiner Kallweit wrote:
> On 01.08.2019 21:07, Matthias Kaehlcke wrote:
> > The RTL8211E has extension pages, which can be accessed after
> > selecting a page through a custom method. Add a function to
> > modify bits in a register of an extension page and a helper for
> > selecting an ext page. Use rtl8211e_modify_ext_paged() in
> > rtl8211e_config_init() instead of doing things 'manually'.
> > 
> > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > ---
> > Changes in v4:
> > - don't add constant RTL8211E_EXT_PAGE, it's only used once,
> >   use a literal instead
> > - pass 'oldpage' to phy_restore_page() in rtl8211e_select_ext_page(),
> >   not 'page'
> > - return 'oldpage' in rtl8211e_select_ext_page()
> > - use __phy_modify() in rtl8211e_modify_ext_paged() instead of
> >   reimplementing __phy_modify_changed()
> > - in rtl8211e_modify_ext_paged() return directly when
> >   rtl8211e_select_ext_page() fails
> > ---
> >  drivers/net/phy/realtek.c | 48 +++++++++++++++++++++++++++------------
> >  1 file changed, 34 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/net/phy/realtek.c b/drivers/net/phy/realtek.c
> > index a669945eb829..e09d3b0da2c7 100644
> > --- a/drivers/net/phy/realtek.c
> > +++ b/drivers/net/phy/realtek.c
> > @@ -53,6 +53,36 @@ static int rtl821x_write_page(struct phy_device *phydev, int page)
> >  	return __phy_write(phydev, RTL821x_PAGE_SELECT, page);
> >  }
> >  
> > +static int rtl8211e_select_ext_page(struct phy_device *phydev, int page)
> 
> The "extended page" mechanism doesn't exist on RTL8211E only. A prefix
> rtl821x like in other functions may be better therefore.

Sounds good, I'll change it in the next revision

Thanks

Matthias
