Return-Path: <SRS0=GIEZ=26=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60BF1C32771
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jan 2020 07:32:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 26F672072A
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jan 2020 07:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578555177;
	bh=wcVi1/6fyTeRg/lzzRwOSNC1NG1kV7B6YyRNZoDe0nc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=LK7ZQXrWLgGZJdf/y829FUruXhIEJC7ORo8OPW6n+XpGjr6vuzfY4a3R8e24JI5SH
	 B2x+JqTV62uukIuRGTswMCCXeBM3DuIy8GP90K1LbQA/ikP5c6WLkN83G7x6/QHjlv
	 W/Vg0wmz1xf1KCl65Z+5anjPG8sMO02nvoqUbbaQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728184AbgAIHc4 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Jan 2020 02:32:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:46864 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728164AbgAIHc4 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 9 Jan 2020 02:32:56 -0500
Received: from T480 (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4C19520673;
        Thu,  9 Jan 2020 07:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578555175;
        bh=wcVi1/6fyTeRg/lzzRwOSNC1NG1kV7B6YyRNZoDe0nc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bzrZ4RRo+QNNAffwj8P7j2UYtUrUMs9uJ2x4R4MGnGXaAmcEZW2fl26C27PZ8naAl
         YgsRYdF6GrlkGo+i0tKv+KtJEy91ym/SBqDBqwXz/1gaDYDJv84Nl/8/JPERl0JCpu
         1vNs2lNWjYG8oY6fOcd7nsKXnq6GOSdLCmbRSA+k=
Date:   Thu, 9 Jan 2020 15:32:46 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Kuldeep Singh <kuldeep.singh@nxp.com>
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] arm64: dts: ls208xa: Update qspi node properties for
 LS2088ARDB
Message-ID: <20200109073244.GC4456@T480>
References: <1576867954-17756-1-git-send-email-kuldeep.singh@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1576867954-17756-1-git-send-email-kuldeep.singh@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sat, Dec 21, 2019 at 12:22:34AM +0530, Kuldeep Singh wrote:
> LS2088ADB has one spansion flash s25fs512s of size 64M.
> 
> Add qspi dts entry for the board using compatibles as "jedec,spi-nor" to
> probe flash successfully. Also, align properties with other board dts
> properties.
> 
> Use dt-bindings constants in interrupts instead of using numbers.
> 
> Signed-off-by: Kuldeep Singh <kuldeep.singh@nxp.com>

Applied, thanks.
