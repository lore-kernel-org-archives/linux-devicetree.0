Return-Path: <SRS0=leSB=Z7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9754BC2D0C0
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 01:16:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 64280206E0
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 01:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1575854168;
	bh=JvEqpVrun2YFKcAtg6Xj2oyqoVae03jHhJjp7UzZIxc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=IrUEzXlmSaiwyxvR4y7BYk/xYqWYJQULIYWSiC3xIO0Yyj+Td+nby8IoowJwKVHi4
	 f54Sw1P0rYq/CNQEebnUVk875CPCZXpwzIRwhZrtHQli+VjaTxq/joT9A8SEJDrtcQ
	 Et4zrilzo8bJcyNSTDkMiuvmqHBCA3u29gYZ+5mQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726706AbfLIBQH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 8 Dec 2019 20:16:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:50696 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726596AbfLIBQH (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sun, 8 Dec 2019 20:16:07 -0500
Received: from dragon (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0A24E20637;
        Mon,  9 Dec 2019 01:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575854167;
        bh=JvEqpVrun2YFKcAtg6Xj2oyqoVae03jHhJjp7UzZIxc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bCetXA8zlxofpxOJnSTSxk8/VGNyVXYVLdCm5bWaSb/bct+q6Vau0FihIpkRVeL+5
         fKtcJgh5nGuqGBfapZhzrdf+kC00lApH3Nmgg6sfHsYvn+vB9z3US/GKRsW5OR5glt
         PVPwBGO5KEcr7oCc8awsguy43GOBTcTzA+1L0kPI=
Date:   Mon, 9 Dec 2019 09:15:47 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Leonard Crestez <leonard.crestez@nxp.com>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Artur =?utf-8?B?xZp3aWdvxYQ=?= <a.swigon@partner.samsung.com>,
        Saravana Kannan <saravanak@google.com>,
        Angus Ainslie <angus@akkea.ca>,
        Martin Kepplinger <martink@posteo.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alexandre Bailon <abailon@baylibre.com>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Silvano di Ninno <silvano.dininno@nxp.com>,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-imx@nxp.com,
        kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 1/5] clk: imx8m: Set CLK_GET_RATE_NOCACHE on dram
 clocks
Message-ID: <20191209011546.GQ3365@dragon>
References: <cover.1574458460.git.leonard.crestez@nxp.com>
 <f25ec4f3793aaf60489226cb21633eb76f847210.1574458460.git.leonard.crestez@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f25ec4f3793aaf60489226cb21633eb76f847210.1574458460.git.leonard.crestez@nxp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Nov 22, 2019 at 11:45:00PM +0200, Leonard Crestez wrote:
> These clocks are only modified as part of DRAM frequency switches during
> which DRAM itself is briefly inaccessible. The switch is performed with
> a SMC call to by TF-A which runs from a SRAM area; upon returning to
> linux several clocks bits are modified and we need to update them.
> 
> For rate bits an easy solution is to just mark with
> CLK_GET_RATE_NOCACHE so that new rates are always read back from
> registers.
> 
> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
> Reviewed-by: Abel Vesa <abel.vesa@nxp.com>

Applied, thanks.
