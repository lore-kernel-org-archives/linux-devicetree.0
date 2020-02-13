Return-Path: <SRS0=Uhz2=4B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E281C2BA83
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Feb 2020 11:32:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E3C322073C
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Feb 2020 11:32:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729428AbgBMLck (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 13 Feb 2020 06:32:40 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:39907 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbgBMLck (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 13 Feb 2020 06:32:40 -0500
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1j2CjN-0007QJ-D9; Thu, 13 Feb 2020 12:32:29 +0100
Message-ID: <0a8a4edcf110ec5bcf859c145ef27553039c6cd0.camel@pengutronix.de>
Subject: Re: [PATCH 0/3] Add power domain driver support for i.mx8m family
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Jacky Bai <ping.bai@nxp.com>,
        Schrempf Frieder <frieder.schrempf@kontron.de>,
        Adam Ford <aford173@gmail.com>,
        Sudeep Holla <sudeep.holla@arm.com>
Cc:     Aisheng Dong <aisheng.dong@nxp.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        Peng Fan <peng.fan@nxp.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        =?ISO-8859-1?Q?Cl=E9ment?= Faure <clement.faure@nxp.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Andre Przywara <andre.przywara@arm.com>,
        Silvano Di Ninno <silvano.dininno@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Date:   Thu, 13 Feb 2020 12:32:27 +0100
In-Reply-To: <VI1PR04MB6992DF27336AC51945D1C0C1871A0@VI1PR04MB6992.eurprd04.prod.outlook.com>
References: <20190417053211.2195-1-ping.bai@nxp.com>
         <AM0PR04MB42116FEB1EE2CAE68A1CAA8980250@AM0PR04MB4211.eurprd04.prod.outlook.com>
         <1555503195.2317.19.camel@pengutronix.de>
         <VI1PR04MB55330105F4839FCF98B7CFC0EE250@VI1PR04MB5533.eurprd04.prod.outlook.com>
         <68aaace3-f66e-b4b8-30a0-57b8b66a7524@arm.com>
         <VI1PR04MB5533A1F87436C0839A772D03EE250@VI1PR04MB5533.eurprd04.prod.outlook.com>
         <20190418144330.GD7770@e107155-lin>
         <CAHCN7xKK3zWE9i24prauPw0DSNTjASsMgDYY8w3OBJ+hb2y-sg@mail.gmail.com>
         <871ac22a-0508-8e92-b012-f414be5bd174@kontron.de>
         <VI1PR04MB6992DF27336AC51945D1C0C1871A0@VI1PR04MB6992.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Do, 2020-02-13 at 09:21 +0000, Jacky Bai wrote:
> > -----Original Message-----
> > From: Schrempf Frieder <frieder.schrempf@kontron.de>
> > Sent: Thursday, February 13, 2020 5:16 PM
> > To: Adam Ford <aford173@gmail.com>; Sudeep Holla
> > <sudeep.holla@arm.com>
> > Cc: Aisheng Dong <aisheng.dong@nxp.com>; mark.rutland@arm.com; Peng
> > Fan <peng.fan@nxp.com>; Souvik Chakravarty
> > <Souvik.Chakravarty@arm.com>; Jacky Bai <ping.bai@nxp.com>;
> > devicetree@vger.kernel.org; Clément Faure <clement.faure@nxp.com>;
> > s.hauer@pengutronix.de; shawnguo@kernel.org; robh+dt@kernel.org;
> > dl-linux-imx <linux-imx@nxp.com>; kernel@pengutronix.de; Andre Przywara
> > <andre.przywara@arm.com>; Silvano Di Ninno <silvano.dininno@nxp.com>;
> > Leonard Crestez <leonard.crestez@nxp.com>; festevam@gmail.com;
> > linux-arm-kernel@lists.infradead.org; Lucas Stach <l.stach@pengutronix.de>
> > Subject: Re: [PATCH 0/3] Add power domain driver support for i.mx8m family
> > 
> > Hi,
> > 
> > On 07.11.19 22:28, Adam Ford wrote:
> > > On Thu, Apr 18, 2019 at 9:43 AM Sudeep Holla <sudeep.holla@arm.com>
> > wrote:
> > > > On Wed, Apr 17, 2019 at 04:21:55PM +0000, Leonard Crestez wrote:
> > > > > On 4/17/2019 4:33 PM, Sudeep Holla wrote:
> > > > > > > > I don't yet buy the security argument. There are many more shared
> > > > > > > > parts on the SoC, like the clock controller, that would need to
> > > > > > > > be taken away from the non-secure world if one would want to run
> > > > > > > > an untrusted OS kernel on a i.MX8M system.
> > > > > > > > 
> > > > > > > > To properly implement security on any i.MX8M based system the
> > > > > > > > firmware would need to grow something like a full ARM SCPI
> > > > > > > > implementation, so all shared critical peripherals are solely under
> > firmware control.
> > > > > > > It might be possible to rework this to use some form of
> > > > > > > SCMI-over-SMC instead of vendor-specific SMCCC SIP calls
> > > 
> > > I was just curious to know if there is any progress being made on
> > > this.  The i.mx8mm-evk is missing functionality upstream and I think
> > > the power domain support would help enable some of these features.
> > > 
> > 
> > Has there been any decision or action taken in this topic?
> > Will the power domain driver as proposed in this patch be upstreamed at
> > some time, or rather not?
> > 
> > I try to build a mainline BSP for i.MX8MM (ML U-Boot, ML TF-A, ML Linux)
> > and I integrated display and graphics support from the downstream NXP
> > kernel.
> > 
> > While most things already work fine, there's the issue of how to handle the
> > power domains. Currently I need to ungate some clocks in the TF-A
> > BL31 to get for example the GPU running. If I understand this correctly the
> > proposed power domain driver could handle this in Linux otherwise.
> > 
> 
> the SCMI over SMC is still under review

Even if the SCMI over SMC is ready at some point, it's still unclear to
me how you intend to abstract the GPC behind the SCMI interface in the
TF-A. The power domains have dependencies both into the regulator and
the clock framework. Both are currently under exclusive control of the
rich OS. How do you intend to allow the TF-A to control the power
supplies and necessary reset clocks without messing up any state in the
rich OS?

Regards,
Lucas

