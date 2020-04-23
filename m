Return-Path: <SRS0=8VFN=6H=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05E7FC55186
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Apr 2020 14:21:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DAEA92098B
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Apr 2020 14:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1587651712;
	bh=57gqQPQd4IJylfioNNAGGdvJ1fl8K/ZNVE8ybhs2MSU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=eYXokUE+pKIzRZ217rU6SxM7tCrLThItVU12yT+nQzlYhkjq4rYaJR71AM+fAeNCI
	 p+zkN0/fMhqVQjXW4UsjkPdW7jI1+30TjjBsdJMQvW5rHhHpi3+NApaPN3CpTZUH5d
	 9Rwlx/hio6JYMOSvSpoj854oUt/iWTOq5cwXp/0Q=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728869AbgDWOVr (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 23 Apr 2020 10:21:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:58732 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728863AbgDWOVq (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 23 Apr 2020 10:21:46 -0400
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 994CA21556;
        Thu, 23 Apr 2020 14:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587651705;
        bh=57gqQPQd4IJylfioNNAGGdvJ1fl8K/ZNVE8ybhs2MSU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BYsM2BpMxM7Ivd/k9Iiy3wmf1/8mUchXgiGnl+DjJL5TkPenz6E1IUsKzAL2rWDw4
         /Ov6uolvX7dVHRfYWmClluhdfi2Y0ccXCB8+5pPCTiw/Z7WvhbfQTCFnTgVgnBtPZU
         iff/89edXcjeS41kWSZKShGt1HpQiNe3YDlVQH18=
Date:   Thu, 23 Apr 2020 22:21:36 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: imx: Add Beacon i.MX8m-Mini development
 kit
Message-ID: <20200423142135.GB9391@dragon>
References: <20200324144324.21178-1-aford173@gmail.com>
 <20200324144324.21178-2-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200324144324.21178-2-aford173@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Mar 24, 2020 at 09:43:23AM -0500, Adam Ford wrote:
> Beacon Embeddedworks is launching a development kit based on the
> i.MX8M Mini SoC.  The kit consists of a System on Module (SOM)
> + baseboard.  The SOM has the SoC, eMMC, and Ethernet. The baseboard
> has an wm8962 audio CODEC, a single USB OTG, and three USB host ports.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>

Applied, thanks.
