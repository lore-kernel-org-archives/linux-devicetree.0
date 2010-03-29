From: Dan Carpenter <error27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] of: check for IS_ERR()
Date: Mon, 29 Mar 2010 18:41:09 +0300
Message-ID: <20100329154109.GF5069@bicker>
References: <20100226094941.GE4912@bicker>
	<20100226.015420.66646406.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20100226.015420.66646406.davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: giulio.benetti-W14uJ/fiAyBY2hyreNRi6g@public.gmane.org
Cc: jezz-kPcTzGkeZgAdnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, afleming-KZfg59tc24xl57MIdRCFDg@public.gmane.org, jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org, David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 26, 2010 at 01:54:20AM -0800, David Miller wrote:
> From: Dan Carpenter <error27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Date: Fri, 26 Feb 2010 12:49:41 +0300
> 
> > get_phy_device() can return an ERR_PTR()
> > 
> > Signed-off-by: Dan Carpenter <error27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> > I don't have a cross compile environment set up so I can't even compile 
> > test this.  :/  But err.h is included so it should be OK.
> 
> It should return ERR_PTR() consistently.  Checking for both
> NULL and ERR_PTR() is undesirable.

Hi Giulio,

get_phy_device() currently returns NULL because of: 3ee82383f0098a2 "phy: 
fix phy address bug".  If I change it to return ERR_PTR(-ENODEV) that
will mean we break out of the loop with an error in mdiobus_register()
where before we would just continue on.

drivers/net/phy/mdio_bus.c
   119                          phydev = mdiobus_scan(bus, i);
   120                          if (IS_ERR(phydev)) {
   121                                  err = PTR_ERR(phydev);
   122                                  goto error;
   123                          }

Is that OK?

I'm not really familiar with this hardware at all, I'm just going based
on static analysis. :/

regards,
dan carpenter
