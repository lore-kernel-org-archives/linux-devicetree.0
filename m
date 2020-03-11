Return-Path: <SRS0=AZXu=44=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77CAEC10F25
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Mar 2020 07:21:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4B83A2192A
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Mar 2020 07:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583911286;
	bh=HFgQsFafmI/OxfAYN6pkvSFzN+VE9N8cOj3/785AOAg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=hii8wmN7/8txOBo+0gl8NF/EiZ7vhADdWyiea/UYdLiW1dNuDyockA7vJc54NkCf/
	 7DB1MKwgX7SXLG0y+Y0FCLA2lUDoTDsjF3rOTXwHaVeKo+IqU/JtIOZquQLTbCm+zp
	 t1V0IWvASvc+OqBWVtaAHdOvrLtXLBhqIrsBz9oE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728255AbgCKHVZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 11 Mar 2020 03:21:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:41674 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728242AbgCKHVZ (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 11 Mar 2020 03:21:25 -0400
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EEAB6208C3;
        Wed, 11 Mar 2020 07:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583911285;
        bh=HFgQsFafmI/OxfAYN6pkvSFzN+VE9N8cOj3/785AOAg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FT3dKhKLSCgP8BDii7OiNin+VH3UC4QGUezGxjeWOabg4EBr+wgq4z4uMPzY92LDO
         hVLL3ewEjvgFg+1jSMGDtqwtqOIhPPh3Y5GwHpu68unYzh/d7vnknSPcwbT2V1xjLq
         nxGkaJwLnDLyV3ko87yNa1F/JrrMH31Exg0hB124=
Date:   Wed, 11 Mar 2020 15:21:17 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, l.stach@pengutronix.de,
        abel.vesa@nxp.com, andrew.smirnov@gmail.com, agx@sigxcpu.org,
        angus@akkea.ca, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Linux-imx@nxp.com
Subject: Re: [PATCH 1/2] arm64: dts: imx8mq: Align iomuxc node name
Message-ID: <20200311072117.GN29269@dragon>
References: <1582695378-25461-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1582695378-25461-1-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Feb 26, 2020 at 01:36:17PM +0800, Anson Huang wrote:
> Node name should be generic, use "pinctrl" instead of "iomuxc"
> for all i.MX8M SoCs.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Applied both, thanks.
