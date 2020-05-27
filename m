Return-Path: <SRS0=aO3b=7J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BD85C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 May 2020 02:40:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 30FF5207CB
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 May 2020 02:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1590547202;
	bh=rRk0cxGlFOisiUI6iZo/i2T81WZrcr6lxzYbxwBlOZY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=tMG4uqkubZdc6YK/md+qx8mUYqbHtg1J1Hr404dnixDkkV9UxQUCfbMM/8Mp95ipO
	 bN7+aYTpZFuA1Zpc1CK9JkHfSCoW2ftl1B5aLkXQhk+AiBoNgDCl63AOJGiJex+sj8
	 3FxBz0GSa9j44TRdLZmQ6bz6lmwJ1O3JLLhpbCto=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727026AbgE0Cj7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 26 May 2020 22:39:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:44312 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725267AbgE0Cj6 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 26 May 2020 22:39:58 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5B82C207CB;
        Wed, 27 May 2020 02:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590547198;
        bh=rRk0cxGlFOisiUI6iZo/i2T81WZrcr6lxzYbxwBlOZY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ADbo0VHHFvZcXsYjf3dEoUQiwaGgCknpUnx1wSZLqx13c6nYth7ElqFP9z2LIGRK4
         IA8FGLF7tKfd8Nmg0iOuuhJROIRB+1QKGHklK2N9vHQRVX96p5yudEvxCpnNNeCoLX
         /EGQkR92KBInAHZOQsj0cEFTgXyQwVob6pcUpqeE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200517131348.688405-2-bryan.odonoghue@linaro.org>
References: <20200517131348.688405-1-bryan.odonoghue@linaro.org> <20200517131348.688405-2-bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v5 1/2] clk: qcom: Add DT bindings for MSM8939 GCC
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        shawn.guo@linaro.org, p.zabel@pengutronix.de,
        vincent.knecht@mailoo.org, konradybcio@gmail.com,
        bryan.odonoghue@linaro.org
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org
Date:   Tue, 26 May 2020 19:39:57 -0700
Message-ID: <159054719765.88029.7139951382004440958@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Bryan O'Donoghue (2020-05-17 06:13:47)
> Add compatible strings and the include files for the MSM8939 GCC.
>=20
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Tested-by: Vincent Knecht <vincent.knecht@mailoo.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Applied to clk-next
