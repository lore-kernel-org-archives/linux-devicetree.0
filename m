Return-Path: <SRS0=v2WM=2N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 343A1C2D0D2
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Dec 2019 03:38:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0775420733
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Dec 2019 03:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1577072285;
	bh=byu92t4rRZcTmj4uQmg4Cq+RCMhLO6AQbfs1oyQJ8QQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=vpr+A8zzTPhQTknSg36q7vzD39jlu2GomHBiHzT8dpZSGflAGhuxUurZJ+V+fzH0D
	 eYL9sYdr1RYN6/sSUWldzsydnxgQhJ/VpgJuytycmNNyEIHJfit70jWMbbdiFYqlaH
	 DI48rgC7wRFUN5BsRZeXSSzSdAVVNm4B1JC8JJGI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726557AbfLWDiE (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 22 Dec 2019 22:38:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:38576 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726539AbfLWDiE (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sun, 22 Dec 2019 22:38:04 -0500
Received: from dragon (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7C9E3206D3;
        Mon, 23 Dec 2019 03:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577072283;
        bh=byu92t4rRZcTmj4uQmg4Cq+RCMhLO6AQbfs1oyQJ8QQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FEiT2kK2KUKtp/RS4hR+N+9kPautjSI06XktyChIvRRO3R7zAirpcdCUx0T186lV9
         74qXSNOv4IMvbAkDXflXyAlNhGiV+vzvtpaADHy3REGgEXtjVYEwTmvn7yK/9CfmNv
         0BfKbRwpUajXGfaiOqGK0cw7gGOisv9qsKpTYSHs=
Date:   Mon, 23 Dec 2019 11:37:42 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Li Yang <leoyang.li@nxp.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jon Nettleton <jon@solid-run.com>,
        Rabeeh Khoury <rabeeh@solid-run.com>
Subject: Re: [PATCH v2 0/2] Add support for Solidrun CEX7 platforms
Message-ID: <20191223033741.GF11523@dragon>
References: <20191216124042.GH25745@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191216124042.GH25745@shell.armlinux.org.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Dec 16, 2019 at 12:40:42PM +0000, Russell King - ARM Linux admin wrote:
> Hi,
> 
> This series adds support for the Solidrun Clearfog CX and Honeycomb
> platforms that various developers have access to.
> 
> v2: fix review comments.
> 
>  arch/arm64/boot/dts/freescale/Makefile             |   2 +
>  .../arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi | 127 +++++++++++++++++++++
>  .../boot/dts/freescale/fsl-lx2160a-clearfog-cx.dts |  15 +++
>  .../dts/freescale/fsl-lx2160a-clearfog-itx.dtsi    |  57 +++++++++
>  .../boot/dts/freescale/fsl-lx2160a-honeycomb.dts   |  15 +++
>  arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi     |  10 ++
>  6 files changed, 226 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi
>  create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dts
>  create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi
>  create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dts

I applied both patches.  Please send a follow-up patch to document new
board compatibles.

Shawn
