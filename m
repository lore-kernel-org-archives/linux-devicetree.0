Return-Path: <SRS0=+D0Y=AB=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED499C433E0
	for <linux-devicetree@archiver.kernel.org>; Sat, 20 Jun 2020 02:37:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CDEBA22DD6
	for <linux-devicetree@archiver.kernel.org>; Sat, 20 Jun 2020 02:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592620670;
	bh=E1AMB5sn5QISBAlyRbmYKm1mSWO/4np4K5eE1/U8h7Q=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=R1NFqgfqsmqhHU3kANGh973/KWGgJxyR/i+Qe0DeNEGysMFV9CLJYJRhiL5JkrUDh
	 e17VgAbVGGTmFrjVGCf55LFXrQ2tl2tU/lrqvTJzFvBjojvLDeO28PiS9ScoeBoVwE
	 ulktzx/FtmN6EP2F7H12XDbCAPg1f0flhw3u+6ss=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731965AbgFTChu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 19 Jun 2020 22:37:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:60298 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731846AbgFTChu (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 19 Jun 2020 22:37:50 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8E36722DBF;
        Sat, 20 Jun 2020 02:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592620669;
        bh=E1AMB5sn5QISBAlyRbmYKm1mSWO/4np4K5eE1/U8h7Q=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ZcRAZS8t3Myw9jU777cbTjOY4gZ6dhT9hDX3wejyoUsXBPL9pR+FZcbdSgRBBLhCF
         WPNG6G1a0QpU+vyNWUDpz3MRUGFMRxNfcG74HwLjSNf///NmXdfrEWcUjtoZkandOd
         iBiCCZU4QSk8wb0HXjx74VVGJsQMA7aPXGW/US5Q=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200616202417.14376-2-dinguyen@kernel.org>
References: <20200616202417.14376-1-dinguyen@kernel.org> <20200616202417.14376-2-dinguyen@kernel.org>
Subject: Re: [PATCH 2/3] clk: socfpga: agilex: add nand_x_clk and nand_ecc_clk
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     dinguyen@kernel.org, devicetree@vger.kernel.org,
        mturquette@baylibre.com, robh+dt@kernel.org
To:     Dinh Nguyen <dinguyen@kernel.org>, linux-clk@vger.kernel.org
Date:   Fri, 19 Jun 2020 19:37:48 -0700
Message-ID: <159262066893.62212.6968385322684864@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Dinh Nguyen (2020-06-16 13:24:16)
> And the nand_x_clk and nand_ecc_clk. Make the nand_x_clk be the main
> clock that is feeding the NAND IP and correct it's parent to be the
> l4_mp_clk.
>=20
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---

Applied to clk-next
