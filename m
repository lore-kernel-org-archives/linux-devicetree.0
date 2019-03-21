From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 1/3] devicetree: bindings: bd718x7: document HW state
 related ROHM specific properties
Date: Thu, 21 Mar 2019 08:23:38 +0000
Message-ID: <20190321082338.GT4731@dell>
References: <cover.1550135853.git.matti.vaittinen@fi.rohmeurope.com>
 <6ed4238fb083f52de0f5f013647b2334bad8ebe4.1550135853.git.matti.vaittinen@fi.rohmeurope.com>
 <20190320130259.GN4731@dell>
 <20190320141701.GA6208@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190320141701.GA6208@localhost.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: mazzisaccount@gmail.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, heikki.haikola@fi.rohmeurope.com, mikko.mutanen@fi.rohmeurope.com, Robin Gong <yibin.gong@nxp.com>, Elven Wang <elven.wang@nxp.com>, Anson Huang <anson.huang@nxp.com>, Angus Ainslie <angus.ainslie@puri.sm>
List-Id: devicetree@vger.kernel.org

On Wed, 20 Mar 2019, Matti Vaittinen wrote:

> Hello Lee, All
> 
> On Wed, Mar 20, 2019 at 01:02:59PM +0000, Lee Jones wrote:
> > On Thu, 14 Feb 2019, Matti Vaittinen wrote:
> > 
> > > Add ROHM BD71837 / BD71847 specific device tree bindings for
> > > controlling the PMIC shutdown/reset states and voltages for
> > > different HW states. The PMIC was designed to be used with NXP
> > > i.MX8 SoC and it supports SNVS low power state which seems to
> > > be typical for NXP i.MX SoCs. However, when SNVS is used we must
> > > not allow SW to control enabling/disabling those regulators which
> > > are crucial for system to boot as there is a HW limitation which
> > > causes SW controlled regulators to be kept shut down after SNVS
> > > reset.
> > > 
> > > Allow setting the SNVS to be used as reset target state and allow
> > > marking those regulators which are critical for boot.
> > > 
> > > Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> > > ---
> > >  .../devicetree/bindings/mfd/rohm,bd71837-pmic.txt  | 17 ++++++++++
> > >  .../bindings/regulator/rohm,bd71837-regulator.txt  | 38 ++++++++++++++++++++++
> > >  2 files changed, 55 insertions(+)
> > 
> > Needs a DT Ack.
> 
> I think this was already applied to regulator tree by Mark:
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git/commit/?h=for-next&id=f43d1b388f9be4aa47ed42c33659243a675c5c76
> Does it go in via his tree or do we need to apply it in Lee's tree too?

Why don't I see an email from Mark?

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
