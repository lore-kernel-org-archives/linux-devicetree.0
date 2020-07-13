Return-Path: <SRS0=NyTY=AY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE6AAC433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jul 2020 09:19:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A9398206F0
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jul 2020 09:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594631947;
	bh=fV/LQpQTYnPXXx1Pe9XJ1E+0lFMNd1w74gbPDGeQzsA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=M0PFyCN7TF4ZNYHF2fwgPKf7+qZ1P2l90JTo3nTyY5a4jq1Z9LdKsm4wfuCizIIEU
	 zMEMWg8jppStV66DRIka+LEGAYTPBXfARBvUQ+wECeav3KRL0CvvraYCzBFRIwQD9K
	 a9UA+eJjS9F0MQ+Ya03Czw0DNtgJlHJqVHAWcqcs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgGMJTH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jul 2020 05:19:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:54438 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726360AbgGMJTH (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 13 Jul 2020 05:19:07 -0400
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 54D7D2067D;
        Mon, 13 Jul 2020 09:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594631946;
        bh=fV/LQpQTYnPXXx1Pe9XJ1E+0lFMNd1w74gbPDGeQzsA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GFVVxsgNQgeh0qieapY7r8XoI9GQ+go0pS59vx2YX65sphVljPbR4EJgTZNIKUbxg
         AUhEutQpp6JSuxJYsw6Uj2uvbqpIfAc+ac/gFNMOaquKRFjsKRUPblWhCy/KZKi78H
         85+9ZuBcjgFMKIGLyfWcyRFPpuvdB7N9FNgL/puU=
Date:   Mon, 13 Jul 2020 17:18:54 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Parthiban Nallathambi <parthiban@linumiz.com>
Cc:     s.hauer@pengutronix.de, robh@kernel.org,
        devicetree@vger.kernel.org, linux-imx@nxp.com,
        kernel@pengutronix.de, festevam@gmail.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: fsl: Add MYiR Tech boards
Message-ID: <20200713091853.GL15718@dragon>
References: <20200713072320.5567-1-parthiban@linumiz.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200713072320.5567-1-parthiban@linumiz.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Jul 13, 2020 at 09:23:19AM +0200, Parthiban Nallathambi wrote:
> Add entries for MYiR Tech imx6ULL eval boards.
> 
> Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>

Applied both, thanks.
