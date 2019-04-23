From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH 0/3] Add power domain driver support for i.mx8m family
Date: Tue, 23 Apr 2019 12:07:09 +0100
Message-ID: <20190423110709.GA7483@e107155-lin>
References: <AM0PR04MB44812EBB23214A5892C3E04C88200@AM0PR04MB4481.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <AM0PR04MB44812EBB23214A5892C3E04C88200@AM0PR04MB4481.eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Peng Fan <peng.fan@nxp.com>
Cc: Aisheng Dong <aisheng.dong@nxp.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, Souvik Chakravarty <Souvik.Chakravarty@arm.com>, Jacky Bai <ping.bai@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "festevam@gmail.com" <festevam@gmail.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, Sudeep Holla <sudeep.holla@arm.com>, =?iso-8859-1?Q?Cl=E9ment?= Faure <clement.faure@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Andre Przywara <andre.przywara@arm.com>, Silvano Di Ninno <silvano.dininno@nxp.com>, Leonard Crestez <leonard.crestez@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Sat, Apr 20, 2019 at 01:38:14PM +0000, Peng Fan wrote:
> Hi Sudeep,
>
> Sorry if this reply breaks email thread, I need to manual remove some NXP IT
> policy words from email.
>

Ah OK, indeed threading is lost, had to manually search as I had marked
it to reply later.

> >
> > On Wed, Apr 17, 2019 at 04:21:55PM +0000, Leonard Crestez wrote:
> > > On 4/17/2019 4:33 PM, Sudeep Holla wrote:

[...]

> >
> > While I admit, the section of SCMI specification that touches transport is quite
> > lean, I would view it as done intentionally as the specification is mainly
> > concentrated on it's subject matter which is protocol and not the transport
> > itself. So did the evaluation attempted to consider/try SMC as transport
> > retaining protocol as is ?
> >
> > I can't see any issues with that and hence I am asking it loud here.
>
> To take SMC as a virtual maibox, there is no interrupt doorbell.
> So I modify poll_completion to true for my test.
>

OK fair enough, but that's something we should be easily able to fix.

> SCMI transports mailbox use a shared memory for data transfer and response.
> But actually it should be ok use mailbox registers or smc cpu registers.
>

Indeed.


[...]

> > OK, any inputs from that study ?
>
> I am still at a very initial stage trying scmi over smc with basic communication work,
> Base protocol, power domain protocol work. Power domain set/get still not ready.
>

Good to know, there are efforts in that direction. Thanks for that.

> As Leonard mentioned before, clk hierarchy is very intricate and it relies on many
> clk core features. We need SCMI spec could cover that, such as mux, parent.
>
> I have not tried clock protocol, if wrong, please correct
> 1. CLOCK_RATE_SET/RATE_GET will hide the complexity for OS, but move the
>   complexity to firmware.
>   However, on i.MX8M, we would keep the clk hierarchy in Linux side, and
>   in firmware we add a check to check whether allow the mux, reparent,
>   gate change or not. In this way, we could minimize the firmware binary
>   size and use Linux clk core features. clk-scmi.c are not able to serve the
>   requirement, we need do clk_register with mux/gate/divider with SCMI
>   wrapper in Linux side.

Agreed, but we wanted to avoid complexity as it's very platform specific
and can't be easily generalized. While moving this to firmware might
make it complex, but that's very platform specific.

> 2. Some i.MX8M power domain on needs clk being enabled, such as
>   https://elixir.bootlin.com/linux/v5.1-rc5/source/arch/arm64/boot/dts/freescale/imx8mq.dtsi#L320
>   need extend scmi driver. However scmi does not have a power domain
>   tree in Linux dts, it call into firmware to find which power domain is needed
>   for Linux, then register it.
>

Not sure about this, unable to follow what you mean by that ?


> 3. some i.MX8M power domain off needs external regulator power off
>   to save power, need extend scmi driver. But since there is no power domain
>   tree, I do not find a good way to add regulator. Moving regulator logic
>   to firmware will require i2c support in ATF to communicate with pmic,
>   however pmic has many outputs not only for the upper power domain,
>   moving i2c to ATF will incur risk when OS and ATF both access the pmic.
>

Yes regulators are removed(rather never added) for good from SCMI
specification. You just need good reasons to have them. Linux must
learn to deal with absence of it if it doesn't already.

[...]

> >
> > Why do you need to keep the clk hierarchy in Linux ?
>
> Just replied above.
>
> Hiding the clk tree in Linux would keep the complexity
> in ATF in our case, and enlarge the ATF binary size, and not
> able to use some clk core features.
>

Agreed on firmware complexity, but as I mentioned it's too platform
specific and hard to generalize. We can see what can be added to extend
existing clock support in SCMI if required.

> > >
> > > Last point is that SCMI does not cover pinctrl? This is a large chunk
> > > of firmware functionality on some imx and security control over
> > > individual pins is desirable.
> > >
> >
> > Yes but is that something available at runtime ? Can't that be one-off firmware
> > setting. Will Linux need to configure it differently on each boot ?
> > Just trying to understand. You say security control here and is it really safe to
> > give OS access to control those ?
>
> There is a iomux controller for pinctrl usage on i.MX8M, it could be set to
> secure world read/write, Non secure world read/write block.
> With pinctrl over SCMI, we could add check to see whether allow Linux
> to modify some iomux registers that are used by TEE.
>

OK, something to look at in detail if we need this in the specification.

> >
> > In short, if you had a full blown protocol like few other platforms, the push
> > back would have been minimal. Instead, i.MX chose to implement a solution
> > which doesn't have a design thought before and custom SMC APIs added on
> > fly whenever a new request is raised by OSPM to control things that it thinks it
> > should. I am sure, the very next platform will have it's own set of
> > requirements and custom SMC APIs/interface and no one has even bothered
> > about long term maintenance of these.
> >
>
> As I tried and still trying SCMI over SMC, the current SCMI spec/code
> could not serve our requirement.
>
> I wonder will SCMI spec open to community and maintained by
> community for adding new feature? If there is github repo for this,
> I think we could submit issue/pull request for new feature.
> Or is it possible that we submit code to Linux scmi, then drive SCMI
> spec change?
>

I would rather first add the new features to the specification before
adding the code. SCMI was sent to all ARM vendors for review(I am sure
NXP was also part of it), though as usual it will be ignored until it
will be enforced to be looked at and reviewed. So feel free to send me
details the SCMI enhancements you would need.

--
Regards,
Sudeep
