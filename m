From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 5/6] regulator: core: Add support for a fixed delay
 after voltage changes
Date: Fri, 23 Sep 2016 10:14:26 -0500
Message-ID: <20160923151426.GA13456@rob-hp-laptop>
References: <1473871930-99603-1-git-send-email-mka@chromium.org>
 <1473871930-99603-5-git-send-email-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1473871930-99603-5-git-send-email-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Mark Brown <broonie@kernel.org>, lgirdwood@gmail.com, Douglas Anderson <dianders@chromium.org>, briannorris@chromium.org, javier@dowhile0.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 14, 2016 at 09:52:09AM -0700, Matthias Kaehlcke wrote:
> The target voltage is not necessarily reached inmediately after
> requesting a regulator to change the voltage. In some cases the
> ramp_delay can be used to calculate the stabilisation time, in others
> there is no direct relationship between the delta in the voltage and
> the stabilisation time. This change introduces the device tree properties
> "regulator-settle-time-up-us"/"regulator-settle-time-down-us" which
> allow to specify a fixed delay after a voltage increase or decrease.
> 
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
> Changes in v5:
> - Added support for delay on voltage decreases
> - Don't skip set_voltage_time op if no settle time and ramp delay
> 
>  .../devicetree/bindings/regulator/regulator.txt        |  4 ++++

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/regulator/core.c                               | 18 +++++++++++-------
>  drivers/regulator/of_regulator.c                       |  8 ++++++++
>  include/linux/regulator/machine.h                      |  4 ++++
>  4 files changed, 27 insertions(+), 7 deletions(-)
