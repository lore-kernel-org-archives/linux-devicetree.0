Return-Path: <SRS0=+D0Y=AB=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21F6BC433E0
	for <linux-devicetree@archiver.kernel.org>; Sat, 20 Jun 2020 00:30:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EBA4720720
	for <linux-devicetree@archiver.kernel.org>; Sat, 20 Jun 2020 00:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592613030;
	bh=7EPgvva+Usv5H9aZt5XizQLBZ5cDZ9Jt7V0YNCRj2UE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=xqWpPMZPqgj6eBcGvmIwYfpy+JUf+1Z2FjWmAzBP/3I6R/FUOY1/yD/XkqRGKKXrZ
	 OI0noctggtphGAOg45lbFASn00PpeNSMZr+IMFsMUPjrZTTK3h7IGTnWNMHX1Xc5JY
	 +WyB6XgjWCgRoQsHskTi2wXZESvctBhaCJtHhWoM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730879AbgFTAa3 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 19 Jun 2020 20:30:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:45142 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730293AbgFTAa2 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 19 Jun 2020 20:30:28 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 64D3620720;
        Sat, 20 Jun 2020 00:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592613028;
        bh=7EPgvva+Usv5H9aZt5XizQLBZ5cDZ9Jt7V0YNCRj2UE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=uAp/kZgq0KPozY5ojUrpl1lV3hecnj1B0RG5QWEqd9y8I9QnBPPnR0683YxQGzuc5
         MxJsM4eXqTgp2XcpTfOSI+TAks4W4sdX6Kz0MVpYfMdHobafaITE4XM1zh1+PNunQc
         ZermEzAXtzq30AclBN0O9XUJiQ5JHI7ZY5oNUTDc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1591809487-5588-1-git-send-email-tdas@codeaurora.org>
References: <1591809487-5588-1-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v3 0/4] clk: qcom: Support for Low Power Audio Clocks on SC7180
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Fri, 19 Jun 2020 17:30:27 -0700
Message-ID: <159261302777.62212.6490805842260028406@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Taniya Das (2020-06-10 10:18:03)
> [v3]
>  * Update the clock-name to iface instead of gcc_lpass_sway.
>  * Update the documentation with the reg descriptions and use maxItems.
>=20

Most patches look good minus Rob's DT binding comment. Can you resend?
