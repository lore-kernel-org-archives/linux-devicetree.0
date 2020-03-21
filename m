Return-Path: <SRS0=1bdf=5G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D009C43333
	for <linux-devicetree@archiver.kernel.org>; Sat, 21 Mar 2020 01:25:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 664CA20753
	for <linux-devicetree@archiver.kernel.org>; Sat, 21 Mar 2020 01:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584753921;
	bh=QQ9AVvL8o+qqaQzJ8Y9r+Mzb6Lz6VNVLDgzszHgyylE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=Kx9aW2/Wxq6M4hDRaBnvCnjVyEtw7ltNTG/EJGROxciqYB1nKLlMRVmNDRLxEfBEE
	 SnBtuWASFmV7okpBzf+8d1VD2aYk6B+mvgxraulZzmRSmOQi88C6btupSufNOeFnd6
	 L8We4r9LwerQryXMfITbt4VDLXDV9E71LTmRIwko=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727241AbgCUBZV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 20 Mar 2020 21:25:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:46346 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727197AbgCUBZU (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 20 Mar 2020 21:25:20 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 219E020752;
        Sat, 21 Mar 2020 01:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584753920;
        bh=QQ9AVvL8o+qqaQzJ8Y9r+Mzb6Lz6VNVLDgzszHgyylE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=QY2oyumEvb7cMK6PKHp5wT59UK2xjS0Ad9FnY3pcEdunpEaj0lhSwPuB77lR9W4in
         iJMBcGlxeMBmM2jL7SjICRpP7v9JBTVMkWgLbfyf0QCGpvfegjCy/bvXttVHxnmOaA
         rkpiecfWgc6FB1gZbUrac2sTUCNpeF64LLCtaU94=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200309194254.29009-14-lkundrak@v3.sk>
References: <20200309194254.29009-1-lkundrak@v3.sk> <20200309194254.29009-14-lkundrak@v3.sk>
Subject: Re: [PATCH v2 13/17] dt-bindings: marvell,mmp2: Add clock ids for the thermal sensors
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Lubomir Rintel <lkundrak@v3.sk>
To:     Lubomir Rintel <lkundrak@v3.sk>
Date:   Fri, 20 Mar 2020 18:25:19 -0700
Message-ID: <158475391941.125146.8930241062444906716@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Lubomir Rintel (2020-03-09 12:42:50)
> There seems to be a single thermal sensor block on MMP2 and a couple
> more on MMP3. Add definitions for their respective clocks.
>=20
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
>=20
> ---

Applied to clk-next
