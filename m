Return-Path: <SRS0=V00+=YS=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F7B6CA9EA0
	for <linux-devicetree@archiver.kernel.org>; Fri, 25 Oct 2019 08:19:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1411E21929
	for <linux-devicetree@archiver.kernel.org>; Fri, 25 Oct 2019 08:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571991594;
	bh=mxSD1yFRMTz9TnhEbFhz9Kun4feNsEval2ddjomqsO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=y7AChE5nSr9DTdU12WewtX/XD8mffQFnNayCpjVb3R6Zq7ViR9l2evXjjE4k1XjTs
	 9LVeP7GEyP55/u9DL5P3QEv+G+AnMXfE5w0FLWTLNIoLeiIhVF0+wDkgdctLG6x+Ap
	 iZ+g6hiE0TfYcmQ9YD4Wlw8M6kFQijSiBEoRwlA4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406045AbfJYITx (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 25 Oct 2019 04:19:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:48868 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405453AbfJYITx (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 25 Oct 2019 04:19:53 -0400
Received: from dragon (li937-157.members.linode.com [45.56.119.157])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 62B1B21872;
        Fri, 25 Oct 2019 08:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571991592;
        bh=mxSD1yFRMTz9TnhEbFhz9Kun4feNsEval2ddjomqsO8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lFAqe/2s6ePycLmtuct1pUpPxQ2c0S5G2gRoUZ0dIra5kvDDE7q8tMhhMG9jzgQTa
         5Mn0Pd3bAlkrx8Nxje85jEpjalyndVooeCuRFBdEF+mGpDkm9f2p39FOh80g6YKZDl
         TDGaJsgTRpDu5Wfoor3Idl4Szuoo0+JfN8+19ugg=
Date:   Fri, 25 Oct 2019 16:19:38 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Yuantian Tang <andy.tang@nxp.com>
Cc:     leoyang.li@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: lx2160a: add tmu device node
Message-ID: <20191025081936.GF3208@dragon>
References: <20191010083022.6700-1-andy.tang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191010083022.6700-1-andy.tang@nxp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Oct 10, 2019 at 04:30:22PM +0800, Yuantian Tang wrote:
> Add the TMU (Thermal Monitoring Unit) device node to enable
> TMU feature.
> 
> Signed-off-by: Yuantian Tang <andy.tang@nxp.com>

Applied, thanks.
