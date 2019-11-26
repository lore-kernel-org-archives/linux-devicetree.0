Return-Path: <SRS0=scSd=ZS=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 948F9C43215
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 Nov 2019 18:09:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 587682075C
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 Nov 2019 18:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1574791773;
	bh=khXt9vX/GT2fcUflwV853+ArzHccO1YSsCZHyTNOf14=;
	h=In-Reply-To:References:Subject:Cc:From:To:Date:List-ID:From;
	b=JFTA7Kf/Cz2giMP5RxeRT1DNhJfjVAB3+u1S0UBXH+dFzvMdOLNLtnwVHN83jf5l6
	 4c3Bg8FO7lmuMGPaSVb9H6g8Db8JPfUBjkrz5YxTMCtk5Aq1H+WyIAM27Fz6IE0J8u
	 INX54kfGOx2iRXdvzh3oegB1aMNS4IRk0Sgxu0zk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726019AbfKZSJc (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 26 Nov 2019 13:09:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:48434 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725870AbfKZSJc (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 26 Nov 2019 13:09:32 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3A04620727;
        Tue, 26 Nov 2019 18:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574791772;
        bh=khXt9vX/GT2fcUflwV853+ArzHccO1YSsCZHyTNOf14=;
        h=In-Reply-To:References:Subject:Cc:From:To:Date:From;
        b=maxjfUlqLWHb1VU8NztT/3JTKPyFdzVBpgBSYUG4XpF0wgSd9gQtQ/lIXZj32nBeg
         MBZf8RMoph8yWD0jjarMvGwcAtnwrLQgOVhK8PtLjTlpUpd4Cn/2QvUuAu7kKwDMhK
         Jwe9INxKKq9mIo1ykNsPYS8krk1mhzD3EExWIy/w=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1573820552-21164-1-git-send-email-shubhrajyoti.datta@gmail.com>
References: <1573820552-21164-1-git-send-email-shubhrajyoti.datta@gmail.com>
Subject: Re: [PATCHv2 1/2] clk: clock-wizard: Move the clockwizard to clk
Cc:     mturquette@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com,
        shubhrajyoti.datta@gmail.com,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
From:   Stephen Boyd <sboyd@kernel.org>
To:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        shubhrajyoti.datta@gmail.com
User-Agent: alot/0.8.1
Date:   Tue, 26 Nov 2019 10:09:31 -0800
Message-Id: <20191126180932.3A04620727@mail.kernel.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting shubhrajyoti.datta@gmail.com (2019-11-15 04:22:31)
> From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
>=20
> Move the clocking wizard driver from staging to clk.
>=20
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---
> this is moving the drivers/staging/clocking-wizard to clk
> v2:
> Added the makefile  and kconfig
>=20
>  drivers/clk/Kconfig                 |   6 +
>  drivers/clk/Makefile                |   1 +
>  drivers/clk/clk-xlnx-clock-wizard.c | 335 ++++++++++++++++++++++++++++++=
++++++

Where is the deletion of the file from staging? Has the TODO file in
staging been resolved? Please Cc Soren and Greg on these patches. Also
include a cover letter and convince us _why_ we should review these
patches in the commit text. Stating what the patch is doing, i.e.
"moving code around", is not helpful.

