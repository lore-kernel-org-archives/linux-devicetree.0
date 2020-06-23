Return-Path: <SRS0=lOvj=AE=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B976C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 23 Jun 2020 02:01:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5776220768
	for <linux-devicetree@archiver.kernel.org>; Tue, 23 Jun 2020 02:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592877705;
	bh=DVCwmDI7SriaJLrzMvjHQG+18xyE1s32Rh7MNaMftfQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=tfTpuAkHoPvlxuLwcuPB9OA5sxt+HQav1NNxtxwG/gKEj8O7FsVOZwQ+wa33jerNk
	 Rs/PFIXLtNielhbjWVfC5TPEXMf07cYrqvlBHxOZBqtHVwZ6CUOFZteSs+IqbMMOah
	 jw1lbt8hob1z+0DqJm9a4vvEvRsKYWouRqqXFcWU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728664AbgFWCBo (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 22 Jun 2020 22:01:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:40734 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727033AbgFWCBo (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 22 Jun 2020 22:01:44 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EDCB72075A;
        Tue, 23 Jun 2020 02:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592877704;
        bh=DVCwmDI7SriaJLrzMvjHQG+18xyE1s32Rh7MNaMftfQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=WXGtryveaBYOKb8Big8mps4OtMnFJdyd9izZRULrJwBEFMSxFX8RpeCwagGht43GW
         LX8/gePOf2sLmwsnC3QQr/avg43GyXvsZ4BRhzrQS4ZXLoOupNyw1igSZ10Dw6f0kL
         M0NVwHdtPHwbH60vMn3lSg9Eo2PBymlxaLQIKX/Y=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200613072745.1249003-2-vincent.knecht@mailoo.org>
References: <20200613072745.1249003-1-vincent.knecht@mailoo.org> <20200613072745.1249003-2-vincent.knecht@mailoo.org>
Subject: Re: [PATCH v4 1/4] clk: qcom: smd: Add support for MSM8936 rpm clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     konradybcio@gmail.com, Vincent Knecht <vincent.knecht@mailoo.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Vincent Knecht <vincent.knecht@mailoo.org>
Date:   Mon, 22 Jun 2020 19:01:43 -0700
Message-ID: <159287770331.62212.336675204157113224@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Vincent Knecht (2020-06-13 00:27:42)
> Add missing definition of rpm clk for msm8936 soc (also used by msm8939)
>=20
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> ---

Applied to clk-next
