Return-Path: <SRS0=vpWr=22=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94740C00523
	for <linux-devicetree@archiver.kernel.org>; Sun,  5 Jan 2020 07:26:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5FDD4206F0
	for <linux-devicetree@archiver.kernel.org>; Sun,  5 Jan 2020 07:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578209170;
	bh=rPfglwdJqeEZXf5vWDd4ttjNMd8Ue3VnVSRMo5DzdRY=;
	h=In-Reply-To:References:Cc:Subject:To:From:Date:List-ID:From;
	b=bNtS5UQx+vGWH5NTMvT5cpvUu2NekBHzmU6l2B2Bv1AuHeYaU4AD4+f5U9ARL2dlM
	 bT5Yhd5ugco0EWHSyNdVsrS7OfxVYADWON2OIb5obKByU8kxbHzk4oYP7YSfsFU/XD
	 RxXXkVxi4FHNjhqiT/P4ngphKtYlZAjdag8hAo8Q=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725828AbgAEH0J (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 5 Jan 2020 02:26:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:46814 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725535AbgAEH0I (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sun, 5 Jan 2020 02:26:08 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EE870206F0;
        Sun,  5 Jan 2020 07:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578209168;
        bh=rPfglwdJqeEZXf5vWDd4ttjNMd8Ue3VnVSRMo5DzdRY=;
        h=In-Reply-To:References:Cc:Subject:To:From:Date:From;
        b=ttgqc2m0Qz/o5uam9J+3rXFoKS8mjVr1eSbGrmzxfzgOYZgJW06bRTXB/C3o2cyOn
         9WBYEoOOeCgEfBMinI6Po5t3rVP98WSB0uxS9cDH7YsRM15xqwamrgseiudF2oHHi9
         ntYeMg660I7UQ1he4bnrJUI1AZvCEvM4VEvAjTh0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1577428714-17766-2-git-send-email-tdas@codeaurora.org>
References: <1577428714-17766-1-git-send-email-tdas@codeaurora.org> <1577428714-17766-2-git-send-email-tdas@codeaurora.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH v3 1/6] dt-bindings: clock: Add YAML schemas for the QCOM GPUCC clock bindings
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Sat, 04 Jan 2020 23:26:07 -0800
Message-Id: <20200105072607.EE870206F0@mail.kernel.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Taniya Das (2019-12-26 22:38:29)
> The GPUCC clock provider have a bunch of generic properties that
> are needed in a device tree. Add a YAML schemas for those.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Applied to clk-next

