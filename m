Return-Path: <SRS0=+P9T=3M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E821C33CB6
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jan 2020 22:58:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 683BC22522
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jan 2020 22:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579820319;
	bh=+vO8N90FVF3xL+pii7NOSq2FtfZu7Erby6E+v2V6kuQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=fx4Exfsnzaeu3fVrh92Bxg8woslHiyP2eEIh5Pvfs4pBXWvVqbrv3H1BFSPPI+p5y
	 Vui3ACugYR4d28vE/BrUkrrDdxIasrv5MWoXx5FAC56c6+5oNtChGo/YN5Y65isNn6
	 RkH/oe6deYapjDWHVFlYnsG335/zEAUaDORmdnVg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729509AbgAWW6i (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 23 Jan 2020 17:58:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:40002 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729149AbgAWW6i (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 23 Jan 2020 17:58:38 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D2EEC20718;
        Thu, 23 Jan 2020 22:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579820317;
        bh=+vO8N90FVF3xL+pii7NOSq2FtfZu7Erby6E+v2V6kuQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=2Zns5AlZe0m8NGkGX2ryWE8GWo44d309PozzHP/DAv5lMlw3goyDdq1WwrzUdjnOE
         TPQa27nTpE7YHTFCdOj54Y55C9SUqf+9qGKRBd52neO9DK7/VXIamyGiHvmJTQ9Gro
         UX1/GxHwEpg83VQ64d70xfk4XQhnfKXWmQ2iM6S8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1575527759-26452-2-git-send-email-rajan.vaja@xilinx.com>
References: <1574415814-19797-1-git-send-email-rajan.vaja@xilinx.com> <1575527759-26452-1-git-send-email-rajan.vaja@xilinx.com> <1575527759-26452-2-git-send-email-rajan.vaja@xilinx.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: clock: Add bindings for versal clock driver
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Rajan Vaja <rajan.vaja@xilinx.com>
To:     Rajan Vaja <rajan.vaja@xilinx.com>, gustavo@embeddedor.com,
        jolly.shah@xilinx.com, m.tretter@pengutronix.de,
        mark.rutland@arm.com, mdf@kernel.org, michal.simek@xilinx.com,
        mturquette@baylibre.com, nava.manne@xilinx.com, robh+dt@kernel.org,
        tejas.patel@xilinx.com
User-Agent: alot/0.8.1
Date:   Thu, 23 Jan 2020 14:58:37 -0800
Message-Id: <20200123225837.D2EEC20718@mail.kernel.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Rajan Vaja (2019-12-04 22:35:54)
> Add documentation to describe Xilinx Versal clock driver
> bindings.
>=20
> Signed-off-by: Rajan Vaja <rajan.vaja@xilinx.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-next

