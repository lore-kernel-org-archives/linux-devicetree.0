Return-Path: <SRS0=21hy=4I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLACK autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3539C11D0C
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Feb 2020 17:28:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9D8A924672
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Feb 2020 17:28:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20150623.gappssmtp.com header.i=@thegoodpenguin-co-uk.20150623.gappssmtp.com header.b="CmcyeEBO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728115AbgBTR2n (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 20 Feb 2020 12:28:43 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45418 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727709AbgBTR2l (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 20 Feb 2020 12:28:41 -0500
Received: by mail-wr1-f68.google.com with SMTP id g3so5505118wrs.12
        for <devicetree@vger.kernel.org>; Thu, 20 Feb 2020 09:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yg7V2Kitryz7uYVlNn64dGZz3YZSbyjf9HbgWJJRDAs=;
        b=CmcyeEBOB0TBNIvz/p5XwnAlafyqGrCgVEgvaMgTdOyuEONJXLWP2BuiWcL4WTxOud
         aUmSx7qqn2snU2zgLbXE/a66nZ3j+UuSMi6wHwMi4skzKVGsuRninJFjVqkPpPvuleLN
         8oPei3Ks+Bok6gh12rhXHBfAPK68q+J3FZYwlmxH1pT4bAB8lri9bhSDZ9SJzQdSiaTS
         ZP/lWL+rjHiKe5nRyh/+DBhzVnRap+ng90tFDcMfJDiN90TXG4QRa9gYT0too8nHBeRy
         1bX7b/t+H2/IYLVuJNZLgSYdBe1IGb/tJnbQF1UMxedMk6fr0hWAmTyry39gpCbWcW80
         Oigw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yg7V2Kitryz7uYVlNn64dGZz3YZSbyjf9HbgWJJRDAs=;
        b=Tc6FQsfeBi6baFpQF6hynUV+1q0AwMAgKV+coKQwEjeUXuDTLgNqSggyI7/3hSYfuF
         AI5vTuk0KjLJq8hYmOcIoSB4GPLkv6+qorEO/DrJoPtSmucnkmC6la5oB0je2EnAYRgr
         mpX/YrFE9ktl+8ucsg8X8ARszWo4na7NMf/3wNYK0NwNZQZtRZRDY06KTVOYR3evMoxT
         Jo97oLnwq3T9ppVlLJPhYdMS00MCK4IQSIt/aJio4V8J44sRmxc9OU74NuChx+5G75Bs
         EOzQmC5kUGHoRqi66+jgGY3Zu4NwkkRZKtNg/lFtuuXlgcWfm8GBkc1OsEIkpaZ7OMdY
         ytKg==
X-Gm-Message-State: APjAAAWxameIR4ywsPE87Lj1WljOgglDzlg2w5dfryItlZGK31gC+MM4
        HdjKp5ldN/WW9BRDhTpFHJtbmg==
X-Google-Smtp-Source: APXvYqzcciySjNsv1+b17UtCc7Fw4uKQANx0Sd40ea91V7lOrEtBQbKyOMSjPgOQOSdAmaRoO3SEBQ==
X-Received: by 2002:adf:ed09:: with SMTP id a9mr44518842wro.350.1582219719426;
        Thu, 20 Feb 2020 09:28:39 -0800 (PST)
Received: from big-machine ([2a00:23c5:dd80:8400:98d8:49e6:cdcc:25df])
        by smtp.gmail.com with ESMTPSA id 2sm252807wrq.31.2020.02.20.09.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2020 09:28:38 -0800 (PST)
Date:   Thu, 20 Feb 2020 17:28:37 +0000
From:   Andrew Murray <amurray@thegoodpenguin.co.uk>
To:     Zhiqiang Hou <Zhiqiang.Hou@nxp.com>
Cc:     linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bhelgaas@google.com, robh+dt@kernel.org, andrew.murray@arm.com,
        arnd@arndb.de, mark.rutland@arm.com, l.subrahmanya@mobiveil.co.in,
        shawnguo@kernel.org, m.karthikeyan@mobiveil.co.in,
        leoyang.li@nxp.com, lorenzo.pieralisi@arm.com,
        catalin.marinas@arm.com, will.deacon@arm.com, Mingkai.Hu@nxp.com,
        Minghuan.Lian@nxp.com, Xiaowei.Bao@nxp.com
Subject: Re: [PATCHv10 07/13] PCI: mobiveil: Allow mobiveil_host_init() to be
 used to re-init host
Message-ID: <20200220172837.GH19388@big-machine>
References: <20200213040644.45858-1-Zhiqiang.Hou@nxp.com>
 <20200213040644.45858-8-Zhiqiang.Hou@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200213040644.45858-8-Zhiqiang.Hou@nxp.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Feb 13, 2020 at 12:06:38PM +0800, Zhiqiang Hou wrote:
> From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> 
> Allow the mobiveil_host_init() function to be used to re-init
> host controller's PAB and GPEX CSR register block, as NXP
> integrated Mobiveil IP has to reset and then re-init the PAB
> and GPEX CSR registers upon hot-reset.
> 
> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> Reviewed-by: Subrahmanya Lingappa <l.subrahmanya@mobiveil.co.in>

Reviewed-by: Andrew Murray <amurray@thegoodpenguin.co.uk>

> ---
> V10:
>  - Refined the subject and change log.
> 
>  .../controller/mobiveil/pcie-mobiveil-host.c  | 19 ++++++++++++-------
>  .../pci/controller/mobiveil/pcie-mobiveil.h   |  1 +
>  2 files changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c b/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c
> index 53ab8412a1de..44dd641fede3 100644
> --- a/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c
> +++ b/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c
> @@ -221,18 +221,23 @@ static void mobiveil_pcie_enable_msi(struct mobiveil_pcie *pcie)
>  	writel_relaxed(1, pcie->apb_csr_base + MSI_ENABLE_OFFSET);
>  }
>  
> -static int mobiveil_host_init(struct mobiveil_pcie *pcie)
> +int mobiveil_host_init(struct mobiveil_pcie *pcie, bool reinit)
>  {
>  	struct mobiveil_root_port *rp = &pcie->rp;
>  	struct pci_host_bridge *bridge = rp->bridge;
>  	u32 value, pab_ctrl, type;
>  	struct resource_entry *win;
>  
> -	/* setup bus numbers */
> -	value = mobiveil_csr_readl(pcie, PCI_PRIMARY_BUS);
> -	value &= 0xff000000;
> -	value |= 0x00ff0100;
> -	mobiveil_csr_writel(pcie, value, PCI_PRIMARY_BUS);
> +	pcie->ib_wins_configured = 0;
> +	pcie->ob_wins_configured = 0;
> +
> +	if (!reinit) {
> +		/* setup bus numbers */
> +		value = mobiveil_csr_readl(pcie, PCI_PRIMARY_BUS);
> +		value &= 0xff000000;
> +		value |= 0x00ff0100;
> +		mobiveil_csr_writel(pcie, value, PCI_PRIMARY_BUS);
> +	}
>  
>  	/*
>  	 * program Bus Master Enable Bit in Command Register in PAB Config
> @@ -576,7 +581,7 @@ int mobiveil_pcie_host_probe(struct mobiveil_pcie *pcie)
>  	 * configure all inbound and outbound windows and prepare the RC for
>  	 * config access
>  	 */
> -	ret = mobiveil_host_init(pcie);
> +	ret = mobiveil_host_init(pcie, false);
>  	if (ret) {
>  		dev_err(dev, "Failed to initialize host\n");
>  		return ret;
> diff --git a/drivers/pci/controller/mobiveil/pcie-mobiveil.h b/drivers/pci/controller/mobiveil/pcie-mobiveil.h
> index 346bf79a581b..623c5f0c4441 100644
> --- a/drivers/pci/controller/mobiveil/pcie-mobiveil.h
> +++ b/drivers/pci/controller/mobiveil/pcie-mobiveil.h
> @@ -166,6 +166,7 @@ struct mobiveil_pcie {
>  };
>  
>  int mobiveil_pcie_host_probe(struct mobiveil_pcie *pcie);
> +int mobiveil_host_init(struct mobiveil_pcie *pcie, bool reinit);
>  bool mobiveil_pcie_link_up(struct mobiveil_pcie *pcie);
>  int mobiveil_bringup_link(struct mobiveil_pcie *pcie);
>  void program_ob_windows(struct mobiveil_pcie *pcie, int win_num, u64 cpu_addr,
> -- 
> 2.17.1
> 
