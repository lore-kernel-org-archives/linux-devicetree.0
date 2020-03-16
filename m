Return-Path: <SRS0=Nmyu=5B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF918C10DCE
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Mar 2020 01:20:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 822C120674
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Mar 2020 01:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584321618;
	bh=NpcPe7Ai8DtmCkNoujPUXQxlPOJtFn5fStnHfbYQr2M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=xgFefa862vw3XZxP+hUPt0HbxKYo7ewZzCyDOE7TbrKdcuL5t1P9RY7+Q0017M0/a
	 affEWAYKyUhiVnllhvkH7cYQ8dT3Uwx06ZNrMJVL7fZGjkjq1OyFNHC1RSRvRh/tuV
	 q7vlssVo9FiDdg9Mw+lhn0L3p7raEO/Gl6/KScdE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729328AbgCPBUS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 15 Mar 2020 21:20:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:56550 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729300AbgCPBUS (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sun, 15 Mar 2020 21:20:18 -0400
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1AA6520663;
        Mon, 16 Mar 2020 01:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584321617;
        bh=NpcPe7Ai8DtmCkNoujPUXQxlPOJtFn5fStnHfbYQr2M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dSitzUaMjYusX1X5Wgt08MHAkQqf3S96UrYn8aAQ60qoyQyfqxmYazyR9bvWGLUML
         ELKQ+ltX7vq4Naka3CPwmfpDjdGCZFrWmkWgnNE7bn9BCzerUWDh+XF4hDqcvMq0Kz
         NrUdHM8a42yBABAYx0GjU1LG/XKJX9CHJDMM0ikg=
Date:   Mon, 16 Mar 2020 09:20:11 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     peng.fan@nxp.com
Cc:     s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, Anson.Huang@nxp.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH V2] ARM: dts: imx: add nvmem property for cpu0
Message-ID: <20200316012010.GN17221@dragon>
References: <1583917326-5550-1-git-send-email-peng.fan@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1583917326-5550-1-git-send-email-peng.fan@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Mar 11, 2020 at 05:02:06PM +0800, peng.fan@nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add nvmem related property for cpu0, then nvmem API could be used
> to read cpu speed grading to avoid directly read OCOTP registers
> mapped which could not handle defer probe.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Applied, thanks.
