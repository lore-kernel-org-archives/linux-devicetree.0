Return-Path: <SRS0=mzwU=6O=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFA64C83006
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Apr 2020 08:25:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB8302073E
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Apr 2020 08:25:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nlfgv/lw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726412AbgD3IZI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 30 Apr 2020 04:25:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726777AbgD3IZH (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 30 Apr 2020 04:25:07 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ECCDC035494
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2020 01:25:07 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id e26so831476wmk.5
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2020 01:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=X6kBmgjWNGdoNWM+7HP6Cv8RL/gtxXSH0Zcy+2SUkTg=;
        b=nlfgv/lwGO9u4M/cSd8s6bWYEd60n1HD9hX4RDYFeI6OM5b5/NS+Th7J2Udh6Fer0k
         DgjCL6hq1Oe0dnPWSx2KED3KQCkEicF3F5fi4lbzX9RmkUUJ87uaGgCm0d3AMzH3WoIi
         RJCIpL5QPBeAVE+HBDQEd1DUJFUotoDiX/5diJOFhvDrFX1xaXwYusiT4xUiclcepUHk
         DY8FIUfbfAQReWU0N0sy92dKJXOjkifLiGUuD8U3CbGdljXWWevYVVfdvlMQhO9zlirS
         yZ9TOFMBupFXFOzWg9N3ZCMfzM2AKi3GawTxnx1UEzRPRtAHEZ2lCSj+XFa3L/GlJj1K
         gF5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=X6kBmgjWNGdoNWM+7HP6Cv8RL/gtxXSH0Zcy+2SUkTg=;
        b=DoU5yh/z4I0YScutTlMpDz6hm9vu0qkk+8QdAZJsTNI7XHLyFatRpDPgmoK+helnlk
         j7z67+0aAYk24gP0usmzFolj4hqzS6s2Ad79K/aa8YsDYy5D91kmFP4mKUSRYxK29Tyu
         qmmkAsoit/ehY19SuT7qRhzMVwD3kZ9FlzeayxZd9rtW9SK6tTCTRAfFpAbNXp5umiNn
         JQ3sAAwbyVGyExJti5sk/OIOzMv//PIYK51wIRIbSc8SQMEe61wWFW1FQtGBvy8CLeQs
         WULlMxK3UnOCBLpscj5zRfr/Sepo3Nw5Ra/pByT0QebC9+E9AShj991MyN3g3zhUoqg1
         oVoA==
X-Gm-Message-State: AGi0PuZle9E45ZocEBlesuKF5ITQ7o4N0ENwfo4yiw5MKb5525kh8IfF
        C6VNEdHrqxO67lRGMYqmixCpoQ==
X-Google-Smtp-Source: APiQypKS6rkdhsHbc2UUSlH3zD912MOA6ZFRvxtjDMHneZ8QIX90PvJVdV6AmPOLALep6jeYDNbP1Q==
X-Received: by 2002:a1c:4e12:: with SMTP id g18mr1649275wmh.11.1588235106039;
        Thu, 30 Apr 2020 01:25:06 -0700 (PDT)
Received: from dell ([2.31.163.63])
        by smtp.gmail.com with ESMTPSA id u7sm12108468wmg.41.2020.04.30.01.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 01:25:05 -0700 (PDT)
Date:   Thu, 30 Apr 2020 09:25:03 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Dilip Kota <eswara.kota@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, kishon@ti.com, vkoul@kernel.org,
        devicetree@vger.kernel.org, arnd@arndb.de, robh@kernel.org,
        andriy.shevchenko@intel.com, cheol.yong.kim@intel.com,
        chuanhua.lei@linux.intel.com, qi-ming.wu@intel.com,
        yixin.zhu@intel.com
Subject: Re: [PATCH v7 0/3] Add Intel ComboPhy driver
Message-ID: <20200430082503.GA3118@dell>
References: <cover.1588230494.git.eswara.kota@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1588230494.git.eswara.kota@linux.intel.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, 30 Apr 2020, Dilip Kota wrote:

> This patch series adds Intel ComboPhy driver, respective yaml schemas
> 
> Changes on v7:
>   As per System control driver maintainer's inputs remove
>     fwnode_to_regmap() definition and use device_node_get_regmap()
>     
> Changes on v6:
>   Rebase patches on the latest maintainer's branch
>   https://git.kernel.org/pub/scm/linux/kernel/git/kishon/linux-phy.git/?h=phy-for-5.7
> Dilip Kota (3):
>   dt-bindings: phy: Add PHY_TYPE_XPCS definition
>   dt-bindings: phy: Add YAML schemas for Intel ComboPhy
>   phy: intel: Add driver support for ComboPhy
> 
>  .../devicetree/bindings/phy/intel,combo-phy.yaml   | 101 ++++
>  drivers/phy/intel/Kconfig                          |  14 +
>  drivers/phy/intel/Makefile                         |   1 +
>  drivers/phy/intel/phy-intel-combo.c                | 627 +++++++++++++++++++++
>  include/dt-bindings/phy/phy.h                      |   1 +

Why have you sent this to me?

>  5 files changed, 744 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/intel,combo-phy.yaml
>  create mode 100644 drivers/phy/intel/phy-intel-combo.c
> 

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
