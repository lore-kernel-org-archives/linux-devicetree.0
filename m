From: Zhang Rui <rui.zhang@intel.com>
Subject: Re: [PATCH V3 1/5] thermal: qoriq: Add clock operations
Date: Wed, 28 Aug 2019 16:35:29 +0800
Message-ID: <afb235bf7390fb6fbd723c34b08feddd771d1f6c.camel@intel.com>
References: <20190730022126.17883-1-Anson.Huang@nxp.com>
         <VI1PR04MB7023F219CA7B4187F86EAA42EEA10@VI1PR04MB7023.eurprd04.prod.outlook.com>
         <AM6PR0402MB3911D45B3B148588A582F6C4F5A00@AM6PR0402MB3911.eurprd04.prod.outlook.com>
         <VI1PR04MB7023773DD477FF89E2D2181CEEA00@VI1PR04MB7023.eurprd04.prod.outlook.com>
         <d9b428825654181fbdbfb4d613a6a3fd52330787.camel@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d9b428825654181fbdbfb4d613a6a3fd52330787.camel@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Leonard Crestez <leonard.crestez@nxp.com>, Anson Huang <anson.huang@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Cc: Eduardo Valentin <edubezval@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Stephen Boyd <sboyd@kernel.org>, Andrey Smirnov <andrew.smirnov@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wed, 2019-08-28 at 16:32 +0800, Zhang Rui wrote:
> On Tue, 2019-08-27 at 12:41 +0000, Leonard Crestez wrote:
> > On 27.08.2019 04:51, Anson Huang wrote:
> > > > In an earlier series the CLK_IS_CRITICAL flags was removed from
> > > > the TMU
> > > > clock so if the thermal driver doesn't explicitly enable it the
> > > > system will hang
> > > > on probe. This is what happens in linux-next right now!
> > > 
> > > The thermal driver should be built with module, so default kernel
> > > should can boot
> > > up, do you modify the thermal driver as built-in?
> > > 
> > > > Unless this patches is merged soon we'll end up with a 5.4-rc1
> > > > that doesn't
> > > > boot on imx8mq. An easy fix would be to drop/revert commit
> > > > 951c1aef9691 ("clk: imx8mq: Remove CLK_IS_CRITICAL flag for
> > > > IMX8MQ_CLK_TMU_ROOT") until the thermal patches are accepted.
> > > 
> > > If the thermal driver is built as module, I think no need to
> > > revert
> > > the commit, but
> > > if by default thermal driver is built-in or mod probed, then yes,
> > > it should NOT break
> > > kernel boot up.
> > 
> > The qoriq_thermal driver is built as a module in defconfig and
> > when 
> > modules are properly installed in rootfs they will be automatically
> > be 
> > probed on boot and cause a hang.
> > 
> > I usually run nfsroot with modules:
> > 
> >      make modules_install INSTALL_MOD_PATH=/srv/nfs/imx8-root
> 
> so we need this patch shipped in the beginning of the merge window,
> right?
> if there is hard dependency between patches, it's better to send them
> in one series, and get shipped via either tree.
> 
> BTW, who is maintaining qoriq driver from NXP? If Anson is
> maintaining
> and developing this driver, it's better to update this in the driver
> or
> the MAINTAINER file, I will take the driver specific patches as long
> as
> we have ACK/Reviewed-By from the driver maintainer.

And also, can you provide your feedback for this one?
https://patchwork.kernel.org/patch/10974147/

thanks,
rui
> 
> thanks,
> rui
> 
> > 
> > --
> > Regards,
> > Leonard
