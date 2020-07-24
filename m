Return-Path: <SRS0=+aE9=BD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FC59C433FC
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Jul 2020 08:52:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6D2742070B
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Jul 2020 08:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595580750;
	bh=AWiYpfSmyzMK/S9lSmhhXsUSjR/AQKLel/ZyRfZ+VVo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=dg/zWvuT2+38fFdytFSAygGNPZAN8f5/zK2TjELnHuSpvpkHxkVpqxnw2H7QuTnF1
	 BCDAeyd8QioIcUCCbOpLLiVnYbQFjqgQNRgIuFUoM4RGEH5mjoKYixSySCiJwgjKLi
	 JnoQkR/D9vLRerx8qcppNJjqfkYzn/yEig6+ZSVQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727818AbgGXIw3 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 24 Jul 2020 04:52:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:37250 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726554AbgGXIw0 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 24 Jul 2020 04:52:26 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6DA51206EB;
        Fri, 24 Jul 2020 08:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595580746;
        bh=AWiYpfSmyzMK/S9lSmhhXsUSjR/AQKLel/ZyRfZ+VVo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=GQ0RV0NWHThbEZTzpbOfQb9ubnuxjTbUoU79ghcXNT2PSXuztTL7jOR8WFjiCQYOh
         re5hdsZB+L3hew7nMrX/I+F6acx+R+IrPipZFHlMTbDEp3p5RtCwscH9jM8miZaCme
         wZC0lbsyqjvfskvcDFHpAH9IfgYRtttFkMxa/h8c=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200709135251.643-7-jonathan@marek.ca>
References: <20200709135251.643-1-jonathan@marek.ca> <20200709135251.643-7-jonathan@marek.ca>
Subject: Re: [PATCH v3 06/14] dt-bindings: clock: combine qcom,sdm845-gpucc and qcom,sc7180-gpucc
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Date:   Fri, 24 Jul 2020 01:52:25 -0700
Message-ID: <159558074580.3847286.1666590352382090051@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Jonathan Marek (2020-07-09 06:52:37)
> These two bindings are almost identical, so combine them into one. This
> will make it easier to add the sm8150 and sm8250 gpucc bindings.
>=20
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---

Applied to clk-next
