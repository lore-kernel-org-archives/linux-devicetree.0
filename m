Return-Path: <SRS0=v2WM=2N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C087C2D0C0
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Dec 2019 07:02:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 645122084D
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Dec 2019 07:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1577084527;
	bh=iRJyVPfeOjUUuDQxbKZ6Wwlu9UG4UtjyQCDCmBmLWiA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=LTgXGwF7tP1CeXlG1ESC2ON2oen4dPeP+VoknakLPlLaibRboXrjYRl+iW1cQT9GV
	 xt6CvjUhvCraTdQAE9Ioc561LMaI7C9SjVk696U1UOhSfdy/WjATLutV+JKXhrDk11
	 oxAx+c5lrfzVXLGKc/RcpDH94I920bp3hPWr8gL4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725811AbfLWHCG (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 23 Dec 2019 02:02:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:35008 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725810AbfLWHCG (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 23 Dec 2019 02:02:06 -0500
Received: from dragon (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 19C9E20663;
        Mon, 23 Dec 2019 07:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577084526;
        bh=iRJyVPfeOjUUuDQxbKZ6Wwlu9UG4UtjyQCDCmBmLWiA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wbthxuwltGaX0EObARt+mugsv3lJON9MDo/+6SrdjX0+Sol9PSyUQrNMilAgDmH71
         hi4fG/breZ+Sgfi6YZrq3S1X1pYIuHWBzwvkuYYr257GPm5uQ4j6SZ+e1QjgPu940w
         rKrrdphfqwL9Zj9Cp48TAR2nrNSO3eozwa3mdjYc=
Date:   Mon, 23 Dec 2019 15:01:45 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     devicetree@vger.kernel.org, robh+dt@kernel.org, linux-imx@nxp.com,
        kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/2] ARM: dts: imx51-babbage: Fix the DVI output
 description
Message-ID: <20191223070144.GQ11523@dragon>
References: <20191213135838.28697-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191213135838.28697-1-festevam@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Dec 13, 2019 at 10:58:37AM -0300, Fabio Estevam wrote:
> imx51-babbage has a TFP410 chip that receives 24-bit RGB parallel
> input and convert it to DVI.
> 
> Fix the device tree description to reflect the real hardware.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Applied both, thanks.
