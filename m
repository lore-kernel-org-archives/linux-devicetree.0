Return-Path: <SRS0=Fzrg=42=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53F30C3F2C6
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Mar 2020 22:13:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2F9E42465A
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Mar 2020 22:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583791991;
	bh=c0EYPdBI/oMFX5eJ5Bi5/wrQAWTOJvVhIy+ZUOUGOiw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=CV8jf5EPzjM0WDHOCbBLoqEx2lBGh5qBDUCmriMDbbDzFwQEqydIRMqSsH36Y5Lwl
	 F3IuecDzLU18AxIgaWWA/aHy9UIyT6AgQWi8tfejt7anohrLXsKJCoL7mVmJkqBf9X
	 lelr+l6S3g4dw2Xi7RuhfD1sGjhwg2jJG8ILiwhY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726937AbgCIWNK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 9 Mar 2020 18:13:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:56172 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726656AbgCIWNK (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 9 Mar 2020 18:13:10 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E0A1724654;
        Mon,  9 Mar 2020 22:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583791990;
        bh=c0EYPdBI/oMFX5eJ5Bi5/wrQAWTOJvVhIy+ZUOUGOiw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=gWHwPgK9PoYh9cGu0HnctQu4SyTu7AYRyKyJ5TxWUyLMWVYQzNp8vsVH+lL3UVZko
         mFCbBWZhTV3kSvSkaXbG9w+/z+L9uxLf3f3vOVPm7GvSesZ+BnDbvQN43ZOpReyGbX
         Z7bxsNS0llAiVUComFct1pJQN5TUKxRTX0IBKAa0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191031112951.35850-2-kholk11@gmail.com>
References: <20191031112951.35850-1-kholk11@gmail.com> <20191031112951.35850-2-kholk11@gmail.com>
Subject: Re: [PATCH 1/2] clk: qcom: smd: Add support for MSM8976 rpm clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     kholk11@gmail.com, marijns95@gmail.com, agross@kernel.org,
        mturquette@baylibre.com, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
To:     kholk11@gmail.com, linux-arm-msm@vger.kernel.org
Date:   Mon, 09 Mar 2020 15:13:09 -0700
Message-ID: <158379198920.66766.677819434602725331@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting kholk11@gmail.com (2019-10-31 04:29:50)
> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
>=20
> Add rpm smd clocks, PMIC and bus clocks which are required on MSM8976,
> MSM8956 (and APQ variants) for clients to vote on.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> ---

Applied to clk-next
