Return-Path: <SRS0=a4mE=6C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49072C38A29
	for <linux-devicetree@archiver.kernel.org>; Sat, 18 Apr 2020 15:30:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 199D4206D6
	for <linux-devicetree@archiver.kernel.org>; Sat, 18 Apr 2020 15:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1587223839;
	bh=Ji+/ngu49EDoosMhuiqpUh49xYTr4T3ZLflDlqaizbM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=gi2/lSzkCFbTkj2p8tYqSQoz1Md+XI5mXVbWVCAFJLU7u3/KVAIwWYjSGr1tgePun
	 aP8geWUxhbejf/xho3o/HfarR9LFGrqP+cje84bK7Nge2A7VosTV+4/pOkLJpQ7wNu
	 OlAJToh/TToylwC07Wa0bg4pErNwlyL04Zymy2FY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726144AbgDRPai (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 18 Apr 2020 11:30:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:56656 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725879AbgDRPai (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sat, 18 Apr 2020 11:30:38 -0400
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net [82.4.196.95])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CA696206D6;
        Sat, 18 Apr 2020 15:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587223837;
        bh=Ji+/ngu49EDoosMhuiqpUh49xYTr4T3ZLflDlqaizbM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ZaI0nmrghirZ6FTduutJsss6K/MJO8aYdEMAW7OSKFjpLp9Cmzbbh+R3gJ7qrdoaB
         ltPK2LvdCrdhLXT4eAHv9D+bclpATI0CzFW6PoRAnBQkzgkqAVKr8NaLnUHgJ/QhTu
         mZ6rJM1hCTUnPiDZbYBpRIQH/9A1OsCGFXXhH9Gw=
Date:   Sat, 18 Apr 2020 16:30:33 +0100
From:   Jonathan Cameron <jic23@kernel.org>
To:     <alexandru.tachici@analog.com>
Cc:     <linux-iio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <robh+dt@kernel.org>
Subject: Re: [PATCH v2 1/2] iio: dac: ad5770r: read channel nr from reg
Message-ID: <20200418163033.21696ea0@archlinux>
In-Reply-To: <20200416115848.56156-2-alexandru.tachici@analog.com>
References: <20200416115848.56156-1-alexandru.tachici@analog.com>
        <20200416115848.56156-2-alexandru.tachici@analog.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, 16 Apr 2020 14:58:47 +0300
<alexandru.tachici@analog.com> wrote:

> From: Alexandru Tachici <alexandru.tachici@analog.com>
> 
> Read channel number from the reg property of each child
> node.
> 
> Fixes: cbbb819837f6 ("iio: dac: ad5770r: Add AD5770R support")
> Signed-off-by: Alexandru Tachici <alexandru.tachici@analog.com>
This one is awkwardly timed - I'll be doing a fixes pull request shortly
then advance my fixes branch to include the patch this fixes.

Please poke me if I look like I've forgotten it!
Now we are out of sync with the bindings but as long as we get the fix
in before the release that shouldn't really matter to anyone.

Thanks,

Jonathan

> ---
>  drivers/iio/dac/ad5770r.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/dac/ad5770r.c b/drivers/iio/dac/ad5770r.c
> index a98ea76732e7..6302f11551d4 100644
> --- a/drivers/iio/dac/ad5770r.c
> +++ b/drivers/iio/dac/ad5770r.c
> @@ -522,7 +522,7 @@ static int ad5770r_channel_config(struct ad5770r_state *st)
>  		return -EINVAL;
>  
>  	device_for_each_child_node(&st->spi->dev, child) {
> -		ret = fwnode_property_read_u32(child, "num", &num);
> +		ret = fwnode_property_read_u32(child, "reg", &num);
>  		if (ret)
>  			return ret;
>  		if (num > AD5770R_MAX_CHANNELS)

