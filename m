Return-Path: <SRS0=gY8B=4F=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20FBDC35254
	for <linux-devicetree@archiver.kernel.org>; Mon, 17 Feb 2020 12:13:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E552A20725
	for <linux-devicetree@archiver.kernel.org>; Mon, 17 Feb 2020 12:13:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="lhgWn9B0";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="M7BbP05A"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726817AbgBQMNp (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 17 Feb 2020 07:13:45 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:53503 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726710AbgBQMNp (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Mon, 17 Feb 2020 07:13:45 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id D204959B;
        Mon, 17 Feb 2020 07:13:43 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 17 Feb 2020 07:13:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=hsvOXdNVgoGeP+GHJeh5B0d79zg
        e1/9FEK7vaPhrcAg=; b=lhgWn9B0PTGRjQcpka9GNS5qQ2V8KJB6Z99L8jT8noc
        rxOqIPGIPwwKEOINx2bYx8VOJU8ljSvPpQxvJhRIqc3WOhpS+n3QFbs5eY/Slb//
        bN3IUmA89hrjHc2vupVDTf6GtcnlG6anM3pfQp5bfdO7rpgJ8r5MBcgTGR7JxIyf
        Fwku7ZBG8WhrKRnM7BX8kMSspR4ynlpSo24iJJdoU/bTq4mzYrCP2n6LQUWSt9n1
        Iu7CH4D20Ad4FyO/EHhqaCxTMjnQ7dJ4IBKhFXCXQHqlZMwe+GIoFx/Q9uQ3iL4o
        GxNqNi5+5QsEa1r1+J8Fnr+A8xJ/jtCSPaIDV2k3j8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=hsvOXd
        NVgoGeP+GHJeh5B0d79zge1/9FEK7vaPhrcAg=; b=M7BbP05AmDx+Z+5g3Y/fRn
        a3WKT7fPwe5waNoR+pF52eBi+T2uGsyMZWHp9RGWLnibxJVJHABoUjGDRkaVUOsW
        8gYwq/7b3MHG37P2gjNLku8fcDn/FGAJOqLvImQBqN7ATJq18jOfopTWK2U6GVP4
        XBqTEfr1Kh5aE6WCh6fO9Teaa/dLki4yMrbPSHsW9Y8JHYzNcRtVZXk/aRpewZFB
        CXH8gZ1OjG/X+OZEvD9maOjfVgmXYEjexbjjvvnifdbs9m9tbOr8CvIK2q63fDzb
        D4ikFhDYcpI0HyN8ZcTz14YftkZCLV8wfzDWHrw6NExi7DL5WAOzszSUW3GT4IyA
        ==
X-ME-Sender: <xms:doNKXtsMswAvSTo4qv4nFmhZb3tSzNgm0x8r37w-Rb6r9Q5cjpwODQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjeeigdefjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucffohhmrghinh
    epfhhrvggvuggvshhkthhophdrohhrghenucfkphepledtrdekledrieekrdejieenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvg
    estggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:doNKXkru22cGbdZ7jf4sbjcKlwNVDRXnwY-PoHIppGeJiMEX4CLjXw>
    <xmx:doNKXnHWYNve3326xNB6NevA4CSgAFur5y0vuiCxIMRRerUBHXwrUw>
    <xmx:doNKXoGZcfr2b1lUcoTTmva-6bv5DF2mEqW8oDtsWWuzmaSNa5XKuQ>
    <xmx:d4NKXoRE1lzRnMAVs_R2p-h5DtQKrsR7cEcF8W_Y6B-mvZYA5GLNgw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 3251E328005E;
        Mon, 17 Feb 2020 07:13:42 -0500 (EST)
Date:   Mon, 17 Feb 2020 13:13:40 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org,
        Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Steffen Trumtrar <s.trumtrar@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [RFC PATCH v3 5/5] drm/panel: simple: add panel-dpi support
Message-ID: <20200217121340.kn2uyzhfszpnnozo@gilmour.lan>
References: <20200216181513.28109-1-sam@ravnborg.org>
 <20200216181513.28109-6-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200216181513.28109-6-sam@ravnborg.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, Feb 16, 2020 at 07:15:13PM +0100, Sam Ravnborg wrote:
> RFC only - not tested yet!
>
> The panel-dpi compatible is a fallback that
> allows the DT to specify the timing.
>
> When matching panel-dpi expect the device tree to include the
> timing information for the display-panel.
>
> Background for this change:
> There are a lot of panels and new models hits the market very often.
> It is a lost cause trying to chase them all and users of new panels
> will often find them in situations that the panel they ues are not
> supported by the kernel.
> On top of this a lot of panels are customized based on customer
> specifications.
>
> Including the panel timing in the device tree allows for a simple
> way to describe the actual HW and use this description in a generic
> way in the kernel.
> This allows uses of proprietary panels, or panels which are not
> included in the kernel, to specify the timing in the device tree
> together with all the other HW descriptions.
> And thus, using the device tree it is then easy to add support
> for an otherwise unknown panel.
>
> The current support expect panels that do not require any
> delays for prepare/enable/disable/unprepare.
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>

I submitted a similar patch a year ago:
https://lists.freedesktop.org/archives/dri-devel/2019-March/209682.html

So I'm all for it :)

Regardless of the outcome of this discussion, for all the patches:
Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime
