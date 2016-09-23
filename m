From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 6/6] regulator: core: Prevent falling too fast
Date: Fri, 23 Sep 2016 10:16:25 -0500
Message-ID: <20160923151625.GA14369@rob-hp-laptop>
References: <1473871930-99603-1-git-send-email-mka@chromium.org>
 <1473871930-99603-6-git-send-email-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1473871930-99603-6-git-send-email-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Mark Brown <broonie@kernel.org>, lgirdwood@gmail.com, Douglas Anderson <dianders@chromium.org>, briannorris@chromium.org, javier@dowhile0.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 14, 2016 at 09:52:10AM -0700, Matthias Kaehlcke wrote:
> From: Douglas Anderson <dianders@chromium.org>
> 
> On some boards it is possible that transitioning the regulator downwards
> too fast will trigger the over voltage protection (OVP) on the
> regulator. This is because until the voltage actually falls there is
> time when the requested voltage is much lower than the actual voltage.
> 
> We'll fix this OVP problem by allowing users to specify the maximum
> voltage that we can safely fall. The maximum safe voltage decrease
> is specified as a percentage of the current voltage. The driver will
> then break things into separate steps with a delay in between.
> 
> In order to figure out what the delay should be we need to figure out
> how slowly the voltage rail might fall in the worst (slowest) case.
> We'll assume this worst case is present and delay so we know for sure
> that we've finished each step.
> 
> In this patch we actually block returning from the set_voltage() call
> until we've finished delaying. A future patch atop this one might
> choose to return more immediately and let the voltages fall in the
> background. That would possibly allow us to cancel a slow downward
> decay if there was a request to go back up.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
> Changes in v5:
> - Leave set_voltage tracepoints where they were
> - Fixed error handling in code dealing with the device tree, return an error if configuration is invalid
> - Fixed coding style and formatting issues
> - Updated commit message
> 
>  .../devicetree/bindings/regulator/regulator.txt    |  7 ++++

For the binding:

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/regulator/core.c                           | 49 +++++++++++++++++++---
>  drivers/regulator/of_regulator.c                   | 42 ++++++++++++++++++-
>  include/linux/regulator/machine.h                  |  2 +
>  4 files changed, 93 insertions(+), 7 deletions(-)
