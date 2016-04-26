From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2] drivers: firmware: psci: unify enable-method binding on ARM {64,32}-bit systems
Date: Tue, 26 Apr 2016 13:02:55 +0200
Message-ID: <5255940.mPUzGZ0TLa@wuerfel>
References: <1461338282-19509-1-git-send-email-sudeep.holla@arm.com> <31757054.8aSO57qemx@wuerfel> <20160426110147.GC20836@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160426110147.GC20836@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 26 April 2016 12:01:48 Mark Rutland wrote:
> On Tue, Apr 26, 2016 at 12:49:00PM +0200, Arnd Bergmann wrote:
> > On Tuesday 26 April 2016 11:42:58 Sudeep Holla wrote:

> > > 
> > > Gentle ping to include this in next round of arm-soc fixes. It would be
> > > good to get this fixed before v4.6 as we don't want to have user of the
> > > binding which we want to remove in the release.
> > > 
> > 
> > Applied to the fixes branch. I have to admit that I don't understand
> > how the compatible string is really used here, so I have to trust that
> > this cannot break any existing machine.
> 
> The buggy code was merged for v4.6-rc1, so this hasn't been in a
> release, and should not break an existing user.
> 
> No compatible string is used here, which is precisely the confusion this
> addresses. The PSCI enable-method != the compatible string for a PSCI
> node, but the two got confused in a documentation patch, and then that
> confusion spread to code.
> 

Ok, thanks for the explanation.

	ARnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
