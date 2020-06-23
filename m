Return-Path: <SRS0=lOvj=AE=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97DF8C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 23 Jun 2020 18:44:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6F44A20781
	for <linux-devicetree@archiver.kernel.org>; Tue, 23 Jun 2020 18:44:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=vanguardiasur-com-ar.20150623.gappssmtp.com header.i=@vanguardiasur-com-ar.20150623.gappssmtp.com header.b="O84lAlQt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733181AbgFWSoZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 23 Jun 2020 14:44:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733152AbgFWSoY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 23 Jun 2020 14:44:24 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26499C061573
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2020 11:44:24 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id d15so17112501edm.10
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2020 11:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YHRfY/482pH60fZPQJikxqae/P0Z6lDDbQXNlIRp7tc=;
        b=O84lAlQtan6g3BHHHf7sIEL60Tt8VsrCeEVE8CQeBdNfZtWiEkIBf5EnEBTSnOIYhV
         EPdW4t8kcLvZ9LhfuTnNxdMsJ721WftZAm2YfItBlw7ZCfjOPOaCPgEhEUNc/LV9MpMT
         UfTabuopH1KekbGurNoL/s3jNY+zFWjIe+weZsQUyV611kaMJC6SyKOGCy0LGyPBBocU
         I6eEwuTw3L5JxgW9yX5wsfKT5IEMwvCDD1gcvJX0Dzz/DeyHX3FjI/lPlo2zl6EOxPbC
         oaCdMzn5EhGGffrjqZGBaLeDIrHSd1fkpJvfsTmFDUL3W1alvsulTjb0gLAndKmgvLhD
         JFYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YHRfY/482pH60fZPQJikxqae/P0Z6lDDbQXNlIRp7tc=;
        b=ERSXCtgUtSdkFOCVFtez/P40vo4MrdkSM8eMaXtKylji9C21qU9sSFgt43qzqpDfuF
         U5Uhy2gbZYcNvg2K2uXlx8I30e+LOjrm8AFeyWLAVLweg4eemzmmdM4CDolF79LUYmiN
         n+nZlO4PGfHkSeEiVPL/Io7PrDVxwNBGK6xgfjWJotYylbDM/BpALBduNaGURJ8T50Q2
         EfEQUYmBLoiEb4kJD8/heErVh4XU7Jbew0NGMhhxMNDT6SaCRRkBMScupUd/Yx3vt7K3
         Qb+HRGZJaiuCYGcQwW0IR63k0KOIFeiiZIKBMFSrVyzZGuT5s5Mk8/MEtuP084CpIwVN
         UnRQ==
X-Gm-Message-State: AOAM532Mpcabcftxpl0XkcGcQGLT2fp+ePD4mxB7CoBFGKLDW4ogv6ab
        rG9tDJOAjVQHtHt0RQJFtrIGYu01AsLVlvlVDnrxag==
X-Google-Smtp-Source: ABdhPJyPUIlDVH1n7pGFYZ5aO9aLZJphcDUMccOXmcIiaLZUxDvA5Dpv5o3A65C6wRy4Z9PcnkaV9feKOmD03dYG9P4=
X-Received: by 2002:a05:6402:1247:: with SMTP id l7mr22177355edw.61.1592937862811;
 Tue, 23 Jun 2020 11:44:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200622015227.24134-1-yunfei.dong@mediatek.com>
In-Reply-To: <20200622015227.24134-1-yunfei.dong@mediatek.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Tue, 23 Jun 2020 15:43:47 -0300
Message-ID: <CAAEAJfBtuZUn-LxiwCZ75rwT_oEuM-_QEXCH4-vFhV6X+8=4SA@mail.gmail.com>
Subject: Re: [PATCH v2, 0/2] This patchset add Read-only(Ro) request for
 capture queue
To:     Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-media <linux-media@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Tomasz Figa <tfiga@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Yunfei,

Thanks for the patch.

On Sun, 21 Jun 2020 at 22:55, Yunfei Dong <yunfei.dong@mediatek.com> wrote:
>
> User driver need to get HDR10+ information for each capture buffer;
> For some encoder cases, user driver need to get encoded message for
> each frame. So add support read-only(Ro) request for capture queue.
>
> Ro request mean that user driver just can get ext ctrls, set ext ctrls
> is not not allowed. Ro Request also can be used in output queue.
>
> There is not upstream driver to use this feature at now, but we are
> developing internal driver to use it. If it is ready, we will try to
> upstream vdec/venc driver based on this feature.
>

An upstream driver using the feature would be important, but it would
be nice to also have: an open-source userspace application,
and a proper explanation in the stateless decoder interface specification.

Thanks,
Ezequiel

> Change compared to v1:
> -change commit message of patch 01/02
> -change commit message of patch 02/02
>
> Yunfei Dong (2):
>   media: v4l UAPI: add V4L2_BUF_CAP_SUPPORTS_RO_REQUESTS
>   media: v4l: Add Ro request api for capture queue
>
>  .../media/v4l/vidioc-reqbufs.rst              |   4 +
>  .../media/common/videobuf2/videobuf2-v4l2.c   |   7 ++
>  drivers/media/mc/mc-request.c                 |  10 +-
>  drivers/media/v4l2-core/v4l2-ctrls.c          | 107 +++++++++++++++---
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  22 ++++
>  drivers/media/v4l2-core/v4l2-mem2mem.c        |  19 ++--
>  include/media/v4l2-ctrls.h                    |  22 +++-
>  include/media/v4l2-fh.h                       |   2 +
>  include/media/videobuf2-core.h                |   2 +
>  include/uapi/linux/videodev2.h                |   1 +
>  10 files changed, 158 insertions(+), 38 deletions(-)
>
