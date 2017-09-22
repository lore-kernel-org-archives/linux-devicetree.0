From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 1/2] pinctrl: Allow a device to indicate when to force a
 state
Date: Fri, 22 Sep 2017 13:47:04 +0100
Message-ID: <20170922124704.yfu46ak4rypai3vp@localhost.localdomain>
References: <20170921010421.7467-1-f.fainelli@gmail.com>
 <20170921010421.7467-2-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170921010421.7467-2-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-kernel@vger.kernel.org, linus.walleij@linaro.org, swarren@nvidia.com, andy.shevchenko@gmail.com, alcooperx@gmail.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

On Wed, Sep 20, 2017 at 06:04:20PM -0700, Florian Fainelli wrote:
> It may happen that a device needs to force applying a state, e.g:
> because it only defines one state of pin states (default) but loses
> power/register contents when entering low power modes. Add a
> pinctrl_dev::flags bitmask to help describe future quirks and define
> PINCTRL_FLG_FORCE_STATE as such a settable flag.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  drivers/pinctrl/core.c | 15 +++++++++++++++
>  drivers/pinctrl/core.h |  4 ++++
>  2 files changed, 19 insertions(+)
> 
> diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
> index 56fbe4c3e800..c450a97de88f 100644
> --- a/drivers/pinctrl/core.c
> +++ b/drivers/pinctrl/core.c
> @@ -1197,11 +1197,26 @@ int pinctrl_select_state(struct pinctrl *p, struct pinctrl_state *state)
>  {
>  	struct pinctrl_setting *setting, *setting2;
>  	struct pinctrl_state *old_state = p->state;
> +	bool force = false;
>  	int ret;
>  
>  	if (p->state == state)
>  		return 0;

I am guessing you probably intended to remove these two lines.

>  
> +	if (p->state) {
> +		list_for_each_entry(setting, &p->state->settings, node) {
> +			if (setting->pctldev->flags & PINCTRL_FLG_FORCE_STATE)
> +				force = true;
> +		}
> +	}
> +
> +	/* Some controllers may want to force this operation when they define
> +	 * only one set of functions and lose power state, e.g: pinctrl-single
> +	 * with its pinctrl-single,low-power-state-loss property.
> +	 */
> +	if (p->state == state && !force)
> +		return 0;
> +

Thanks,
Charles
