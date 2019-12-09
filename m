Return-Path: <SRS0=leSB=Z7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06A33C43603
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 07:27:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CA1D620721
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 07:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1575876468;
	bh=Y0yVZH6bmilnjoW0N/hJNdW+KEgOTtoQZ+oFi9YEU6g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=u4x4uPB+W5hHkMTSjmxo2Q8epIz4lE2nhW1aTt+EY0cl8zDIrcn5RdInMv2AcHgFm
	 4d98YQiUI0lTvSst+ClCD44n2aboHLTt+dX2Egbf+2Hkkp1wwFLt/BtAUcY081RCLB
	 /KFdhkQQinEZ39C564PYWUpCI1dvUVgpQGtWt2GY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbfLIH1s (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 9 Dec 2019 02:27:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:35966 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726014AbfLIH1s (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 9 Dec 2019 02:27:48 -0500
Received: from dragon (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1866B205ED;
        Mon,  9 Dec 2019 07:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575876467;
        bh=Y0yVZH6bmilnjoW0N/hJNdW+KEgOTtoQZ+oFi9YEU6g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=H9CayTfAAKhLTBCzsXDICOeZHgf0pVARwRzTHv+E/gat8/wle8yWbrH1z1ePXI0WK
         0+5VmcekeSPAf+eYVG1pER4kn/SB5D3F4DunvkZuT9PlP7VUQvgbwJA6F7BWEDxLZ5
         BjieWe82V7qxn1TnvKg1Z00opqbycQLlV0YhJ7FA=
Date:   Mon, 9 Dec 2019 15:27:31 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Lucas Stach <l.stach@pengutronix.de>
Cc:     Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
        patchwork-lst@pengutronix.de
Subject: Re: [PATCH] arm64: dts: zii-ultra: adjust board names
Message-ID: <20191209072730.GG3365@dragon>
References: <20191127181921.22030-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191127181921.22030-1-l.stach@pengutronix.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Nov 27, 2019 at 07:19:21PM +0100, Lucas Stach wrote:
> From: "Ruslan V. Sushko" <ruslan.sushko@zii.aero>
> 
> Change ZII Ultra board names to be more in line with other ZII RDU platforms.
> 
> Signed-off-by: Ruslan Sushko <Ruslan.Sushko@zii.aero>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Applied, thanks.
