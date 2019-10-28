Return-Path: <SRS0=uucL=YV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 229D6CA9EAF
	for <linux-devicetree@archiver.kernel.org>; Mon, 28 Oct 2019 02:02:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E70C4208C0
	for <linux-devicetree@archiver.kernel.org>; Mon, 28 Oct 2019 02:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572228143;
	bh=Do82FeXN8awZBXeYHmhMD0gIwU/ryeyx/q5LviT3/Tc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=XXKZLC0h/xPzEk7EhV4pDyr/Ai8ZD1OdfXjwI9RoJdFQYVck/ujdQpkfa2GTMDLab
	 tGCz8FGrGDw7gVPHvbPRuRWbzKYBUAtxfbFn4AI3hW6pb3+7U0N7UDp6KVynCx1o7W
	 WKVVsLyzDc2jHn9Dm62QvK6kR2Icj+jN9Zw6vcGU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728213AbfJ1CCW (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 27 Oct 2019 22:02:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:33396 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728018AbfJ1CCW (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sun, 27 Oct 2019 22:02:22 -0400
Received: from dragon (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 94DD120717;
        Mon, 28 Oct 2019 02:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572228141;
        bh=Do82FeXN8awZBXeYHmhMD0gIwU/ryeyx/q5LviT3/Tc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OKvTPp3EB/nnvm4PwcjJqcKfMWkbZtxSC6N/VumoCmho5JpUULbOoulGOShiBwmdE
         sId2xvYE7FozosKKV6bLodoMIXvB1ETC6sb1yqLZT5SnT3zOrv6jlgeV58NB1y38TF
         cYlaPvq+ZwejZysO8w36ZeXp8EfU5s16qHfcYueM=
Date:   Mon, 28 Oct 2019 10:02:03 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Michal =?utf-8?B?Vm9rw6HEjQ==?= <michal.vokac@ysoft.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: imx6dl-yapp4: Enable UART2
Message-ID: <20191028020202.GC16985@dragon>
References: <1571233762-4444-1-git-send-email-michal.vokac@ysoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1571233762-4444-1-git-send-email-michal.vokac@ysoft.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Oct 16, 2019 at 03:49:22PM +0200, Michal Vokáč wrote:
> The second UART is needed for 3D or MFD printer control.
> 
> Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>

Applied, thanks.
