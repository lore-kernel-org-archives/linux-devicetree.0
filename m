Return-Path: <SRS0=ND8X=23=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9436C33C8C
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 21:57:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AAA862072A
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 21:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578347840;
	bh=BZqjl5C0O+IW5Z5GFdY8nA7SPKsDOaxMIOyGcQ3RhWM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Ycjmm01iLkpj+PSGHWO9XuKKpSu49lB+F41/OezWXwYA9ZyUQnr3r1xbsh2H6QWs9
	 ZspDNQ/SXlT8Ooq70XtPyglqVsQTgVS29U6O7HyP5jwTdPgFVKZZMXXQTuBywsRnW5
	 D5lJeW02BXhGsUM+09bNqH+2cvhI+3Y+lG6VUjOE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726731AbgAFV5U (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 6 Jan 2020 16:57:20 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:43933 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726695AbgAFV5T (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 6 Jan 2020 16:57:19 -0500
Received: by mail-oi1-f194.google.com with SMTP id p125so14771154oif.10
        for <devicetree@vger.kernel.org>; Mon, 06 Jan 2020 13:57:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CGQuR1M/qYi2xyMJHlEfzvhIn09Q2tETaZrs1ID5PBc=;
        b=ud/BwnXoNDjwky59eGyMgT/36GDI/TnWw4GI8c3Qymd1aDiZ/jCaNofqT1O6NdouYx
         2Inx9r5bFaSjPz5Un7gjAGam0q7I+VgpDTMgZT1pI7EaJy7dLY5BBllOQo7T6oUbwPDL
         21yQPiGKzx/w9o4UUn/DnnIARbc68zqG4CPGF9v+McPc6MbtCLg7J5tTajRD0lcGc79f
         wStO0hF3r0eESpJO/L/ye/sMjtyDTQqrWyabfAeBJtApPL0fpK+MhCRWMHwwFX/UfCYW
         uMWBn1PNSp7prv00Ye2+CK8ORncTJ94ILieN81Xk32fqdVqHbIynaRg5n3RGnNG7T6ra
         vjsg==
X-Gm-Message-State: APjAAAU+nkWkDz+psr7PfN/Ah1RG2jb3Ranx7hsh1pvsPZdFvWkiFu9P
        CJEXUr7F8lhmBzmm6CTdv8Ibstc=
X-Google-Smtp-Source: APXvYqxrCWhJSkYVyQ+XuiGDyX2EAHf+Ry5betPSipYYJihftR9bloEo4v+6rk/dFnH/DFGGaM2OMQ==
X-Received: by 2002:a05:6808:3c2:: with SMTP id o2mr6598421oie.145.1578347839242;
        Mon, 06 Jan 2020 13:57:19 -0800 (PST)
Received: from rob-hp-laptop (ip-70-5-121-225.ftwttx.spcsdns.net. [70.5.121.225])
        by smtp.gmail.com with ESMTPSA id 69sm1037883oth.17.2020.01.06.13.57.18
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 13:57:19 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 220d32
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 06 Jan 2020 15:57:16 -0600
Date:   Mon, 6 Jan 2020 15:57:16 -0600
From:   Rob Herring <robh@kernel.org>
To:     Chao Hao <chao.hao@mediatek.com>
Cc:     Joerg Roedel <joro@8bytes.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com,
        Chao Hao <chao.hao@mediatek.com>,
        Jun Yan <jun.yan@mediatek.com>,
        Cui Zhang <zhang.cui@mediatek.com>,
        Yong Wu <yong.wu@mediatek.com>,
        Anan Sun <anan.sun@mediatek.com>
Subject: Re: [PATCH v2 01/19] dt-bindings: mediatek: Add bindings for MT6779
Message-ID: <20200106215716.GA31059@bogus>
References: <20200105104523.31006-1-chao.hao@mediatek.com>
 <20200105104523.31006-2-chao.hao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200105104523.31006-2-chao.hao@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, 5 Jan 2020 18:45:05 +0800, Chao Hao wrote:
> This patch adds description for MT6779 IOMMU.
> 
> MT6779 has two iommus, they are MM_IOMMU and APU_IOMMU which
> use ARM Short-Descriptor translation format.
> 
> The MT6779 IOMMU hardware diagram is as below, it is only a brief
> diagram about iommu, it don't focus on the part of smi_larb, so
> I don't describe the smi_larb detailedly.
> 
> 			     EMI
> 			      |
> 	   --------------------------------------
> 	   |					|
>         MM_IOMMU                            APU_IOMMU
> 	   |					|
>        SMI_COMMOM-----------		     APU_BUS
>           |		   |			|
>     SMI_LARB(0~11)  SMI_LARB12(FAKE)	    SMI_LARB13(FAKE)
> 	  |		   |			|
> 	  |		   |		   --------------
> 	  |		   |		   |	 |	|
>    Multimedia engine	  CCU		  VPU   MDLA   EMDA
> 
> All the connections are hardware fixed, software can not adjust it.
> 
> >From the diagram above, MM_IOMMU provides mapping for multimedia engine,
> but CCU is connected with smi_common directly, we can take them as larb12.
> APU_IOMMU provides mapping for APU engine, we can take them larb13.
> Larb12 and Larb13 are fake larbs.
> 
> Signed-off-by: Chao Hao <chao.hao@mediatek.com>
> ---
>  .../bindings/iommu/mediatek,iommu.txt         |   2 +
>  include/dt-bindings/memory/mt6779-larb-port.h | 215 ++++++++++++++++++
>  2 files changed, 217 insertions(+)
>  create mode 100644 include/dt-bindings/memory/mt6779-larb-port.h
> 

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.
