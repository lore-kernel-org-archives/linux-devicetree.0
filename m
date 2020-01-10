Return-Path: <SRS0=Jntx=27=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33ECBC33CA2
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jan 2020 00:11:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0105A20661
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jan 2020 00:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578615104;
	bh=GQ1rsUyL8Tp8YqroWPfW4PnceOHEcnwNATCAVnNLfvA=;
	h=In-Reply-To:References:Cc:Subject:To:From:Date:List-ID:From;
	b=OpzYP+0/NVkcOxNVk73pqnyh4Pme7vP7h5r3HGsn6Fy2u8rwUVttatNq0aJJWtFAL
	 N7MFVpY3ELg6DupWV4ugd5OVafxB5LyANQ4SnHy5ZbI2uqkIud1LYv56Db13nTzjKq
	 SJM1C3uRz6g32xPJKR7QvInkePSUgegVQodVsx38=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730164AbgAJALj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Jan 2020 19:11:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:33302 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730095AbgAJALj (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 9 Jan 2020 19:11:39 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BEB1C20848;
        Fri, 10 Jan 2020 00:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578615098;
        bh=GQ1rsUyL8Tp8YqroWPfW4PnceOHEcnwNATCAVnNLfvA=;
        h=In-Reply-To:References:Cc:Subject:To:From:Date:From;
        b=Isc61OqAqq1tmQxZlF6/hpYjPaIN6PgQvbg/CPB/PBLg7jBxxTEn7ND69rFqjuX3K
         NM80M7MTsTwYfClmRCKNa8j+KpqZK7kYz2kblFQQHpyBMOBQWUvlzY2bl5Qsjq702L
         WWoQ/gGoCZHWuI268tDODH5qWbbfamrHMYHtSd8U=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1578557121-423-3-git-send-email-sricharan@codeaurora.org>
References: <1578557121-423-1-git-send-email-sricharan@codeaurora.org> <1578557121-423-3-git-send-email-sricharan@codeaurora.org>
Cc:     Anusha Canchi Ramachandra Rao <anusharao@codeaurora.org>,
        Abhishek Sahu <absahu@codeaurora.org>
Subject: Re: [PATCH V2 2/2] clk: qcom: Add ipq6018 Global Clock Controller support
To:     agross@kernel.org, devicetree@vger.kernel.org,
        linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-soc@vger.kernel.org, robh+dt@kernel.org,
        sivaprak@codeaurora.org, sricharan@codeaurora.org
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Thu, 09 Jan 2020 16:11:38 -0800
Message-Id: <20200110001138.BEB1C20848@mail.kernel.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Sricharan R (2020-01-09 00:05:21)
> This patch adds support for the global clock controller found on
> the ipq6018 based devices.
>=20
> Also fixed the sparse warnings reported by,
> Reported-by: kbuild test robot <lkp@intel.com>
> Co-developed-by: Anusha Canchi Ramachandra Rao <anusharao@codeaurora.org>
> Signed-off-by: Anusha Canchi Ramachandra Rao <anusharao@codeaurora.org>
> Co-developed-by: Abhishek Sahu <absahu@codeaurora.org>
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> Co-developed-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
> ---

Applied to clk-next

