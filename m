Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00445C38A29
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 13:50:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D2AA5206A2
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 13:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586872213;
	bh=J219MSRXUKPZH2EStCL5siV8XbW4jBEU9sMYg+idjEs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=sDcDUftpVLpr5LtYZZ4mbUZewLKStcaiRW/zovyXC5biEeImaxFNrG0OAwK+RZXit
	 0tMypjNuKnIEk3Ah/AiIeKhFPCXsjIPQElFrP2XXLiay0iBXUj4upwvgs8OOUefq0A
	 4GIYgcLMYtdcp0Gx7KVsEwTFObNJW7n3fukqrO4w=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732895AbgDNNuL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 09:50:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:39354 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728705AbgDNNuG (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 14 Apr 2020 09:50:06 -0400
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3A0EE20578;
        Tue, 14 Apr 2020 13:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586872206;
        bh=J219MSRXUKPZH2EStCL5siV8XbW4jBEU9sMYg+idjEs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oX+bu2h0Y1hGAhPHf6J3887A1OwNuPr2ZMmG5bn9cVof2u+3AYfQlCGxGAMom7Xds
         bneoXL403uvuGTUNdKfDlw/bqXhuMwn2DHthPPuX7uoRY5wNvewA+pyrXRDz7QBELM
         pjId3Cl1Fkk8EsapDeQJuF7dwtHeHWvm6coJpPak=
Date:   Tue, 14 Apr 2020 21:49:57 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Igor Opaniuk <igor.opaniuk@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        Max Krummenacher <max.krummenacher@toradex.com>,
        Philippe Schenker <philippe.schenker@toradex.com>,
        Stefan Agner <stefan@agner.ch>,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
        Igor Opaniuk <igor.opaniuk@toradex.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Robert Jones <rjones@gateworks.com>,
        =?iso-8859-1?Q?S=E9bastien?= Szymanski 
        <sebastien.szymanski@armadeus.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: arm: fsl: add nxp based toradex
 colibri bindings
Message-ID: <20200414134956.GF30676@dragon>
References: <20200316143345.30823-1-igor.opaniuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200316143345.30823-1-igor.opaniuk@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Mar 16, 2020 at 04:33:44PM +0200, Igor Opaniuk wrote:
> From: Igor Opaniuk <igor.opaniuk@toradex.com>
> 
> Document Colibri iMX6S/DL V1.1x re-design devicetree binding.
> 
> Signed-off-by: Igor Opaniuk <igor.opaniuk@toradex.com>

Applied both, thanks.
