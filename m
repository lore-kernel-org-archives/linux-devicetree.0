From: Gyungoh Yoo <gyungoh@gmail.com>
Subject: Re: [RESUBMIT PATCH v4 7/8] regulator: sky81452: Add compatible
 string for device binding
Date: Fri, 17 Oct 2014 19:43:09 +0900
Message-ID: <20141017104309.GA3136@jack-ThinkPad-T520>
References: <1412657745-7812-1-git-send-email-jack.yoo@skyworksinc.com>
 <1413179262-27636-1-git-send-email-jack.yoo@skyworksinc.com>
 <1413179262-27636-8-git-send-email-jack.yoo@skyworksinc.com>
 <20141013103512.GJ27755@sirena.org.uk>
 <20141014011112.GB2751@jack-ThinkPad-T520>
 <20141014075606.GN27755@sirena.org.uk>
 <20141017091950.GA3233@jack-ThinkPad-T520>
 <20141017101734.GB1820@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20141017101734.GB1820@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: sameo@linux.intel.com, lee.jones@linaro.org, jg1.han@samsung.com, cooloney@gmail.com, lgirdwood@gmail.com, jack.yoo@skyworksinc.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, grant.likely@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, pawel.moll@arm.com, heiko@sntech.de, jason@lakedaemon.net, shawn.guo@freescale.com, treding@nvidia.com, florian.vaussard@epfl.ch, trivial@kernel.org, linux@roeck-us.net, andrew@lunn.ch, jic23@kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 17, 2014 at 12:17:34PM +0200, Mark Brown wrote:
> On Fri, Oct 17, 2014 at 06:19:50PM +0900, Gyungoh Yoo wrote:
> 
> > Wow. I understand.
> > I missed .supply_name. I think I need something like
> > below, before devm_regulator_register().
> 
> > 	config->supply_name = init_data->constraints.name;
> 
> > I will resubmit it.
> 
> No, not supply_name (though you really should be initializing that
> anyway) and you definitely don't want to set supply_name to something
> from constraints.  The supply_name should be the name of the input pin
> that supplies power to the regulator.  I was referring to of_match and
> regulators_node.

Wow. I had misunderstanding.

Are you talking about simplification using of_regulator_match()?
This driver has only one regulator.
Is the API also useful for this driver?
Like reg-fixed-voltage, how about using of_get_fixed_voltage_config()?

Thanks.
