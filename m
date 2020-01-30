Return-Path: <SRS0=K0Un=3T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 901A5C35240
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Jan 2020 18:09:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5DFF3206F0
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Jan 2020 18:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1580407757;
	bh=b+Yfsr+qnQpqIYAQkQeI7TidveJ/L9BP9YvFsxRIRcQ=;
	h=In-Reply-To:References:Subject:To:From:Cc:Date:List-ID:From;
	b=WMgJCz1nfRBxl8MHvw3b2zd/2XB7CDhn4sWcs+h2PlHMM5OU+ppci4wl8ro2K7VJX
	 pqgQrGkm8Fdb+HTCWBK/Yew5/ikrhHFPppbssp8U+IBGN/yf63C4UMAhnusFcogkXK
	 Kp2o4nU3rn3CYPVxLjf0cpi1F2zF3BohH+gXPQzY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728220AbgA3SJQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 30 Jan 2020 13:09:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:38756 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728218AbgA3SJQ (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 30 Jan 2020 13:09:16 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E025D20CC7;
        Thu, 30 Jan 2020 18:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580407756;
        bh=b+Yfsr+qnQpqIYAQkQeI7TidveJ/L9BP9YvFsxRIRcQ=;
        h=In-Reply-To:References:Subject:To:From:Cc:Date:From;
        b=W25G7wX/24cDyJrSjCvtu/r8bNDUnFXI9VHKVxQ/gwANDkWCbNWVov0p8QN0lw1f/
         MqSCIDF1o6vgH5pHASjjbJMfBipcAJslUoiLwCk70Dx9pp4hvwHh4bIvGKtsIo575X
         5M6MQyUfnPXGCubZFmu9DtTPWIZB6TL0zAQQMrQo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1580357923-19783-3-git-send-email-tdas@codeaurora.org>
References: <1580357923-19783-1-git-send-email-tdas@codeaurora.org> <1580357923-19783-3-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: clock: Introduce QCOM Modem clock bindings
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Thu, 30 Jan 2020 10:09:15 -0800
Message-Id: <20200130180915.E025D20CC7@mail.kernel.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Taniya Das (2020-01-29 20:18:42)
> Add device tree bindings for modem clock controller for
> Qualcomm Technology Inc's SC7180 SoCs.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  include/dt-bindings/clock/qcom,gcc-sc7180.h |  5 +++++
>  include/dt-bindings/clock/qcom,mss-sc7180.h | 12 ++++++++++++

Split this into two as well.

