Return-Path: <SRS0=Re5X=7C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86B3FC433E2
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 May 2020 10:21:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 63F6D207C4
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 May 2020 10:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589970084;
	bh=S7tsdwkiGlZosauRkq6IW1mxdJPbcPef9De8p/Neb20=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=oMkcEhQec+kue7vX20LEcyY2JObQRU0c0UWWDgEn3Y6lucYfpjr7OSD1Sj4qIMb3C
	 bu5qmhwgZFkzTWKlditBPeYjsxk7maR1PNrXyzsQf90sNMeOymE1wzv5sFwO+mb+gV
	 cOB4itdzlHjpF/A7iR4ycWBvHU92J+Db/359/5oQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726452AbgETKVP (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 20 May 2020 06:21:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:36158 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726403AbgETKVM (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 20 May 2020 06:21:12 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 568C0207C4;
        Wed, 20 May 2020 10:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589970072;
        bh=S7tsdwkiGlZosauRkq6IW1mxdJPbcPef9De8p/Neb20=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=2KKDky4YfNsdoMUsOT6q866Gu85DZEO5U2zNBrmYAkybjIIujOMSiuwZb+vnRutu/
         60YwDeoKmU7WyRvP7vfVdBynaEy9BgJzTT12+v/auDjVVh8aHC+KBgNvuTgwAZsw4n
         HYUiiK2wFmUK+NL0nuwYfd+Mo1hVhhRFaFwANN+s=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200518113156.25009-3-matthias.bgg@kernel.org>
References: <20200518113156.25009-1-matthias.bgg@kernel.org> <20200518113156.25009-3-matthias.bgg@kernel.org>
Subject: Re: [PATCH 3/4] clk/soc: mediatek: mt6779: Bind clock driver from platform device
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mtk01761 <wendell.lin@mediatek.com>, devicetree@vger.kernel.org,
        Allison Randal <allison@lohutok.net>,
        linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        linux-mediatek@lists.infradead.org,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
To:     Matthias Brugger <matthias.bgg@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, matthias.bgg@kernel.org
Date:   Wed, 20 May 2020 03:21:11 -0700
Message-ID: <158997007160.215346.10358796743530839745@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting matthias.bgg@kernel.org (2020-05-18 04:31:55)
> From: Matthias Brugger <matthias.bgg@gmail.com>
>=20
> The mmsys driver is now the top level entry point for the multimedia
> system (mmsys), we bind the clock driver by creating a platform device.
> We also bind the MediaTek DRM driver which is not yet implement and
> therefor will errror out for now.
>=20
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
