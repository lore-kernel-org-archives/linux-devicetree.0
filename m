Return-Path: <SRS0=v2WM=2N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A44B0C2D0C0
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Dec 2019 08:56:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 74C402073A
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Dec 2019 08:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1577091419;
	bh=ypit6fFI9oUctSo5WDN1Km0/4S80IqXJA2UkBSN0GHk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=evjZFOUXUETK4Af7Jr1htC+0H+kQ/cG61uBHG7vL3E7bsSLg7BUFMt4k97pASpbtM
	 9iq64p3mn17fCHbbNeKQ/UwFSPqPnEVeAVAiDy+86/sNb3gGxF4ED41XMruZ3NKLIR
	 w4EkNb5R2qvWWzM5knRrHOf/+uVkKcp9aTCE8Ves=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725927AbfLWI47 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 23 Dec 2019 03:56:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:51774 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725905AbfLWI47 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 23 Dec 2019 03:56:59 -0500
Received: from dragon (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B8037206D3;
        Mon, 23 Dec 2019 08:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577091418;
        bh=ypit6fFI9oUctSo5WDN1Km0/4S80IqXJA2UkBSN0GHk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ULWCpoUYbRojCj4luOmDrs63MNkIBQEG1W/OQUa1rquLVXZcWhfEXbXuiVg53K5ai
         1gtiT2Ay/YPi3fOJ4C2ic5VHqlhCXnNkGeUFsUN1Yh/qudZCGlpTfFmgjwIWMqe3vp
         JGhTxnZz4dfCoLg3GjA690/L/vS821zbM03EgBjU=
Date:   Mon, 23 Dec 2019 16:56:35 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     robh@kernel.org, mark.rutland@arm.com, s.hauer@pengutronix.de,
        kernel@pengutronix.de, devicetree@vger.kernel.org, kernel@puri.sm,
        linux-kernel@vger.kernel.org, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org,
        Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH v2 1/2] arm64: dts: imx8mq-librem5-devkit: add
 accelerometer and gyro sensor
Message-ID: <20191223085634.GY11523@dragon>
References: <20191223081253.27516-1-martin.kepplinger@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191223081253.27516-1-martin.kepplinger@puri.sm>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Dec 23, 2019 at 09:12:52AM +0100, Martin Kepplinger wrote:
> Now that there is driver support, describe the accel and gyro sensor parts
> of the LSM9DS1 IMU.
> 
> Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> Reviewed-by: Guido Günther <agx@sigxcpu.org>

Applied both, thanks.
