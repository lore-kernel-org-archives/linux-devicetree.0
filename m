Return-Path: <SRS0=GOr1=2C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF273C43603
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 01:41:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A95B422527
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 01:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576114908;
	bh=CSgfeyRS6Qck1tWShVAUaL1hhLTnFqNxjE6l1DED9ZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=LAgDb4JIQlzURIlpFnxy+rm7bqUb15FJnWO+sGZ4eLCxvy2FZ5rDxFxv5ZDPHBb00
	 2FHlcfOjDDk+TZ3Ln3uYP1K197dUKeoS6bJWNoRDWRmcvw4QHORcvemeOym/wi/dTW
	 sBRFaw5hqvthF92Inv/x1qR9xIOephT4ddSXfJBY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727516AbfLLBls (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 11 Dec 2019 20:41:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:45530 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727509AbfLLBls (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 11 Dec 2019 20:41:48 -0500
Received: from dragon (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D8B7D2077B;
        Thu, 12 Dec 2019 01:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576114907;
        bh=CSgfeyRS6Qck1tWShVAUaL1hhLTnFqNxjE6l1DED9ZU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fqNw8OCERhxz18dncWAP4oOqpSbTMpX2OLneqxHMP9gURInlmpu07rvcA4DTsAtjM
         gIvhM1AAhN2wU3tBVOkXstWtiG0/QOXphqBFoQHON+ACzKZ74P9Z4qT9N3iGHfumId
         QSt0e9M1egittPCgodfwCSEqMI2JlwhkrejhY8Jg=
Date:   Thu, 12 Dec 2019 09:41:35 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Christoph Fritz <chf.fritz@googlemail.com>
Cc:     Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Mark Brown <broonie@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Support Opensource <Support.Opensource@diasemi.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 4/4] ARM: dts: phycore-imx6: set buck regulator modes
 explicitly
Message-ID: <20191212014132.GA15858@dragon>
References: <1573652416-9848-1-git-send-email-chf.fritz@googlemail.com>
 <1573652416-9848-5-git-send-email-chf.fritz@googlemail.com>
 <AM5PR1001MB099480739860863EB08EA73280760@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <1574973044.2362.11.camel@googlemail.com>
 <20191204125336.GM3365@dragon>
 <1576090586.2695.1.camel@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1576090586.2695.1.camel@googlemail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Dec 11, 2019 at 07:56:26PM +0100, Christoph Fritz wrote:
> On Wed, 2019-12-04 at 20:53 +0800, Shawn Guo wrote:
> > On Thu, Nov 28, 2019 at 09:30:44PM +0100, Christoph Fritz wrote:
> > > Hi Shawn,
> > > 
> > >  any chance to get this patch queued for the upcoming kernel?
> > 
> > Sorry, no.  I need to wait for DA9063_BUCK_MODE_SYNC landing on 5.5-rc1,
> > and then apply this DTS patch.
> 
> 
> DA9063_BUCK_MODE_SYNC is now available in 5.5-rc1, could you queue this
> patch now?

Done.  Thanks for reminding.

Shawn
