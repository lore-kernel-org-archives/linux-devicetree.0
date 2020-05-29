Return-Path: <SRS0=jZdE=7L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBD2CC433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 May 2020 04:29:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B9CD72074D
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 May 2020 04:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1590726581;
	bh=qVwgudvkBtdmAIlD05bceR/5bThoNQ+jc6K0uU7r05o=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=Tb6b4fXKw54JkF914s5MoJMXkRb9l4IaZ/CwBwmeIcKznh6jqn/r2pkTHxJdqpUuI
	 GIkKskbkUrnF9iYAFtUqBBQkCTy4fFRI8G07XXBg+D73VAa3Z347rpNcxbEm3mUqZl
	 rWcWsKoRsJj5WLjjsAziZLHyVEIpwIh/FjvRISMo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725808AbgE2E3i (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 29 May 2020 00:29:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:49060 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725777AbgE2E3h (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 29 May 2020 00:29:37 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 75C732074D;
        Fri, 29 May 2020 04:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590726577;
        bh=qVwgudvkBtdmAIlD05bceR/5bThoNQ+jc6K0uU7r05o=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=iBFpgg1dHzFrT/weRqTvj39XGlmHSCtBfRIp2QoPRp21XePD4GcU5jUpYhaxcjY34
         RPIvDgrnZxH/RbcNOSrJpjZsIb9mvvGZ9eMRtVGZHbs43D7WruhNswwpKxieG2D3OR
         D1RBZC4nzQtcdZJQ3i50zrQ02s89R9jiJmlqYT34=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200502122126.188001-1-aford173@gmail.com>
References: <20200502122126.188001-1-aford173@gmail.com>
Subject: Re: [PATCH V2 1/3] clk: vc5: Allow Versaclock driver to support multiple instances
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     aford@beaconembedded.com, charles.stevens@logicpd.com,
        Adam Ford <aford173@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Marek Vasut <marek.vasut@gmail.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Adam Ford <aford173@gmail.com>, linux-clk@vger.kernel.org
Date:   Thu, 28 May 2020 21:29:36 -0700
Message-ID: <159072657670.69627.7898870559369627169@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Adam Ford (2020-05-02 05:21:24)
> diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
> index fa96659f8023..81255d923f00 100644
> --- a/drivers/clk/clk-versaclock5.c
> +++ b/drivers/clk/clk-versaclock5.c
> @@ -881,6 +871,8 @@ static int vc5_probe(struct i2c_client *client,
>                 goto err_clk;
>         }
> =20
> +       dev_info(&client->dev, "probed");
> +

Please remove this.

>         return 0;
> =20
>  err_clk:
