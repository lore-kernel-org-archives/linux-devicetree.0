Return-Path: <SRS0=v23k=2O=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49D50C2D0C0
	for <linux-devicetree@archiver.kernel.org>; Tue, 24 Dec 2019 02:38:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1C4FE2070E
	for <linux-devicetree@archiver.kernel.org>; Tue, 24 Dec 2019 02:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1577155114;
	bh=aAS8hVJVOa0Xu/5YjDckkYv+i7U3AxWC41mTypuMheQ=;
	h=In-Reply-To:References:Cc:From:To:Subject:Date:List-ID:From;
	b=1Awqp1/OSYRopJikbHJcbYWSRmHmFCEnurTN/pNz8dfMbx28OgVtrX/+aZBOrNiAL
	 SHFbEqmCI0AhCrk7o4d/YfAdWthmxOiMU1v9lx5TNqOC/DrCeLhRXZ+9zY6qn+emo5
	 HJ9YZZvxSwueuKtJBY4gRK7CD4IEap+bPi+MKTks=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727169AbfLXCid (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 23 Dec 2019 21:38:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:53428 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726853AbfLXCid (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 23 Dec 2019 21:38:33 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C84B32070E;
        Tue, 24 Dec 2019 02:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577155112;
        bh=aAS8hVJVOa0Xu/5YjDckkYv+i7U3AxWC41mTypuMheQ=;
        h=In-Reply-To:References:Cc:From:To:Subject:Date:From;
        b=Qpk06d5OhtMRypuDshiWYhQWPaYyPC5eJoPPj8GFp2e+atXMrwAcdUVMUMJNBSJ1+
         Ir60ro1BSqpEl86C7Zt+WaifWqbDJ2wa8y7Qyh5t4QS6XpbxzYYbx5TpUsJXLxuH4I
         QDaSYj5n6E2qhmbwEgd46Rr1ojbUhyh6o7oTU8EE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1573812245-23827-2-git-send-email-tdas@codeaurora.org>
References: <1573812245-23827-1-git-send-email-tdas@codeaurora.org> <1573812245-23827-2-git-send-email-tdas@codeaurora.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH v1 1/3] dt-bindings: clock: Add YAML schemas for the QCOM DISPCC clock bindings
User-Agent: alot/0.8.1
Date:   Mon, 23 Dec 2019 18:38:32 -0800
Message-Id: <20191224023832.C84B32070E@mail.kernel.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Taniya Das (2019-11-15 02:04:03)
> The DISPCC clock provider have a bunch of generic properties that
> are needed in a device tree. Add a YAML schemas for those.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Applied to clk-next

