From: Peter Chen <peter.chen@freescale.com>
Subject: Re: [PATCH 1/2] ARM: imx6qdl-sabresd: set swbst_reg as vbus's parent
 reg
Date: Thu, 12 Mar 2015 09:54:18 +0800
Message-ID: <20150312015417.GA31064@shlinux2>
References: <1425629061-8995-1-git-send-email-peter.chen@freescale.com>
 <20150311012424.GW20455@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150311012424.GW20455@dragon>
Sender: stable-owner@vger.kernel.org
To: Shawn Guo <shawn.guo@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, stable <stable@vger.kernel.org>
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

One benefit for using <stable@vger.kernel.org> over than
stable@vger.kernel.org directly is it can add "# v3.x+"
at the last of Cc tag if you want git send Cc tag.

Cc: <stable@vger.kernel.org> #3.x+ /* git can work */

Cc: stable@vger.kernel.org #3.x+ /* git can't work */

-- 

Best Regards,
Peter Chen
