Return-Path: <SRS0=6Sr8=4T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9924C3F2CD
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Mar 2020 20:27:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9040F22B48
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Mar 2020 20:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583180853;
	bh=ddMkrKx0duULhf5jTfhun0z8mBAD/hy0znVqYbUIYPo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=vPyR2fco6wj8ab7DSgZQJunU9+iP6xpb2x7FJnpP7eH/LBBJ+js/yZDxwFJUEEpZm
	 8PuXrzMGZNz24G6GrRvZcD24AlCBXYo0xjuhl4AOm9BJBFLw4bpwWMmAKzXlKX1aDL
	 FTw/WhoENt+XouqmEMsez8mmcyvRHTP5lSF14ObA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726831AbgCBU1d (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Mar 2020 15:27:33 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:44279 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726368AbgCBU1d (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 2 Mar 2020 15:27:33 -0500
Received: by mail-oi1-f194.google.com with SMTP id d62so551684oia.11;
        Mon, 02 Mar 2020 12:27:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=i7DD9w14+LwnZLIWH8LhqR7TklrWwNpUJ5QRm1PyIXo=;
        b=nGKJIYOyHnbkT7n/+dIZ0phnHEWMx2rkuTuiKB3RFEag/1CVYs+eK2btfJFCg6ArUg
         2qiacb9tGwFdQVKwb17mbozZvYD6e6r/ld1IzU5ZJgW8ifYAxEkWWp3pk6F9g2455aMP
         0A3wbAb2UanYZaBmYishCE3X0Hnf+dGEZx1AKIARLtoE2w5N+cJ3sc2Q56F3Mf57/CrQ
         k1smgMOlkIixTrfYjU86q+zSCWnp9aHgskpH5c/Vy01hj42pmoZX9lQ45AYK8IjXS/XB
         axBAKHLgSOb9E18gwJZJ4Ze3H93p9lxJ6G/Zn0R22vIrsFPcwiIcKsZdTxJnoQ1TiahP
         LHZQ==
X-Gm-Message-State: ANhLgQ1JU9M06c8sPinCCRdAAsWXifuk2/6BLXFu+tHVpopeEy+ERTg1
        8XDNJ2jM3wOPDjhn8yqjQA==
X-Google-Smtp-Source: ADFU+vsqCz13bJotnNjjms8BCtRlG9YYlJNjx0G1FNsLpe6L4nnArjwUDESqMiSb/ZvXyQ4bpPV1Rw==
X-Received: by 2002:a54:4816:: with SMTP id j22mr125301oij.179.1583180851977;
        Mon, 02 Mar 2020 12:27:31 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e21sm6201143otr.57.2020.03.02.12.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2020 12:27:31 -0800 (PST)
Received: (nullmailer pid 6436 invoked by uid 1000);
        Mon, 02 Mar 2020 20:27:30 -0000
Date:   Mon, 2 Mar 2020 14:27:30 -0600
From:   Rob Herring <robh@kernel.org>
To:     Ben Levinsky <ben.levinsky@xilinx.com>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        michal.simek@xilinx.com, jollys@xilinx.com, rajan.vaja@xilinx.com,
        mark.rutland@arm.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jason Wu <j.wu@xilinx.com>,
        Wendy Liang <jliang@xilinx.com>
Subject: Re: [PATCH 4/5] dt-bindings: remoteproc: Add documentation for
 ZynqMP R5 rproc bindings
Message-ID: <20200302202730.GA4561@bogus>
References: <1582566751-13118-1-git-send-email-ben.levinsky@xilinx.com>
 <1582566751-13118-5-git-send-email-ben.levinsky@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1582566751-13118-5-git-send-email-ben.levinsky@xilinx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Feb 24, 2020 at 09:52:30AM -0800, Ben Levinsky wrote:
> From: Jason Wu <j.wu@xilinx.com>
> 
> Add binding for ZynqMP R5 OpenAMP.
> 
> Represent the RPU domain resources in one device node. Each RPU
> processor is a subnode of the top RPU domain node.
> 
> Signed-off-by: Jason Wu <j.wu@xilinx.com>
> Signed-off-by: Wendy Liang <jliang@xilinx.com>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> ---
>  .../remoteproc/xilinx,zynqmp-r5-remoteproc.txt     | 135 +++++++++++++++++++++
>  1 file changed, 135 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.txt

DT bindings have moved to DT schema format. See 
Documentation/devicetree/writing-schema.rst.

Rob
