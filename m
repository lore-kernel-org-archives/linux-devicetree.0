Return-Path: <SRS0=1bdf=5G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C652FC4332B
	for <linux-devicetree@archiver.kernel.org>; Sat, 21 Mar 2020 00:06:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8B48120788
	for <linux-devicetree@archiver.kernel.org>; Sat, 21 Mar 2020 00:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584749169;
	bh=aqc1nwxD2JVKkvrOl3kWSCll9YVmqSIDMks9uATyyG8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=UHpje2k6qbNFPnzbMxuXAMOzyX50y55FD44WkEe0u5jPthR4VpXlbIGNUmGPCbu7l
	 Wo7H+VqdsjP35viwa7Ch6CtgYg8+QVJfUfus8G5n1t/oIQ1r2XqaY9pBJkgIkFAts9
	 i7Y/zvcfiMdayRT43IqMb6YxKr07jwmZ4SOj6E6E=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727693AbgCUAGJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 20 Mar 2020 20:06:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:50106 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727650AbgCUAGI (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 20 Mar 2020 20:06:08 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2CFA020777;
        Sat, 21 Mar 2020 00:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584749168;
        bh=aqc1nwxD2JVKkvrOl3kWSCll9YVmqSIDMks9uATyyG8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ClC5dOV8QR9KK+Zq8oUQh5C/7iRhf3yloDptsKdGBEQcWDFezB3p2RzDsnmdslXkR
         SuD884ExJU2+R1qXwTIrZV0BmIblCO3FXG2zMi/CJosLX106gYIzZXRXethR6rQif+
         WY6vfmoTq5jRudWWCCyDMc+VzE26TLfsidQWTlZ0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200227053529.16479-3-vigneshr@ti.com>
References: <20200227053529.16479-1-vigneshr@ti.com> <20200227053529.16479-3-vigneshr@ti.com>
Subject: Re: [PATCH v4 2/2] clk: keystone: Add new driver to handle syscon based clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo <t-kristo@ti.com>
To:     Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
Date:   Fri, 20 Mar 2020 17:06:07 -0700
Message-ID: <158474916743.125146.2512565488728319970@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Vignesh Raghavendra (2020-02-26 21:35:29)
> On TI's AM654/J721e SoCs, certain clocks can be gatemld/ungated by settin=
g a
> single bit in SoC's System Control Module registers. Sometime more than
> one clock control can be in the same register.
> Add a driver to support such clocks using syscon framework.
> Driver currently supports controlling EHRPWM's TimeBase clock(TBCLK) for
> AM654 SoC.
>=20
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> ---

Applied to clk-next
