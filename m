Return-Path: <SRS0=V00+=YS=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D7D4CA9EAF
	for <linux-devicetree@archiver.kernel.org>; Fri, 25 Oct 2019 02:48:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2825E21D7B
	for <linux-devicetree@archiver.kernel.org>; Fri, 25 Oct 2019 02:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571971702;
	bh=ZufLCq4V0xFP53T+ZSuvvs4DDZ9uy2hKtlxRIlrCtgA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=gYKH52AtLOJqdRg6EUyk87lFlTiWeTvbrZufNyIeRMRU9MiljPn60GDi20VavL7RL
	 S7GAsc6PAa0/+KX8GLwS+fuAkR7AV6+EnbB55nRKg7jdOOSprOV3sGYELH+nUA6CXV
	 IUTfQ95061uZC7cABtiuoBrnKgoYRo7yylQw6dSE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390790AbfJYCsV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 24 Oct 2019 22:48:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:53854 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728416AbfJYCsV (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 24 Oct 2019 22:48:21 -0400
Received: from dragon (li937-157.members.linode.com [45.56.119.157])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 663E921D71;
        Fri, 25 Oct 2019 02:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571971701;
        bh=ZufLCq4V0xFP53T+ZSuvvs4DDZ9uy2hKtlxRIlrCtgA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=x+lvlFOR8A8xFLNoxbyn19gtg10Cno7Sd7gCdZ4bo1lWKnqluSeVPL3n6rzRKYC8Z
         1i1AZ9ed0ajQniTFQtF8ehYuFGY89x+W3kzYgJPnRnOF2n721vyNr8BsqCia3IUCRi
         DQOCUU6Hc7DZAwoGkbjZUVRK6ox2dDPgYJH/Mb0w=
Date:   Fri, 25 Oct 2019 10:48:05 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Michal =?utf-8?B?Vm9rw6HEjQ==?= <michal.vokac@ysoft.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 5/5] ARM: dts: imx6dl-yapp4: Enable the MPR121
 touchkey controller on Hydra
Message-ID: <20191025024804.GC30015@dragon>
References: <1570083176-8231-1-git-send-email-michal.vokac@ysoft.com>
 <1570083176-8231-6-git-send-email-michal.vokac@ysoft.com>
 <390ce745-4768-8e61-de03-fde74517fad5@ysoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <390ce745-4768-8e61-de03-fde74517fad5@ysoft.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Oct 16, 2019 at 08:07:22AM +0200, Michal Vokáč wrote:
> On 03. 10. 19 8:12, Michal Vokáč wrote:
> >Add the touch keyboard present on Hydra board. The controller
> >is connected only using I2C lines. The interrupt line is not
> >available hence we use the polling mode.
> >
> >Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
> >---
> 
> This should ideally go through the input tree with the rest of
> the changes that add support for the poll-interval.

Not really necessary.  The patches can reach linux-next and mainline
through different trees, as long as there is no hard dependency which
could break build or cause regression on any of the trees.

Applied to imx/dt branch.

Shawn
