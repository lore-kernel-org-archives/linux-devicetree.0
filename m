Return-Path: <SRS0=KHJB=AD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98740C433E0
	for <linux-devicetree@archiver.kernel.org>; Mon, 22 Jun 2020 08:49:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6E07720708
	for <linux-devicetree@archiver.kernel.org>; Mon, 22 Jun 2020 08:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592815750;
	bh=4HEWlYeRvxIvRSges7pAO5aRaRwsFOSSeGwtl3xDSFU=;
	h=In-Reply-To:References:Subject:From:To:Date:List-ID:From;
	b=wERoEIRwyfIJ4LbwcrXbaNVFTz0ln1EVs3lSOSD5XBV4nkgqU3DiKRmn8PX49RTly
	 nmulX7ymtw3Z5yDTihLQOxcG7c+02LnTUq3xGQAdshEfKDXpYfEd2Mc+HVVtur1fZ1
	 Rx7hy/vFPqBwDRoxhDty9w+FpptV3oILmBjiAYlI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726750AbgFVItK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 22 Jun 2020 04:49:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:34484 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725912AbgFVItJ (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 22 Jun 2020 04:49:09 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2FBC120578;
        Mon, 22 Jun 2020 08:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592815749;
        bh=4HEWlYeRvxIvRSges7pAO5aRaRwsFOSSeGwtl3xDSFU=;
        h=In-Reply-To:References:Subject:From:To:Date:From;
        b=e1qS1NwNxu2fbXIZpJfPv5WoOMStJg0SkM/rhuQnZg1I7l1+/SFPCLWELkKZHnW2d
         TRv6JCbzpcTZ10WgrBWQYIdlaYqZboxGSMCF2x6mFghLWGAFjZDhyXdH+qyGBFdHL4
         IH5sCx0MpwWa9zi8cAKFF8Havo8kICtkUC6jkcA4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1592800092-20533-2-git-send-email-sivaprak@codeaurora.org>
References: <1592800092-20533-1-git-send-email-sivaprak@codeaurora.org> <1592800092-20533-2-git-send-email-sivaprak@codeaurora.org>
Subject: Re: [PATCH V8 1/4] dt-bindings: clock: add ipq6018 a53 pll compatible
From:   Stephen Boyd <sboyd@kernel.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        mturquette@baylibre.com, robh+dt@kernel.org,
        sivaprak@codeaurora.org
Date:   Mon, 22 Jun 2020 01:49:08 -0700
Message-ID: <159281574856.62212.6298838433204836581@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Sivaprakash Murugesan (2020-06-21 21:28:09)
> cpus on ipq6018 are clocked by a53 pll, add device compatible for a53
> pll found on ipq6018 devices.
>=20
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> ---

Applied to clk-next
