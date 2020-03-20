Return-Path: <SRS0=WWXW=5F=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40C76C4332B
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Mar 2020 17:25:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1599620767
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Mar 2020 17:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584725121;
	bh=Er5NiXwXCdg+sJt6+vUhDrFGAGFfEXKhv1Q3VJa5bLQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=izkaoVsFcHADE5baGsKFoj4gL6hy+6kIQnvhyPEp81ouUoNsb1FPoD5McefaUkpm1
	 e9IM67i6BTrfTjplCRG2j6kL3qj3PmP81wMKSXfrI75SRMibeAgjlsrqjpuPKBCGa1
	 UHMshBPgevq8YcTjEEE2BEF3BgEWM8d1bbVMfqGA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726773AbgCTRZU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 20 Mar 2020 13:25:20 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:36137 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbgCTRZU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 20 Mar 2020 13:25:20 -0400
Received: by mail-io1-f68.google.com with SMTP id d15so6778171iog.3;
        Fri, 20 Mar 2020 10:25:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=P1wKaMI8O9dDCT1oPP4iY9qYkhhrObrooyIKo3KFxxE=;
        b=D3ajN2gfDFASFTgDwuevFZZt8QBdlhGEFsz/8rn1Y8mVNQ5IsgWTxRd/ETdryXZPst
         2uivolM8QnO12cdjG+aoCGbme7yI7k0wcGNIgz2JG2RZNEvEzOtkrKPnWw8Ru+So003g
         AlkWRsyqUqKbegE1zzr5PkOZSFNyAxw7dvxAus71599YjQrvEeuNdkYyUFjTvx7/abeb
         CUVrGN3eXeVvEMTL8FXWDrlc8hn4xgtkFW3BuVQN/1maSFjMetO1jmfxetBIB8+KJp80
         2omC8Dr0Jav/+TpzEQ613rqdA+TrzY5NpfHAUh4wCwHdBZQdUsgxdq6NkkyKTyCBwfe/
         qiWw==
X-Gm-Message-State: ANhLgQ0kPEmkJkpI1jd5xtwk0I+IN70A7AcAuXrAzfAAFW+tWbQqvyfx
        xMgukGTHsb2cbrfmFR/DXQ==
X-Google-Smtp-Source: ADFU+vvk9WTP7Yclc/W4SLnBNr6eIfVp1DIP7mrsVLzXUlDaIbJf0MUwb+PbOIfIF+pkls/8QSKuJQ==
X-Received: by 2002:a05:6638:3dd:: with SMTP id r29mr8697341jaq.94.1584725119010;
        Fri, 20 Mar 2020 10:25:19 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id v21sm1908809ios.39.2020.03.20.10.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2020 10:25:18 -0700 (PDT)
Received: (nullmailer pid 5126 invoked by uid 1000);
        Fri, 20 Mar 2020 17:25:16 -0000
Date:   Fri, 20 Mar 2020 11:25:16 -0600
From:   Rob Herring <robh@kernel.org>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-media@vger.kernel.org,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@pengutronix.de,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v6 1/4] media: dt-bindings: Document i.MX8MQ VPU bindings
Message-ID: <20200320172516.GA5033@bogus>
References: <20200320131256.23294-1-p.zabel@pengutronix.de>
 <20200320131256.23294-2-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200320131256.23294-2-p.zabel@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, 20 Mar 2020 14:12:53 +0100, Philipp Zabel wrote:
> Add devicetree binding documentation for the Hantro G1/G2 VPU on i.MX8MQ.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
> Changes since v5:
>  - Drop i.MX8MM bindings
>  - Change example node name to video-codec
>  - Convert to YAML
> ---
>  .../bindings/media/nxp,imx8mq-vpu.yaml        | 77 +++++++++++++++++++
>  1 file changed, 77 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
