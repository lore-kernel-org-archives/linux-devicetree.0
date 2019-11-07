Return-Path: <SRS0=C4ig=Y7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC825C5DF61
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 Nov 2019 03:58:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B032E20869
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 Nov 2019 03:58:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nkEHapD/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733102AbfKGD6Y (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 6 Nov 2019 22:58:24 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:34500 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733101AbfKGD6Y (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 6 Nov 2019 22:58:24 -0500
Received: by mail-pl1-f193.google.com with SMTP id k7so524842pll.1
        for <devicetree@vger.kernel.org>; Wed, 06 Nov 2019 19:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9GmxJGdDL35hIWtTVdTygW9Ztn4rOAQPxM5+Tu63S6Q=;
        b=nkEHapD/g+Sgly2+Nt3aVAcHLo7ZieZHz02HhFipDyBmEJ17TuJOPvaBpKVLt8hmZ4
         WaXcKQDM0QAn0L/5ATm0doZ65pxruMJuaROP4D3TWTEiRejEYUrKKN+YNHnMdVqyYLn9
         V9g3Vt+QEB/bERM7/kf5BRWm8WlWO+UwULvxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9GmxJGdDL35hIWtTVdTygW9Ztn4rOAQPxM5+Tu63S6Q=;
        b=RpxGsokTOTmLx1m4ipnCdF5FGTGShT/+8oXqvgMpLz8o14VR27H9Lu9UdngpKEbiB8
         ClG1yIzLnQzHpVspUiNo114UbLFIfgdwvmiC0Jux+I7TG5o2lAzUQEwV9sf5YI2Hqsvw
         GFaSqgjGzfxwOvkuykepC4ysjsyirm1F36ekGn+FYWpSE3jX6OzB81JqBmtD0+T0kHwW
         ncX/xYHdnbWvjZNK9psGM6QxTr1T7YQ3FZfUtUCBUvOD5sG1NKZEoU73n6CqR3FybpWP
         EelVaWo6do3SdUtwTkOYPalUuAr2yjm0ZR8xqBMGmMZtV8TjEkrJYFHYB7Du62rl1Dsh
         JBHw==
X-Gm-Message-State: APjAAAVH5Lj95FbzhZ17YEk9MOdUCmODB/TV+hNuEXMD4fFV7NmqQy0c
        zBpkCmSxXO+ePrV4nmzY8lVQCg==
X-Google-Smtp-Source: APXvYqy/J5ZM4ai8ToCaJwrShEkVZmE2/puOUgublwvWGb1Tk2GhISYMwfGTAFZM0gyzkCjxsMgzwQ==
X-Received: by 2002:a17:902:6acb:: with SMTP id i11mr1428339plt.214.1573099102708;
        Wed, 06 Nov 2019 19:58:22 -0800 (PST)
Received: from pihsun-z840.tpe.corp.google.com ([2401:fa00:1:10:7889:7a43:f899:134c])
        by smtp.gmail.com with ESMTPSA id r8sm592525pgr.59.2019.11.06.19.58.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2019 19:58:22 -0800 (PST)
Subject: Re: [RFC, v3, 4/4] media: platform: mtk-mdp3: Add Mediatek MDP3
 driver
To:     Bibby Hsieh <bibby.hsieh@mediatek.com>, hans.verkuil@cisco.com,
        laurent.pinchart+renesas@ideasonboard.com, tfiga@chromium.org,
        matthias.bgg@gmail.com, mchehab@kernel.org
Cc:     yuzhao@chromium.org, zwisler@chromium.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, Sean.Cheng@mediatek.com,
        sj.huang@mediatek.com, christie.yu@mediatek.com,
        holmes.chiou@mediatek.com, frederic.chen@mediatek.com,
        Jerry-ch.Chen@mediatek.com, jungo.lin@mediatek.com,
        Rynn.Wu@mediatek.com, linux-media@vger.kernel.org,
        srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
        Daoyuan.Huang@mediatek.com,
        Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
References: <20190911094013.5892-1-bibby.hsieh@mediatek.com>
From:   Pi-Hsun Shih <pihsun@chromium.org>
Message-ID: <d5e5a1e2-3422-8ef6-f58a-981fc5bc2449@chromium.org>
Date:   Thu, 7 Nov 2019 11:58:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190911094013.5892-1-bibby.hsieh@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On 9/11/19 5:40 PM, Bibby Hsieh wrote:
> From: daoyuan huang <daoyuan.huang@mediatek.com>
> 
> This patch adds driver for Media Data Path 3 (MDP3).
> Each modules' related operation control is sited in mtk-mdp3-comp.c
> Each modules' register table is defined in file with "mdp_reg_"
> and "mmsys_" prefix
> GCE related API, operation control  sited in mtk-mdp3-cmdq.c
> V4L2 m2m device functions are implemented in mtk-mdp3-m2m.c
> Probe, power, suspend/resume, system level functions are defined in
> mtk-mdp3-core.c
> 
> Signed-off-by: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> Signed-off-by: daoyuan huang <daoyuan.huang@mediatek.com>
> ---
> ...
> diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
> new file mode 100644
> ... > +static int mdp_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct mdp_dev *mdp;
> +	phandle rproc_phandle;
> +	int ret;
> +
> +	mdp = devm_kzalloc(dev, sizeof(*mdp), GFP_KERNEL);
> +	if (!mdp)
> +		return -ENOMEM;
> +
> +	mdp->pdev = pdev;
> +	ret = mdp_component_init(mdp);
> +	if (ret) {
> +		dev_err(dev, "Failed to initialize mdp components\n");
> +		goto err_return;
> +	}
> +
> +	mdp->job_wq = alloc_workqueue(MDP_MODULE_NAME, WQ_FREEZABLE, 0);
> +	if (!mdp->job_wq) {
> +		dev_err(dev, "Unable to create job workqueue\n");
> +		ret = -ENOMEM;
> +		goto err_destroy_job_wq;
> +	}
> +
> +	mdp->clock_wq = alloc_workqueue(MDP_MODULE_NAME "-clock", WQ_FREEZABLE,
> +					0);
> +	if (!mdp->clock_wq) {
> +		dev_err(dev, "Unable to create clock workqueue\n");
> +		ret = -ENOMEM;
> +		goto err_destroy_clock_wq;
> +	}
> +
> +	mdp->vpu_dev = scp_get_pdev(pdev);
> +
> +	ret = of_property_read_u32(pdev->dev.of_node, "mediatek,scp",
> +				   &rproc_phandle);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Could not get scp device\n");
> +		goto err_destroy_clock_wq;
> +	}
> +
> +	mdp->rproc_handle = rproc_get_by_phandle(rproc_phandle);
> +
> +	dev_info(&pdev->dev, "MDP rproc_handle: %llx",
> +		 (unsigned long long)mdp->rproc_handle);
> +
> +	if (!mdp->rproc_handle) {
> +		dev_err(&pdev->dev, "Could not get MDP's rproc_handle\n");

"ret" is not set in this error path, ret = -ENODEV?

> +		goto err_destroy_clock_wq;
> +	}
> +
> +	mutex_init(&mdp->vpu_lock);
> +	mutex_init(&mdp->m2m_lock);
> +
> +	mdp->cmdq_clt = cmdq_mbox_create(dev, 0, 1200);
> +	if (IS_ERR(mdp->cmdq_clt))

Same here, ret = PTR_ERR(mdp->cmdq_clt)?

> +		goto err_destroy_clock_wq;
> +
> +	init_waitqueue_head(&mdp->callback_wq);
> +	ida_init(&mdp->mdp_ida);
> +	platform_set_drvdata(pdev, mdp);
> +
> +	vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
> +	pm_runtime_enable(dev);
> +
> +	ret = v4l2_device_register(dev, &mdp->v4l2_dev);
> +	if (ret) {
> +		dev_err(dev, "Failed to register v4l2 device\n");
> +		ret = -EINVAL;
> +		goto err_mbox_destroy;
> +	}
> +
> +	ret = mdp_m2m_device_register(mdp);
> +	if (ret) {
> +		v4l2_err(&mdp->v4l2_dev, "Failed to register m2m device\n");
> +		goto err_unregister_device;
> +	}
> +
> +	dev_dbg(dev, "mdp-%d registered successfully\n", pdev->id);
> +	return 0;
> +
> +err_unregister_device:
> +	v4l2_device_unregister(&mdp->v4l2_dev);
> +err_mbox_destroy:
> +	cmdq_mbox_destroy(mdp->cmdq_clt);
> +err_destroy_clock_wq:
> +	destroy_workqueue(mdp->clock_wq);
> +err_destroy_job_wq:
> +	destroy_workqueue(mdp->job_wq);
> +err_return:
> +	dev_dbg(dev, "Errno %d\n", ret);
> +	return ret;
> +}
> ...
> 
