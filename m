Return-Path: <SRS0=lKpO=5L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AB88C2D0E8
	for <linux-devicetree@archiver.kernel.org>; Thu, 26 Mar 2020 06:53:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D460020857
	for <linux-devicetree@archiver.kernel.org>; Thu, 26 Mar 2020 06:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1585205634;
	bh=ufATkhGdJw2R1PLs3HU1B0oeXOIhfK2e9fgG659urEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=VL4epKQSoueEZA0JcDKjmJdTZng10buhuedx1fV2PsFAxYXwKQIHU8DTh1orZAGeB
	 aCVPf7ugwvpmSvIXzJv41OSjkKuE4c3QEgWSIpWkWo0vkcOuf2TNwhs27yXMPq6R66
	 Q/hf9XtaRk6XcNUkk/VxYyfuYGKyKNRGSEW2JNbg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726298AbgCZGxy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 26 Mar 2020 02:53:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:47538 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726213AbgCZGxy (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 26 Mar 2020 02:53:54 -0400
Received: from localhost (unknown [106.201.104.212])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8A60E206F8;
        Thu, 26 Mar 2020 06:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585205633;
        bh=ufATkhGdJw2R1PLs3HU1B0oeXOIhfK2e9fgG659urEc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GKXPmpmtIPmj82IWpJAyaCAbp/Ew038QxByAG0AnjkcwhyX5Cp709nsp1RgiI/OsW
         Sa7/L4hUfRa527pd3CvGCY9p8xSGUbyiNNdLvU5mZiYXqHHc6aF3Fk88Y0ciN+Agn6
         DqpREywp2kMxdeS1agpkXckhjJ1rFuqTKQZvhKFM=
Date:   Thu, 26 Mar 2020 12:23:48 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     robh+dt@kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: dma: renesas,usb-dmac: add r8a77961 support
Message-ID: <20200326065348.GV72691@vkoul-mobl>
References: <1585117138-8408-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1585117138-8408-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 25-03-20, 15:18, Yoshihiro Shimoda wrote:
> This patch adds support for r8a77961 (R-Car M3-W+).

Applied, thanks

-- 
~Vinod
