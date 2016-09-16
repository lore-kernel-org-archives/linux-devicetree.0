From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 3/4] regulator: Add support for a fixed delay after
 voltage increases
Date: Fri, 16 Sep 2016 07:28:40 -0500
Message-ID: <20160916122840.GA3388@rob-hp-laptop>
References: <20160906190504.GA79728@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160906190504.GA79728-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 06, 2016 at 12:05:04PM -0700, Matthias Kaehlcke wrote:
> The target voltage isn't necessarily reached inmediately after
> requesting a regulator to change the voltage. In some cases the
> ramp_delay can be used to calculate the stabilisation time, in others
> there is no direct relationship between the delta in the voltage and
> the stabilisation time. This change introduces the device tree property
> "regulator-settle-time-up-us" which allows to specify a fixed delay
> after a voltage increase.
> 
> We don't add an option of a fixed delay on the way down for now because
> the way down is probably modelled best with a ramp rate, not a fixed
> delay.
> 
> Signed-off-by: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Signed-off-by: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> 
> ---
> Changes in v4:
> - Moved from PWM regulator to regulator core
> - Added 'regulator' prefix to device tree property
> 
>  .../devicetree/bindings/regulator/regulator.txt    |  2 ++
>  drivers/regulator/core.c                           | 24 +++++++++++++---------
>  drivers/regulator/of_regulator.c                   |  4 ++++
>  include/linux/regulator/machine.h                  |  2 ++
>  4 files changed, 22 insertions(+), 10 deletions(-)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
