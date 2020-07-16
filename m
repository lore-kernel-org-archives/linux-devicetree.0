Return-Path: <SRS0=XaEl=A3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF562C433E2
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 06:29:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE1CD206F5
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 06:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594880982;
	bh=iATruulsL90Sg1KydgMR1kTilJXahpTdK2f3qjPAm5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=w89GdjcS/H4DxcmAfjJNs7HfBh/aHRsrY00HIVwSw6kIw7BHZLWC7TIHiPImJ4El0
	 tnKnLSIcpvm+7GuA4Q6BZ2qR4EzXYDUcMexF07dFTTwtvHG4dl9UfADAXS1TIQehhf
	 +7R64mb4GvgKWn28cdpeg4APfIKOcVlLwnFEFOao=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726547AbgGPG3m (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Jul 2020 02:29:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:51866 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726069AbgGPG3m (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 16 Jul 2020 02:29:42 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4093B2067D;
        Thu, 16 Jul 2020 06:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594880981;
        bh=iATruulsL90Sg1KydgMR1kTilJXahpTdK2f3qjPAm5s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=I/bm0yRRjEIZ7clDi+UquLgaByP6yK9ICz5nR9Mo3mweyKXxMVcOddeSmThEh+9P1
         yBtDXQXLDr3ulxg87IXrDIOOu9GIuS6rIuyAQV302PwgRVrLQe6rVLvBMgTqEpreC+
         g1BAkmKGRjFmUWS7AU5ptJ6ABJqqOi41H8q478Hs=
Date:   Thu, 16 Jul 2020 08:29:36 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Bhanu Prakash Maiya <bhanumaiya@chromium.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        Lee Jones <lee.jones@linaro.org>,
        Furquan Shaikh <furquan@chromium.org>,
        Raul E Rangel <rrangel@chromium.org>,
        Eric Peers <epeers@google.com>,
        Duncan Laurie <dlaurie@google.com>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] platform/chrome: cros_ec_uart: Add cros-ec-uart
 transport layer
Message-ID: <20200716062936.GB958325@kroah.com>
References: <20200715221150.v3.1.I7605646b16c98c0095eee7fbe39f8f7b2b59e6f4@changeid>
 <20200716062807.GA958325@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200716062807.GA958325@kroah.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Jul 16, 2020 at 08:28:07AM +0200, Greg Kroah-Hartman wrote:
> On Wed, Jul 15, 2020 at 10:14:29PM -0700, Bhanu Prakash Maiya wrote:
> > From: Bhanu Prakash Maiya <bhanumaiya@chromium.org>
> > 
> > This patch enables uart transport layer for cros_ec framework.
> > The cros-ec-uart binds with EC device working on uart transport to
> > send request and receive response.
> > 
> > Signed-off-by: Bhanu Prakash Maiya <bhanumaiya@chromium.org>
> 
> If this really is a "UART", why is this not a serial/tty driver?

Ah, it's a serdev driver.  that wasn't obvious.

Please write a much better changelog saying what this driver is and why
it needs to be the type that it is, as I totally missed that from these
2 sentences.

thanks,

greg k-h
