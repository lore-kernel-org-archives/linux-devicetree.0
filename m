From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] mfd: arizona: Move useful defines into a dt-binding
	include
Date: Sat, 21 Feb 2015 10:23:41 +0000
Message-ID: <20150221102341.GA15374@opensource.wolfsonmicro.com>
References: <1424257419-28000-1-git-send-email-ckeepax@opensource.wolfsonmicro.com> <20150221092308.GC6236@finisterre.sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150221092308.GC6236@finisterre.sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: lee.jones@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.ok, galak@codeaurora.org, sameo@linux.intel.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, Feb 21, 2015 at 06:23:08PM +0900, Mark Brown wrote:
> On Wed, Feb 18, 2015 at 11:03:39AM +0000, Charles Keepax wrote:
> 
> > --- a/include/linux/mfd/arizona/pdata.h
> > +++ b/include/linux/mfd/arizona/pdata.h
> > @@ -7,61 +7,17 @@
> >   * it under the terms of the GNU General Public License version 2 as
> >   * published by the Free Software Foundation.
> >   */
> > +#include <dt-bindings/mfd/arizona.h>
> >  
> >  #ifndef _ARIZONA_PDATA_H
> >  #define _ARIZONA_PDATA_H
> 
> It's a bit odd to have the include outside the guards, is there any
> great reason for doing so?

There is not, simple error on my part, I will respin and move it inside.

Thanks,
Charles
