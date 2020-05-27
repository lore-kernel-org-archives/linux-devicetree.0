Return-Path: <SRS0=aO3b=7J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE517C433E0
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 May 2020 02:33:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9C8C220704
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 May 2020 02:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1590546786;
	bh=gk+v1W3sTYJPEzW3+3ygR/9TYoYK2pJAj1PW78DaVuM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=IDrtYNfZiCQVRA9GU2MEpRV7Hz5d6PrQgOdb6YEUBZTxzWvpaTipyUDUy2Odr+5s2
	 BvuWi56zqDThV6JgXxDNMcdij6/csrYq549EQIhsiRth3OIdOtqK8FGym+nTON885h
	 0J82RlAjMwvAov1/hViPfwx3U6loNXKUR7x5onWk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728099AbgE0CdC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 26 May 2020 22:33:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:41566 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728066AbgE0CdC (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 26 May 2020 22:33:02 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 05A4D20704;
        Wed, 27 May 2020 02:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590546782;
        bh=gk+v1W3sTYJPEzW3+3ygR/9TYoYK2pJAj1PW78DaVuM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=2nQt1LVAcYcVnZ9lRugFlh5sQH7zpKj709aMUZzOF3D8WtdIuSCk8otZ9/Dz0AObC
         JgDxMzmaqcob+gBBhqSqx8DMxMHB0eiBxM+EAo3kegeNBQHK16rh2dK1UU0wBDE5Or
         0/jxVUJCTjdv/WaxpFvC37MLQnMmvzs1ak4r030g=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1590314686-11749-6-git-send-email-sivaprak@codeaurora.org>
References: <1590314686-11749-1-git-send-email-sivaprak@codeaurora.org> <1590314686-11749-6-git-send-email-sivaprak@codeaurora.org>
Subject: Re: [PATCH V5 5/8] clk: qcom: Add ipq6018 apss clock controller
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Sivaprakash Murugesan <sivaprak@codeaurora.org>
To:     Sivaprakash Murugesan <sivaprak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        mturquette@baylibre.com, robh+dt@kernel.org
Date:   Tue, 26 May 2020 19:33:01 -0700
Message-ID: <159054678130.88029.13011652297143700687@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Sivaprakash Murugesan (2020-05-24 03:04:43)
> The CPU on Qualcomm ipq6018 devices are clocked primarily by a aplha PLL
> and xo which are connected to a mux and enable block.
>=20
> Add support for the mux and enable block which feeds the CPU on ipq6018
> devices.
>=20
> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
