Return-Path: <SRS0=iyGu=CA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26B84C433DF
	for <linux-devicetree@archiver.kernel.org>; Sat, 22 Aug 2020 12:21:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ED09F207CD
	for <linux-devicetree@archiver.kernel.org>; Sat, 22 Aug 2020 12:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598098901;
	bh=iOZfGBE0h3jxelwCCPCwiQUT0Y4ul5c/EvwS0sBHGtQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=dWK7Mcf4OuvunyktbzP+DrQPcgs0xKS3HLvKO2xEbDGaeD/xeWP1wLM1/K6dqCgH2
	 5zdcnbiVO1Q0gYzNqyx2canDDlqYm8KYJPqeH2ntaeJ+FB+TpsnWFdS6CIrLHIwgcI
	 UeufxsvwxsapXIsOgcZ4uqmZqqTwFVRLemfG3d0g=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727113AbgHVMVk (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 22 Aug 2020 08:21:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:44276 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726920AbgHVMVj (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sat, 22 Aug 2020 08:21:39 -0400
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 602BC20738;
        Sat, 22 Aug 2020 12:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598098899;
        bh=iOZfGBE0h3jxelwCCPCwiQUT0Y4ul5c/EvwS0sBHGtQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cXyGyKKEX6nOHAhVSqDWT8vBxp2LWLe9nmyg4chMKAkIzSMXdlq6HmIK+mJ4d0J+U
         nJP+7Ym/asL12B2rH0drC9wdlCaOMo33KMedtnh3ZHtreTGEM4hCJjfnwDOIjl7CQo
         edL2nJ94x1JwCqmeaZ+VJA/8HuPrzj59Fj+mInHg=
Date:   Sat, 22 Aug 2020 20:21:29 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Michal =?utf-8?B?Vm9rw6HEjQ==?= <michal.vokac@ysoft.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] =?iso-8859-1?Q?dt-bindings?=
 =?iso-8859-1?Q?=3A_arm=3A_fsl=3A_Add_Y_Soft_IOTA=A0Orion?= board
Message-ID: <20200822122118.GH27575@dragon>
References: <1596196808-5067-1-git-send-email-michal.vokac@ysoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1596196808-5067-1-git-send-email-michal.vokac@ysoft.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Jul 31, 2020 at 02:00:06PM +0200, Michal Vokáč wrote:
> Add devicetree binding for Orion - new board variant in the Y Soft
> IOTA family.
> 
> Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>

Applied all, thanks.
