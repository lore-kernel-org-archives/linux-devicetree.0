Return-Path: <SRS0=uucL=YV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7488CA9EC0
	for <linux-devicetree@archiver.kernel.org>; Mon, 28 Oct 2019 14:28:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B684F21479
	for <linux-devicetree@archiver.kernel.org>; Mon, 28 Oct 2019 14:28:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727876AbfJ1O2x (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 28 Oct 2019 10:28:53 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:49557 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727148AbfJ1O2x (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 28 Oct 2019 10:28:53 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1iP60k-0003zY-2k; Mon, 28 Oct 2019 15:28:46 +0100
Message-ID: <c98fcd3bbd4e2166b2938fd2f8fa6f1a5a270384.camel@pengutronix.de>
Subject: Re: [PATCH 1/3] ARM: dts: imx6qdl: add TQMa6{S,Q,QP} SoM
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Shawn Guo <shawnguo@kernel.org>
Cc:     Markus Niebel <Markus.Niebel@tq-group.com>,
        Rob Herring <robh+dt@kernel.org>, kernel@pengutronix.de,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Date:   Mon, 28 Oct 2019 15:28:45 +0100
In-Reply-To: <20191026093356.GE14401@dragon>
References: <20191011143651.6424-1-p.zabel@pengutronix.de>
         <20191026093356.GE14401@dragon>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Shawn,

On Sat, 2019-10-26 at 17:34 +0800, Shawn Guo wrote:
> On Fri, Oct 11, 2019 at 04:36:49PM +0200, Philipp Zabel wrote:
> > From: Markus Niebel <Markus.Niebel@tq-group.com>
> > 
> > Add device trees for TQMa6S, TQMa6Q, and TQMa6QP embedded modules.
> > The A and B SoM variants are for hardware revisions that differ in
> > how the I2C devices are connected. For details, see [1].
> 
> It looks like a perfect case to be handled by DT overlay.
> Did you consider of using that?

I don't think using DT overlays is feasible. The EEPROM that could tell
us which variant we are running on is on the I2C bus that is different
between the two variants.

[...]
> > +&ecspi1 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_ecspi1>;
> > +	fsl,spi-num-chipselects = <1>;
> 
> Obsolete property.
> 
> > +	cs-gpios = <&gpio3 19 0>;
> 
> GPIO_ACTIVE_HIGH
> 
> > +	status = "okay";
> > +
> > +	flash: m25p80@0 {
> 
> Node name should be generic, while label can be specific.
> 
> > +		status = "okay";
> 
> Not really needed.
> 
[...]
> > +&iomuxc {
> > +	tqma6 {
> 
> Drop this container node.
> 
[...]
> > +		pinctrl_i2c1_tqma6: i2c1-tqma6grp {
> 
> The '_tqma6' suffix isn't really useful.
> 
[...]
> > +&pmic {
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_pmic>;
> > +		interrupt-parent = <&gpio6>;
> > +		interrupts = <10 8>;
> 
> IRQ_TYPE_LEVEL_LOW
> 
[...]
> > +	pmic: pf0100@8 {
> 
> Node name should be generic, while label can be specific.
> 
> > +		compatible = "fsl,pfuze100";
> > +		reg = <0x08>;
> > +	};
> > +
> > +	sensor0: lm75@48 {
> 
> Ditto
> 
> > +		compatible = "lm75";
> > +		reg = <0x48>;
> > +	};
> > +
> > +	eeprom0: m24c64@50 {
> 
> Ditto

Thank you, I'll fix these.

regards
Philipp

