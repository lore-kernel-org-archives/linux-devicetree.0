Return-Path: <SRS0=uzRV=5Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D495C43331
	for <linux-devicetree@archiver.kernel.org>; Tue, 31 Mar 2020 14:21:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4AFC92071A
	for <linux-devicetree@archiver.kernel.org>; Tue, 31 Mar 2020 14:21:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730562AbgCaOV6 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 31 Mar 2020 10:21:58 -0400
Received: from foss.arm.com ([217.140.110.172]:53928 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730464AbgCaOV6 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 31 Mar 2020 10:21:58 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A02931B;
        Tue, 31 Mar 2020 07:21:58 -0700 (PDT)
Received: from bogus (unknown [10.37.12.97])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6E0F73F71E;
        Tue, 31 Mar 2020 07:21:56 -0700 (PDT)
Date:   Tue, 31 Mar 2020 15:21:48 +0100
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Peng Fan <peng.fan@nxp.com>
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH 0/4] firmware: arm_scmi: Extend SMC/HVC to support
 multiple channels
Message-ID: <20200331142148.GA14918@bogus>
References: <20200327163654.13389-1-sudeep.holla@arm.com>
 <AM0PR04MB4481FB36D888882183C4293188C80@AM0PR04MB4481.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM0PR04MB4481FB36D888882183C4293188C80@AM0PR04MB4481.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Peng,

On Tue, Mar 31, 2020 at 01:53:40PM +0000, Peng Fan wrote:
> > Subject: [PATCH 0/4] firmware: arm_scmi: Extend SMC/HVC to support
> > multiple channels
> >
> > Hi,
> >
> > While merging SMC/HVC transport to SCMI, I did a quick hack to extend it to
> > support multiple channels. I may be missing something obvious, if not the
> > changes required look simple. Some of them could be merged into original
> > patch, but since I am unable to test, I preferred to keep them separate, easy
> > to revert if things break.
>
> With patchset applied to your scmi tree, my test still work as before.
>
> Tested-by: Peng Fan <peng.fan@nxp.com>
>

Thanks for testing. If you can give it a quick review as it is very small
change, that would be great. I just want more eyes to look at it just to
make sure I am not missing something obvious.

--
Regards,
Sudeep
