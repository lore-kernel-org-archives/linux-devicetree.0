Return-Path: <SRS0=+Je1=4M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E79B2C11D2F
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Feb 2020 15:06:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C20422072D
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Feb 2020 15:06:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727699AbgBXPGP (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 24 Feb 2020 10:06:15 -0500
Received: from foss.arm.com ([217.140.110.172]:38666 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727693AbgBXPGP (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 24 Feb 2020 10:06:15 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD3641FB;
        Mon, 24 Feb 2020 07:06:14 -0800 (PST)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF20F3F534;
        Mon, 24 Feb 2020 07:06:12 -0800 (PST)
Subject: Re: [PATCH 3/3] drm/panel: add panel driver for Elida KD35T133 panels
To:     Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org
Cc:     thierry.reding@gmail.com, sam@ravnborg.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, mark.rutland@arm.com,
        christoph.muellner@theobroma-systems.com,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
References: <20200223150711.194482-1-heiko@sntech.de>
 <20200223150711.194482-3-heiko@sntech.de>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <ec42b04a-4727-cbd4-d0c4-21a8def8abd0@arm.com>
Date:   Mon, 24 Feb 2020 15:06:11 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200223150711.194482-3-heiko@sntech.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 23/02/2020 3:07 pm, Heiko Stuebner wrote:
[...]
> +#define dsi_generic_write_seq(dsi, cmd, seq...) do {			\
> +		static const u8 d[] = { seq };				\
> +		int ret;						\
> +		ret = mipi_dsi_dcs_write(dsi, cmd, d, ARRAY_SIZE(d));	\

Nit: in the rocktech driver, dsi_generic_write_seq() is wrapping 
mipi_dsi_generic_write() which seems logically self-consistent. 
Therefore shouldn't this wrapper be called something like 
dsi_dcs_write_seq()? I have no idea what any of this actually means, but 
the dissonance is enough to make my reviewer-sense tingle ;)

Robin.

> +		if (ret < 0)						\
> +			return ret;					\
> +	} while (0)
