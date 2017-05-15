From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v2 2/2] regulator: Allow for asymmetric settling times
Date: Mon, 15 May 2017 15:55:17 -0700
Message-ID: <20170515225517.GB141096@google.com>
References: <20170501183715.35375-1-mka@chromium.org>
 <20170501183715.35375-2-mka@chromium.org>
 <20170514101652.waoc5fhjzpd2emoq@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170514101652.waoc5fhjzpd2emoq@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Laxman Dewangan <ldewangan@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, Brian Norris <briannorris@chromium.org>
List-Id: devicetree@vger.kernel.org

El Sun, May 14, 2017 at 07:16:52PM +0900 Mark Brown ha dit:

> On Mon, May 01, 2017 at 11:37:15AM -0700, Matthias Kaehlcke wrote:
> 
> >  	else if (rdev->constraints->settling_time)
> >  		return rdev->constraints->settling_time;
> > +	else if (rdev->constraints->settling_time_up &&
> > +		 (new_uV > old_uV))
> > +		return rdev->constraints->settling_time_up;
> > +	else if (rdev->constraints->settling_time_down &&
> > +		 (new_uV < old_uV))
> > +		return rdev->constraints->settling_time_down;
> 
> It feels like we should warn if the user mixes specific up/down settling
> times with the more general property, can you please send a followup
> patch adding a warning for that?  It's not exactly obvious what the
> precedence is and may do the wrong thing with an older kernel or
> non-Linux OS.

Sounds good. I'll send out the patch soon.

Thanks

Matthias
