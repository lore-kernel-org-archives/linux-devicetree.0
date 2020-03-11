Return-Path: <SRS0=AZXu=44=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1E13C10F27
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Mar 2020 08:20:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B7C7320873
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Mar 2020 08:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583914846;
	bh=GmJNbFRmVzHqNxMlbiejxZG/ZtZVxK9/BMxk9LgKxjk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=AUIkHNu1CNd7C3Er3GTvdx4FcDPCjMh2SPy4A87ODl8QDFytXUhknh/YO/6Lo5TKw
	 t/KNRHwSD7LvQ2FeILbrD3kXbM5qlNYQgssWtUMBqR7jEA+/hZXZfL76gR+2yifrnn
	 MRpOPYXsdpYcXzyDI3io2TZspxDTvEXXD1JEhWls=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728242AbgCKIUq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 11 Mar 2020 04:20:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:54420 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726097AbgCKIUq (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 11 Mar 2020 04:20:46 -0400
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 448342082E;
        Wed, 11 Mar 2020 08:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583914845;
        bh=GmJNbFRmVzHqNxMlbiejxZG/ZtZVxK9/BMxk9LgKxjk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=01E/2LMki/OUi3TQ3TRpihzzOHd4Vf2dgE9WX9pv0K+9/tTS88ecvx99Chjul6Hr7
         hlTRQeClfWJmsW2mQM7RjdXSwDb8BZSxzQD8xt30PTc/Ncj7Rcp3MqpMm2ou4XZftV
         559aHT5QeU4LXQAoA0+jErbPkGmwdnk3KMTc0zPI=
Date:   Wed, 11 Mar 2020 16:20:38 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Zhiqiang Hou <Zhiqiang.Hou@nxp.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, leoyang.li@nxp.com, laurentiu.tudor@nxp.com,
        Xiaowei.Bao@nxp.com
Subject: Re: [PATCHv2] arm64: dts: layerscape: add iommu-map property to pci
 nodes
Message-ID: <20200311082037.GZ29269@dragon>
References: <20200302042027.15589-1-Zhiqiang.Hou@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200302042027.15589-1-Zhiqiang.Hou@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Mar 02, 2020 at 12:20:27PM +0800, Zhiqiang Hou wrote:
> From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> 
> Add the iommu-map property to the pci nodes so that the firmware
> fixes it up with the required values thus enabling iommu for
> devices connected over pci.
> 
> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>

Applied, thanks.
