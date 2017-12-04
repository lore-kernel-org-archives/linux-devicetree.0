From: Erick Chen <erick.chen@spreadtrum.com>
Subject: Re: [PATCH 2/2] regulator: sc2731: Add regulator driver to support
 Spreadtrum SC2731 PMIC
Date: Mon, 4 Dec 2017 17:03:14 +0800
Message-ID: <20171204090313.GA2242@spreadtrum.com>
References: <f6d8ff765f4864e5b6ace1f022202d8793a7becf.1512118703.git.erick.chen@spreadtrum.com>
 <75a6a48f603a25d744ef46287e036975b0203608.1512118703.git.erick.chen@spreadtrum.com>
 <201712020333.vB23X0mT082692@TPSPAM01.spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201712020333.vB23X0mT082692@TPSPAM01.spreadtrum.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, baolin.wang@linaro.org, baolin.wang@spreadtrum.com
List-Id: devicetree@vger.kernel.org

Hi Mark,

On Fri, Dec 01, 2017 at 01:01:37PM +0000, Mark Brown wrote:
> On Fri, Dec 01, 2017 at 04:58:16PM +0800, Erick Chen wrote:
> 
> > +static const struct of_device_id sc2731_regulator_of_match[] = {
> > +	{.compatible = "sprd,sc2731-regulator",},
> > +	{}
> > +};
> > +MODULE_DEVICE_TABLE(of, sc2731_regulator_of_match);
> 
> This looks like a subdriver for one specific device that can't be reused
> with anything else as it's specific to an individual device so I'd not
> expect it to appear as a separate thing in DT - the way Linux splits
> things up might not map well onto other OSs and may even change in
> future versions of Linux (look at all the audio drivers with clock
> controllers in them for example).  I'd expect the MFD to just register
> the subdevice without needing it to appear in the DT.
>

Make sense, i will remove the of_device_id table in next version.
 
> > +subsys_initcall(sc2731_regulator_init);
> > +module_exit(sc2731_regulator_exit);
> 
> Why not module_platform_driver()?  Deferred probe should sort out probe
> order.

On some Spreadtrum old platforms, we need to power on the CPU cores ASAP.
But now this issue had been fixed after some investigation, so we can change
subsys_initcall() to module_init() level as you suggested.

Very appreciated for your helpful comments.
