Return-Path: <SRS0=jMr8=BA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE6C3C433E5
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jul 2020 08:52:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B62CB20720
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jul 2020 08:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595321538;
	bh=7lqh5LYN2ohmEW7oZl2tK1vd+xfmFTKm5J8P41UN7Os=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=edYSxHCHNCKELSFx+GVPejPTFviT9N7Vzu2p7BthhxMi+qx4p1tFfRjrVaASj1JT7
	 duGKz1dqtQhGpyJig+pmidFl7wJgy5Nez5Kl5D24pMesL2XD4FVxL62YhHiWmyorAr
	 fAw4Pa2mv0tyN7P8AcXxP/Dnu+gRXYe29uYuO3S8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728588AbgGUIwS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 21 Jul 2020 04:52:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:59258 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725984AbgGUIwR (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 21 Jul 2020 04:52:17 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 82F8420717;
        Tue, 21 Jul 2020 08:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595321537;
        bh=7lqh5LYN2ohmEW7oZl2tK1vd+xfmFTKm5J8P41UN7Os=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=YdxEjNSLzuIVoWZaK1uI5ZvV0U9yFRDJ9cFtpLIGY8Om2/re2o4tCxYsCNHsoCScM
         5BGUa/42NlbaH/2Vii7dDo7ElbhT+NrLMG/YmDJXMgURQyvlKGEyAV4XASGwt11TWr
         EXFKjYp7MzbcOdydRPUtxw0kejazBmzyzDnWbF9k=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <87964ae012e513597b8b4c7be2e7ac332a70087a.1593788312.git.cristian.ciocaltea@gmail.com>
References: <cover.1593788312.git.cristian.ciocaltea@gmail.com> <87964ae012e513597b8b4c7be2e7ac332a70087a.1593788312.git.cristian.ciocaltea@gmail.com>
Subject: Re: [PATCH v3 3/6] clk: actions: Add APB, DMAC, GPIO clock support for Actions S500 SoC
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-actions@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org
To:     Andreas =?utf-8?q?F=C3=A4rber?= <afaerber@suse.de>,
        Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>
Date:   Tue, 21 Jul 2020 01:52:16 -0700
Message-ID: <159532153690.3847286.13398003367179921316@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Cristian Ciocaltea (2020-07-03 10:05:09)
> Add support for the missing APB, DMAC and GPIO clocks in the Actions
> Semi S500 SoC clock driver.
>=20
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
> ---

Applied to clk-next
