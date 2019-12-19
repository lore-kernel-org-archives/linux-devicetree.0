Return-Path: <SRS0=R1yt=2J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBA18C43603
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Dec 2019 06:24:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 915B121582
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Dec 2019 06:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576736670;
	bh=9ucFM6ieRw8JTViyW14mSTF5OTy+e7tYNOpWXeDv534=;
	h=In-Reply-To:References:Cc:Subject:From:To:Date:List-ID:From;
	b=HwE2VHs2HVOxcNA4qX6+cE0VqsxKooJ7ZEerCp7Mjs4cKJ+7eFzOwTIBOx/eXVucW
	 PtxY9R64QCTF+ZtJEIzHXeAEWLVnisy0kIpF6yPB825dj/fw5DUE5XwAz4LX8m7vTS
	 Oy+Fz92zhvYR/xdC6MFCs1LWqtyWfixrjzHvS+Tk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725996AbfLSGY0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 19 Dec 2019 01:24:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:59562 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725844AbfLSGY0 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 19 Dec 2019 01:24:26 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 95B4021582;
        Thu, 19 Dec 2019 06:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576736665;
        bh=9ucFM6ieRw8JTViyW14mSTF5OTy+e7tYNOpWXeDv534=;
        h=In-Reply-To:References:Cc:Subject:From:To:Date:From;
        b=gOOyDZ3Yi+b6Ye1lqEWryZ1pVcC4fIS/K4tSg7tSof/M8AWnsWneQJOb3tLLQDLVI
         DVeLDXXPlF86+f1bFMUA/Rvw1foS080wQxh8zDhaXBa1o8pXSEUyT9+mpQVddKOtBG
         Y5Q8U3kmT4/1aM0IbEEO//v0DclgQBxYFCtF+xlI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191125135910.679310-2-niklas.cassel@linaro.org>
References: <20191125135910.679310-1-niklas.cassel@linaro.org> <20191125135910.679310-2-niklas.cassel@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, amit.kucheria@linaro.org,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Niklas Cassel <niklas.cassel@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/7] dt-bindings: mailbox: qcom: Add clock-name optional property
From:   Stephen Boyd <sboyd@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Niklas Cassel <niklas.cassel@linaro.org>
User-Agent: alot/0.8.1
Date:   Wed, 18 Dec 2019 22:24:24 -0800
Message-Id: <20191219062425.95B4021582@mail.kernel.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Niklas Cassel (2019-11-25 05:59:03)
> From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
>=20
> When the APCS clock is registered (platform dependent), it retrieves
> its parent names from hardcoded values in the driver.
>=20
> The following commit allows the DT node to provide such clock names to
> the platform data based clock driver therefore avoiding having to
> explicitly embed those names in the clock driver source code.
>=20
> Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Applied to clk-next

