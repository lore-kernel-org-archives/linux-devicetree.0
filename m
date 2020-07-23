Return-Path: <SRS0=BM7I=BC=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 550BFC433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jul 2020 01:05:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2FC4A22B43
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jul 2020 01:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595466354;
	bh=iRbOAxtH5+pJ15BJ3w67pYcbz/CDee24tmmZCiqgo0Q=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=YWipuGHheqhkiy3v1TMzaCYaqWejnFrPCoFEf+CU8oH1QwQD2Ok5LecPMCbxEaAb2
	 GEwVAlR6BpdXxg03EqusStd11xGwFpTodKUaD1OcUDq95qp1EOAoPFJf++0Pd6FQTm
	 CakiEXQTMGQ1cpTr+4kTa9yGy/blpUjWxBFKFeOU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387447AbgGWBFx (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 22 Jul 2020 21:05:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:52174 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733270AbgGWBFx (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 22 Jul 2020 21:05:53 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BF43A20888;
        Thu, 23 Jul 2020 01:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595466352;
        bh=iRbOAxtH5+pJ15BJ3w67pYcbz/CDee24tmmZCiqgo0Q=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=DZlr89v06R9OrgbUpzo+ijAn6yQ1pk3jdPBf1EnyyEjtzJOgvPOj3oYLpyRZ4FxzS
         DIqaUDVsOq7mBzC23Ilh50pN3u1fdS3N8ddvgjOk5bjFmTXMtbJauutYDDX6xNfFIh
         FjZfnWPphbGFlbQMOnrGUX9QcsM9CBD2YghUvAhM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1595326714-20485-1-git-send-email-loic.poulain@linaro.org>
References: <1595326714-20485-1-git-send-email-loic.poulain@linaro.org>
Subject: Re: [PATCH] dt-bindings: clock: Fix qcom,msm8996-apcc yaml syntax
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, robh+dt@kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Date:   Wed, 22 Jul 2020 18:05:52 -0700
Message-ID: <159546635209.3847286.1865779201544237381@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Loic Poulain (2020-07-21 03:18:34)
> Fix errors reported by dt_binding_check.
> - Fix literal block scalar for dts example
> - Fix schema identifier URI
>=20
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---

Applied to clk-next
