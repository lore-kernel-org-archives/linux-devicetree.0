From: David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Subject: Re: [RFC] [PATCH] Device Tree on ARM platform
Date: Wed, 27 May 2009 22:31:47 -0700 (PDT)
Message-ID: <20090527.223147.94364683.davem@davemloft.net>
References: <20090528025258.GB1464@yookeroo.seuss>
	<20090527.212730.183576278.davem@davemloft.net>
	<20090528044732.GK1464@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20090528044732.GK1464-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-xIg/pKzrS19vn6HldHNs0ANdhmdF6hFW@public.gmane.org, jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org, yuan-bo.ye-3WKxDLwmzFNWk0Htik3J/w@public.gmane.org, timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Date: Thu, 28 May 2009 14:47:32 +1000

> The conceptual problem becomes apparent when you consider things like
> i2c.  The devtree is the obvious source to discover what i2c device
> are present, but they need to be instantiated as i2c devices on the
> i2c bus, not of platform devices.

Sure, but there is no reason there can't be an of_platform driver
for those i2c devices.  And such instantiated devices get propagated
either instantly to the parent, or later when the parent controller
probes.
