Return-Path: <SRS0=wnEW=6Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE0B7C54E93
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 May 2020 18:27:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 88D522070B
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 May 2020 18:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589221677;
	bh=i6rT7pl3y5+c7jnQO1HiG2tm/O2Q7yeQE9ybHkbIVYw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=E00BEYXV9DxID2VcNg2A0AwUA/JU314739UWABr8iGLINe/CN00mJZ1xzhJG7k1GW
	 S/wvpHaAgZLZv7vtHvv4rg878PFjyF+gjss/Z0jGJe/6AbO+3xS9mhWoH5+zW51qIo
	 zv/HGhP9mCn7KqVra2JP2ypWxhEjUsrDn3u4QcaM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729846AbgEKS1z (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 11 May 2020 14:27:55 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:43139 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731152AbgEKS1e (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 11 May 2020 14:27:34 -0400
Received: by mail-oi1-f195.google.com with SMTP id j16so15937733oih.10;
        Mon, 11 May 2020 11:27:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Ht1Yf4e3ictsVLLZDtTllL6POw3JDfrc6LvgmlTwd+o=;
        b=mAYz3DgRHLLxHH9EjPJ9fuWZExW19xggotQ6nRqwQC66QRf17sPxmjsPYML2o1L2V4
         jTN5Y9FMgVUU6Hvjove4sH1lJVNsa88OFJhOurp3AHXI7UPWo9OO7yYuUDf+EAhqjHsC
         1bNoJ3q3GArSB/rCSAJxur6MBXSojzgwLdZevQ5+YXI96x03O21q+vtMPVdncIqY8whQ
         dzvyYfZULYovvJUkDpq75ADvR3/QKvh6IL/OSJwRMOzNGQo/L483RU4G1KiK++9H82nh
         aDFydlcDDR/C+vVig82noUMk2mg+PAWeyjVXqzV63CMsqtxWUXL68eR0Ro/kkshxjmEa
         DU/w==
X-Gm-Message-State: AGi0PuZZK1lCSIvZ9Kvzi8VXcfWW5UdvjZZmvuG9+OjbII6WlfpLYU+c
        uOWSQ3GjjYmWBLYwt4M+Wg==
X-Google-Smtp-Source: APiQypJJVdhVDIiyV5MQ9hMeG4fzb2BeRMre1Xb8Vy85SfElqigqNr0E3HRoq3Ps/CZug9SB6xEXZg==
X-Received: by 2002:aca:acd0:: with SMTP id v199mr19934761oie.82.1589221653219;
        Mon, 11 May 2020 11:27:33 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n16sm2980243oop.23.2020.05.11.11.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 11:27:32 -0700 (PDT)
Received: (nullmailer pid 26196 invoked by uid 1000);
        Mon, 11 May 2020 17:20:08 -0000
Date:   Mon, 11 May 2020 12:20:08 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     libcamera-devel@lists.libcamera.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        devicetree@vger.kernel.org, pavel@ucw.cz, tfiga@google.com,
        "open list:MEDIA INPUT INFRASTRUCTURE V4L/DVB" 
        <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v10 01/13] dt-bindings: video-interfaces: Document
 'orientation' property
Message-ID: <20200511172008.GA25628@bogus>
References: <20200508100158.3437161-1-jacopo@jmondi.org>
 <20200508100158.3437161-2-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200508100158.3437161-2-jacopo@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri,  8 May 2020 12:01:46 +0200, Jacopo Mondi wrote:
> Add the 'orientation' device property, used to specify the device mounting
> position. The property is particularly meaningful for mobile devices
> with a well defined usage orientation.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  .../devicetree/bindings/media/video-interfaces.txt    | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

