Return-Path: <SRS0=iyGu=CA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EC8EC433DF
	for <linux-devicetree@archiver.kernel.org>; Sat, 22 Aug 2020 12:06:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 17A97207CD
	for <linux-devicetree@archiver.kernel.org>; Sat, 22 Aug 2020 12:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598097991;
	bh=fZ00hVTlLuuGw5atpKgNlHDvTJ4x1kEXJ23rhUsY2DA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=I+IcQau/q+7T0E6KfrTXKJwG6slGxFnwAt5QP+OSXqtZ5NfQbDpqdEL3VazkOd4vA
	 sON3/K/9pX82T5AYoSUd4UVwv01CUUvBrX/+f22V6QzWvTqlunEyi2l5/tAUWAcu/O
	 e0XhfZXIwIbFehESUBX6d3tVdX06Z8m3xvP7BWAk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726920AbgHVMGa (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 22 Aug 2020 08:06:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:34246 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726704AbgHVMGa (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sat, 22 Aug 2020 08:06:30 -0400
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C2AD62072D;
        Sat, 22 Aug 2020 12:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598097990;
        bh=fZ00hVTlLuuGw5atpKgNlHDvTJ4x1kEXJ23rhUsY2DA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=05bR1pR1n/FX6+CVMIwxFK4AUR/wYBzgCjVJSUdlR90TDFijzNLEAKrpJS35KVCPi
         XrboiRH+60c450ivqsqLxkXbynC5yl6wgfhOL3RyKddbCnH1FP/jlqB8Zvrga+BBbG
         KOF3VuYzUhue91soqmy7Vu4MM7U/MaK1dA9pNfjE=
Date:   Sat, 22 Aug 2020 20:06:25 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Michal =?utf-8?B?Vm9rw6HEjQ==?= <michal.vokac@ysoft.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: imx6dl-yapp4: Add ethernet aliases
Message-ID: <20200822120624.GF27575@dragon>
References: <1596104026-21091-1-git-send-email-michal.vokac@ysoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1596104026-21091-1-git-send-email-michal.vokac@ysoft.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Jul 30, 2020 at 12:13:46PM +0200, Michal Vokáč wrote:
> Add aliases for ethernet switch ports to allow bootloader to fix
> MAC addresses to the ones stored in onboard configuration EEPROM.
> 
> Ursa has only one ethernet port populated (eth2) so alias for
> the first port has to be removed on this board.
> 
> Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>

Applied, thanks.
