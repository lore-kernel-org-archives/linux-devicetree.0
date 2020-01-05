Return-Path: <SRS0=vpWr=22=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDBD3C00523
	for <linux-devicetree@archiver.kernel.org>; Sun,  5 Jan 2020 07:26:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B582621775
	for <linux-devicetree@archiver.kernel.org>; Sun,  5 Jan 2020 07:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578209174;
	bh=AaxJyJZez/kUvPrXn81+5EJ88jbhm5UxfCi0vNOtxmA=;
	h=In-Reply-To:References:Cc:Subject:To:From:Date:List-ID:From;
	b=Y1Mljlo77i/VN1v2IdpmFOHlcNRM81HRX3tJZVdxOOwfnfXB9/i+5nxPVJgcZG7m0
	 Wxi3uvTaAzzRfZrG6t9h4mBqBS7JIKemgMCyQfYJWocZvYG/5wcVU0H+uCrQz6hXdv
	 E53F5UrVVj9Zx4YPLB0u2YzsSbUNZlxLRwch+oME=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbgAEH0O (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 5 Jan 2020 02:26:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:47020 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725535AbgAEH0O (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sun, 5 Jan 2020 02:26:14 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 539D6206F0;
        Sun,  5 Jan 2020 07:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578209173;
        bh=AaxJyJZez/kUvPrXn81+5EJ88jbhm5UxfCi0vNOtxmA=;
        h=In-Reply-To:References:Cc:Subject:To:From:Date:From;
        b=1g46MeS/3RocYHGJmv1FpR1PQ4KDuy7w+3CWBjYzgSWtGadPlO2I6DgzsYxudWIj1
         cr0XjyME6XTLvMe9ZAvpddlxHCSzhaU21fM/IDN0sNwLvMYvTb0BQrcuzwuSzdWC+J
         bKR7ZyfC6nCu9hHrreB48aYoloG/eR3rNoiuSGtI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1577428714-17766-3-git-send-email-tdas@codeaurora.org>
References: <1577428714-17766-1-git-send-email-tdas@codeaurora.org> <1577428714-17766-3-git-send-email-tdas@codeaurora.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH v3 2/6] dt-bindings: clock: Introduce QCOM Graphics clock bindings
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Sat, 04 Jan 2020 23:26:12 -0800
Message-Id: <20200105072613.539D6206F0@mail.kernel.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Taniya Das (2019-12-26 22:38:30)
> Add device tree bindings for graphics clock controller for
> Qualcomm Technology Inc's SC7180 SoCs.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-next

