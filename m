Return-Path: <SRS0=aO3b=7J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB6F6C433E0
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 May 2020 02:26:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BF479208B6
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 May 2020 02:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1590546368;
	bh=NdzkN7GEzx3e6z02TMSvCVeeam03mqmIjrSd5mn7py4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=gRTQ8Pux+xNLK9w+drhrT9d6F//RcRSOrk57Jr9R7uwjWSUC0/EaCwFIrGnHnMTgu
	 hA1oFGitR11JLqLIyrqWPTPnj/HOBHMRZG9xpQdltDM657NdvCetJwevpkcGUH02G7
	 fgYf/MYxb6TJUP7+AyXn2bhuIEZOi+oyyuOIlDig=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727063AbgE0C0F (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 26 May 2020 22:26:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:39236 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725905AbgE0C0F (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 26 May 2020 22:26:05 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 85D77206F1;
        Wed, 27 May 2020 02:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590546364;
        bh=NdzkN7GEzx3e6z02TMSvCVeeam03mqmIjrSd5mn7py4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=FUW1+GK/6+0X9xG2Dm0L5JOITZ96DjgRytbFP4spEnXs2FDYyqYeLkFF/g4D2Emvo
         OBBgFsI4G4iw0Wt/7SZoUDJ++HysaG+2K+wIUQMMcfEsF+wpItBr+PJoL4WKbJ9x3Y
         0ryXErnMKWqonw0EypESQyJyfwCKqHtKFU74RAN0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1590314686-11749-3-git-send-email-sivaprak@codeaurora.org>
References: <1590314686-11749-1-git-send-email-sivaprak@codeaurora.org> <1590314686-11749-3-git-send-email-sivaprak@codeaurora.org>
Subject: Re: [PATCH V5 2/8] dt-bindings: clock: add ipq6018 a53 pll compatible
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Sivaprakash Murugesan <sivaprak@codeaurora.org>
To:     Sivaprakash Murugesan <sivaprak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        mturquette@baylibre.com, robh+dt@kernel.org
Date:   Tue, 26 May 2020 19:26:03 -0700
Message-ID: <159054636390.88029.3685382044224932374@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Sivaprakash Murugesan (2020-05-24 03:04:40)
> cpus on ipq6018 are clocked by a53 pll, add device compatible for a53
> pll found on ipq6018 devices.
>=20
> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> ---
> [V5]
>  * Addressed Bjorn's review comment.
>    now the a53 dt-binding represents ipq a53 pll as well.
>  .../devicetree/bindings/clock/qcom,a53pll.yaml         | 18 ++++++++++++=
++++++
>  1 file changed, 18 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml b/D=
ocumentation/devicetree/bindings/clock/qcom,a53pll.yaml
> index 20d2638..972db15 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
> @@ -16,6 +16,7 @@ description:
>  properties:
>    compatible:
>      const: qcom,msm8916-a53pll
> +    const: qcom,ipq6018-a53pll

Sort alphabetical?

> =20
>    reg:
>      maxItems: 1
