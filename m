From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/2] ARM: imx6qdl-sabresd: set swbst_reg as vbus's parent
 reg
Date: Wed, 11 Mar 2015 10:57:00 +0100
Message-ID: <20150311095700.GA8172@kroah.com>
References: <1425629061-8995-1-git-send-email-peter.chen@freescale.com>
 <20150311012424.GW20455@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150311012424.GW20455@dragon>
Sender: stable-owner@vger.kernel.org
To: Shawn Guo <shawn.guo@linaro.org>
Cc: Peter Chen <peter.chen@freescale.com>, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, stable <stable@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 11, 2015 at 09:24:25AM +0800, Shawn Guo wrote:
> On Fri, Mar 06, 2015 at 04:04:20PM +0800, Peter Chen wrote:
> > USB vbus 5V is from PMIC SWBST, so set swbst_reg as vbus's
> > parent reg, it fixed a bug that the voltage of vbus is incorrect
> > due to swbst_reg is disabled after boots up.
> > 
> > Cc: stable <stable@vger.kernel.org>
> 
> It's more idiomatic to put the line in this way:
> 
> Cc: stable@vger.kernel.org
> 
> Changed it and applied both patches.

It really doesn't matter, my scripts try to pick up any variation of the
stable@ markings in a signed-off-by: area, as there is a huge number of
different ways people try to mark this, including using invalid email
addresses, and typos.

So no need to be pedantic about this, I can handle it just fine.

thanks,

greg k-h
