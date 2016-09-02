From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/2] regulator: pwm: Add support for a fixed delay
 after duty cycle changes
Date: Fri, 2 Sep 2016 10:13:15 -0500
Message-ID: <20160902151315.GA24205@rob-hp-laptop>
References: <1472617277-30814-1-git-send-email-dianders@chromium.org>
 <20160902151151.GA21418@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160902151151.GA21418@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 02, 2016 at 10:11:51AM -0500, Rob Herring wrote:
> On Tue, Aug 30, 2016 at 09:21:15PM -0700, Douglas Anderson wrote:
> > From: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > 
> > A change of the duty cycle doesn't necessarily cause an immediate switch
> > to the target voltage.  On many PWM regulators there is a fixed "settle
> > time" (irrespective of the jump size) that we need to wait after an
> > upward jump.  This change introduces the device tree property
> > "settle-time-up-us" which allows us to specify a fixed delay after a
> > voltage increase.
> > 
> > We don't add an option of a fixed delay on the way down for now because
> > the way down is probably modelled best with a ramp rate, not a fixed
> > delay.
> > 
> > Signed-off-by: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > Signed-off-by: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > ---
> > Changes in v3:
> > - Took out fixed delay for falling transitions
> > - Updated description
> > 
> >  .../devicetree/bindings/regulator/pwm-regulator.txt   |  6 ++++++
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

I take that back. What Mark said...

> 
> >  drivers/regulator/pwm-regulator.c                     | 19 +++++++++++++++----
> >  2 files changed, 21 insertions(+), 4 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
