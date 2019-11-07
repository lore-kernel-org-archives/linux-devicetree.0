Return-Path: <SRS0=C4ig=Y7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03539C43331
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 Nov 2019 21:11:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C9DC8222C2
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 Nov 2019 21:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573161093;
	bh=cyyNnznsZ2VTX91hnUs9mFGiygvXaCLNw5qOYVbMP+M=;
	h=In-Reply-To:References:From:To:Cc:Subject:Date:List-ID:From;
	b=K+woEeZxO2jxWpANpiYovrPPk1ujWXaSkh4e6AN7fe5DqDSmFU/w+OxjeKfOA9szT
	 LWGgpOteMFl2SMDJIK4hx65UqPOMMobx6LFH7GU3BxOT1U9BCQ07t7krW4KKfcUmI/
	 tj/2iNwAsvSAcblH2DZLr9dEfuxS6lzt/RYOZbAM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727431AbfKGVLd (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 7 Nov 2019 16:11:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:45886 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725893AbfKGVLd (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 7 Nov 2019 16:11:33 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 67BD520869;
        Thu,  7 Nov 2019 21:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573161092;
        bh=cyyNnznsZ2VTX91hnUs9mFGiygvXaCLNw5qOYVbMP+M=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=n2T/Y6RVUrii886yZ1xh+D3F7Nh07nbYwkgPFz9gXtyEM6zL7YrSov5UtZCcKU4y8
         ClIpEnSH+RhjiPwwFUQ1laJgx2mes5fTZ0d1tuGCTVoDCJsa/dhMSXgMwzLZcIuYKB
         jP733dsL+4jD+3Dp6s+wdhhPr7Zuh0BwRA5EjIxM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191014102308.27441-3-tdas@codeaurora.org>
References: <20191014102308.27441-1-tdas@codeaurora.org> <20191014102308.27441-3-tdas@codeaurora.org>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH v4 2/5] clk: qcom: common: Return NULL from clk_hw OF provider
User-Agent: alot/0.8.1
Date:   Thu, 07 Nov 2019 13:11:31 -0800
Message-Id: <20191107211132.67BD520869@mail.kernel.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Taniya Das (2019-10-14 03:23:05)
> Return NULL in the cases where the clk_hw is not registered with the
> clock provider, but the clock consumer still requests for a clock id.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Applied to clk-next

