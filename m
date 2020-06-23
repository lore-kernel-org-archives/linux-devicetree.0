Return-Path: <SRS0=lOvj=AE=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D138AC433E0
	for <linux-devicetree@archiver.kernel.org>; Tue, 23 Jun 2020 07:00:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A61ED20771
	for <linux-devicetree@archiver.kernel.org>; Tue, 23 Jun 2020 07:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592895651;
	bh=NwzkhvLTdaiMVPiInrrB1GVy05m9nUU2QlCfp66VRNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=OEcykb6sgSP+47bnfHKEpuh3wdYZiXjq/eDSjRlLTI7T0DAQWq0Q1N60X1V9IF00T
	 usggbghjnmewelWgqrnry1dmS8vmAiv5SlzjbZXqyL+V2eFRlOS6eEca6DrXBZugiv
	 jp+BRriag+kh5Ht5ulWd4e1FHbFkdsJgmkGiTmzk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730703AbgFWHAv (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 23 Jun 2020 03:00:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:35404 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730694AbgFWHAu (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 23 Jun 2020 03:00:50 -0400
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 647D520724;
        Tue, 23 Jun 2020 07:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592895650;
        bh=NwzkhvLTdaiMVPiInrrB1GVy05m9nUU2QlCfp66VRNI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NaWIjmO44k0EzJmLo1BWA/+CqFZ1ov5yHwrdFmo6dLZgKf1X/rw1rmxoja8CZQ/5i
         yHCza3p7c5yKWVi4ZecZQeCj9WWBvYn135gqhmiP9rqSwCZ7lLFuajdWg0gHxvKwlb
         Q/m6NU66dDmnsHJDsfi8gQGq69IkZLA1QpGIEYp4=
Date:   Tue, 23 Jun 2020 15:00:40 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     robh+dt@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Linux-imx@nxp.com
Subject: Re: [PATCH 1/3] ARM: dts: imx: Change sdhci node name on
 i.MX27/i.MX31 SoCs
Message-ID: <20200623070039.GS30139@dragon>
References: <1591079092-18625-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1591079092-18625-1-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Jun 02, 2020 at 02:24:50PM +0800, Anson Huang wrote:
> Change i.MX27/i.MX31 node name from sdhci to mmc to be compliant
> with yaml schema, it requires the nodename to be "mmc".
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Applied all, thanks.
