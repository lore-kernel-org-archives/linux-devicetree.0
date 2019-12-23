Return-Path: <SRS0=v2WM=2N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A5A5C2D0C0
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Dec 2019 07:39:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D148720715
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Dec 2019 07:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1577086750;
	bh=JMhAdu4+gc2kEW9LeP94SyGM8uzvN/cS2T5JuEbGvwg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=v3WhHwfXuuLTi2ZwbHM+4lpYMf+t9N5MT5bQSU3Lbe3LK86vXm8X3hR52lYe+5LH/
	 8GyZzYitzj3ElPMT3FbCzziBFfqR+O5Qerws/manJC3DBWE8nFgIUmBtWIiT3cAKvo
	 yposmQsk7w0lhZYOvTk52nXnL78e9E3eM56DemTY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725905AbfLWHjH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 23 Dec 2019 02:39:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:52148 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725810AbfLWHjH (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 23 Dec 2019 02:39:07 -0500
Received: from dragon (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9FDF320709;
        Mon, 23 Dec 2019 07:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577086747;
        bh=JMhAdu4+gc2kEW9LeP94SyGM8uzvN/cS2T5JuEbGvwg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YJ+7ZQ78Jvp6c/lP3mksCYLIUx5k+pLVKz98SRAWaGAenW63bjrQnMuJqsH8Qjn7z
         izOTwJeQGfQSpUpkU5LmOdLOyofSvR4sPdndfoxUgQ9rq6QUIIVM21AYwtOBj/mcZ5
         SshiNDS0M7g3voxIIk/PUdwWqvUjdLR0WNgcJK2Q=
Date:   Mon, 23 Dec 2019 15:38:45 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Marco Antonio Franchi <marco.franchi@nxp.com>
Cc:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "marcofrk@gmail.com" <marcofrk@gmail.com>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "robh@kernel.org" <robh@kernel.org>,
        "atv@google.com" <atv@google.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: arm: Add Google Coral Edge TPU entry
Message-ID: <20191223073843.GT11523@dragon>
References: <20191217133607.8892-1-marco.franchi@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191217133607.8892-1-marco.franchi@nxp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Dec 17, 2019 at 01:36:14PM +0000, Marco Antonio Franchi wrote:
> Add Google Coral Edge TPU, named as imx8mq-phanbell, to the
> imx8mq supported devices.
> 
> Signed-off-by: Marco Franchi <marco.franchi@nxp.com>
> Reviewed-by: Fabio Estevam <festevam@gmail.com>
> Acked-by: Rob Herring <robh@kernel.org>

Applied both, thanks.
