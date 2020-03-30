Return-Path: <SRS0=ov7W=5P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72911C43331
	for <linux-devicetree@archiver.kernel.org>; Mon, 30 Mar 2020 23:24:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 38DB420675
	for <linux-devicetree@archiver.kernel.org>; Mon, 30 Mar 2020 23:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1585610689;
	bh=97Wrbm202YO9zpcYgQXFJjBYvuOwftVN3wtVERERirs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=PMtHdGUPu80S02ToKjc/QpkGAKgAAEKR8TY4aAKLHW9l78oXC3cH6LzpA2f6GNoL7
	 82E9otqfxC8irvnhqNqdrqKzOZgwEV+tX2Tgzo5MRIvsfircl8kyF6KktfStMtnnLv
	 b4iDsoZyje56a3UrgFMor60lDsuWjbsmCx6a28ik=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729069AbgC3XYs (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 30 Mar 2020 19:24:48 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:35312 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728876AbgC3XYs (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 30 Mar 2020 19:24:48 -0400
Received: by mail-il1-f194.google.com with SMTP id 7so17647339ill.2
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2020 16:24:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CC29pPEJVsj/olmXrYwrrs1WbFltwLCfY/YhyQ6LBi8=;
        b=SUspLAtINCYk5voI/iFaKRy9y1NdO311CzLfDYhHad2lRSD7QUX55GMZEBrOdnXF1c
         jhwDBQtBNR8MAWxoo6sArDlNufI4TYrfcu7/ECDR/xBHE8J5qxG/z8MAgzQanVZ8cGUb
         YlFm6eBSVSIW8Bqrn/RZ4lwLC9gWIR/+A+tscX30lhR2lsBovmd2UN77ikoBC3bl4Npz
         TIqvYTSx8S1hU84CdIT/nC3oGHXXC9+E43zohRBgV8rjL6/ofsNK+WVlIDf+X644coF2
         HSpewYvLtEY7xjEPqdNC7o5rzTGoNaTthhG6TIiM3TP5DFGAcefrGRyMhhqft+/BsZ5B
         wcZw==
X-Gm-Message-State: ANhLgQ0TRgjP17KDDsqhM58MezFXqLR94OUWFtq1AucXMY3N6YbMYT7r
        TpKytvwAZnBsuYf3U58tfg==
X-Google-Smtp-Source: ADFU+vuZfs7W/SJxu9kQbH23CnLKgJC2K3wVUSRDfLJApSEDT2u2swu66HFmJR+6eW7vByOZ1Qmgxw==
X-Received: by 2002:a92:8cc7:: with SMTP id s68mr14150833ill.268.1585610687740;
        Mon, 30 Mar 2020 16:24:47 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id g69sm5372067ile.3.2020.03.30.16.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2020 16:24:47 -0700 (PDT)
Received: (nullmailer pid 22917 invoked by uid 1000);
        Mon, 30 Mar 2020 23:24:46 -0000
Date:   Mon, 30 Mar 2020 17:24:46 -0600
From:   Rob Herring <robh@kernel.org>
To:     Yifeng Zhao <yifeng.zhao@rock-chips.com>
Cc:     miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-mtd@lists.infradead.org, heiko@sntech.de,
        linux-rockchip@lists.infradead.org,
        Yifeng Zhao <yifeng.zhao@rock-chips.com>
Subject: Re: [PATCH v4 2/3] dt-bindings: mtd: Describe Rockchip RK3xxx NAND
 flash controller
Message-ID: <20200330232446.GA22844@bogus>
References: <20200320093342.15470-1-yifeng.zhao@rock-chips.com>
 <20200320093342.15470-3-yifeng.zhao@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200320093342.15470-3-yifeng.zhao@rock-chips.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, 20 Mar 2020 17:33:41 +0800, Yifeng Zhao wrote:
> Documentation support for Rockchip RK3xxx NAND flash controllers
> 
> Signed-off-by: Yifeng Zhao <yifeng.zhao@rock-chips.com>
> ---
> 
> Changes in v4:
> - The compatible define with rkxx_nfc
> - Add assigned-clocks
> - Fix some wrong define
> 
> Changes in v3:
> - Change the title for the dt-bindings
> 
> Changes in v2: None
> 
>  .../bindings/mtd/rockchip,nand.yaml           | 101 ++++++++++++++++++
>  1 file changed, 101 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/rockchip,nand.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
