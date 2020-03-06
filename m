Return-Path: <SRS0=NbWy=4X=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EC42C10F00
	for <linux-devicetree@archiver.kernel.org>; Fri,  6 Mar 2020 07:39:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 52224217F4
	for <linux-devicetree@archiver.kernel.org>; Fri,  6 Mar 2020 07:39:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RSzgjOlO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725853AbgCFHjR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 6 Mar 2020 02:39:17 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:42400 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725829AbgCFHjR (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 6 Mar 2020 02:39:17 -0500
Received: by mail-wr1-f65.google.com with SMTP id v11so1090899wrm.9
        for <devicetree@vger.kernel.org>; Thu, 05 Mar 2020 23:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:references:subject:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4t0MStYbCBrrml5GUGnyfpLcvggg+PyXMPp39nd5trE=;
        b=RSzgjOlOMbBeZo2wbq6QANsYrtE15e1XNV26Ts8HIH6E8Rw5WjTotTFhcbQtTdeVEC
         lmWGNY4BYjMrmJ4GamktpINiM9bQtzsOKOjVuYcR54RQD+/Bfq+/Q6/V1LQuNxMpC9MB
         RZ7qKyV4+Nd9Zz3jW+pdhf8+QuafjSXhsD6RFbI/EnnQ5aD3ZhSMgXrkNPTQhoOzbG+f
         lGZtAUTkO1Iby6hmaxtTxeY1WaJVoYFb9+e8VGTGqcYF4UtMI+5j5hQuiYv3fxsMNEc+
         xFrvx8j1Mm0zQfzF3oLqtor+5FxUk6XVFYPVv2rLK0GfnxzxFgIlgWmJZR86wAMAoXXB
         nAjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:references:subject:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4t0MStYbCBrrml5GUGnyfpLcvggg+PyXMPp39nd5trE=;
        b=nSHo6AJAB9I6y40W0YyJGlFZBFJGEe2CVVh6HUMdavLtTm5r8GDxIgmshLuKCN+zix
         ABdbl1qyUtKonmaHAgM8AUM9kwIJ6UQzUflZDTw9IiU/qb7/7x7N7Vpmg0qmwsXuAXde
         QyO35yqpKutwR31UCGCHMcNfviIUozymuYNJL4i9VUbLTRV6SUYFJj8WQCK+iB7oLbQ3
         YjDIQlZvCo3MuY/zjAFr1nbVasQmpEBa3g5MO5G7kLdRGAS8FEnLF5UwzTIV47Q7xRuM
         XCQowmvrVawZDxt06RfDuSpqjtI3fblssmdScbtF/TbZ91d6a5kmIx5vsSMPErSiN4J2
         riqw==
X-Gm-Message-State: ANhLgQ0+g2edQxjkurxasP04oJ7dpKX+cyGoUpWW915WtvHcTAf76+yu
        7DukWPlfKYazzTKGSDu46lbMlZm5
X-Google-Smtp-Source: ADFU+vsDky10qkg2759HPWADpen7Ug1SSZpzuiTDnR7oovqEmbuLwiN6yUtObGg2h/jiin3VPcHFbw==
X-Received: by 2002:adf:dfc2:: with SMTP id q2mr2501810wrn.209.1583480355596;
        Thu, 05 Mar 2020 23:39:15 -0800 (PST)
Received: from [192.168.2.1] (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id j14sm48263537wrn.32.2020.03.05.23.39.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2020 23:39:15 -0800 (PST)
To:     Heiko Stuebner <heiko@sntech.de>
References: <3739122.I207nbqjcC@phil>
Subject: Re: Re: [PATCH 4/4] arm64: dts: rockchip: Enable eDP display on
 rk3399 evb
Cc:     linux-rockchip@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>, devicetree@vger.kernel.org
From:   Johan Jonker <jbx6244@gmail.com>
Message-ID: <88f23464-1868-464f-7e0b-c9cd1c12c9d5@gmail.com>
Date:   Fri, 6 Mar 2020 08:39:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <3739122.I207nbqjcC@phil>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

Missing #address-cells, #size-cells
Can you still fix that?
Also include all email addresses that are produced by:

./scripts/get_maintainer.pl --nogit-fallback --nogit

> 
> Am Donnerstag, 5. März 2020, 12:39:12 CET schrieb Andy Yan:
>> Add eDP panle and enable relative dt node like vop/iommu
>> to enable eDP display on rk3399 evb.
>> 
>> Signed-off-by: Andy Yan <andy.yan at rock-chips.com>
> 
> applied for 5.7 - after removing the added blank line at the end
> of the file
> 
> Thanks
> Heiko



> +&edp {
> +	status = "okay";
> +	force-hpd;
> +
> +	ports {

#address-cells = <1>;
#size-cells = <0>;

Don't forget that extra empty line here.

> +		edp_out: port at 1 {
> +			reg = <1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			edp_out_panel: endpoint at 0 {
> +				reg = <0>;
> +				remote-endpoint = <&panel_in_edp>;
> +			};
> +		};
> +	};
> +};

