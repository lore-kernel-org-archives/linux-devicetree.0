Return-Path: <SRS0=QJws=63=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57F97C433E0
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 May 2020 21:45:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 386012054F
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 May 2020 21:45:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Nk9gW3VM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729665AbgEMVpz (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 13 May 2020 17:45:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729196AbgEMVpy (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 13 May 2020 17:45:54 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D001C061A0C
        for <devicetree@vger.kernel.org>; Wed, 13 May 2020 14:45:53 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id h16so652110eds.5
        for <devicetree@vger.kernel.org>; Wed, 13 May 2020 14:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MY11drD5CgceiHfxKhUka+QKC07/3b2DJ8CIHJbw6OM=;
        b=Nk9gW3VMjIzYd2caT9WlnMNJkWSoF2u0aIXLlCLlME1HEWg+1EhdbrEFU5b7vBAUID
         gECDn4JDHbMVIq7fiYRNM36SbzYlrMA364OewwBYYyiPWdCgmzvVw9jmSHgP68gsEDzw
         0BV5k1SCZxNepc37s/5wVXbWd1m1YaT8P9MhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MY11drD5CgceiHfxKhUka+QKC07/3b2DJ8CIHJbw6OM=;
        b=pph7Pil6epjqhU6ARY0KXY/CBINss8sQopsT6ZxmleJ+MqyO/6Qed0TMjbjP53T1f1
         ofX3AyezJoVhPXViJjBOMsjRVF3JQG8b93IxdR7Mdv1r4XN2IqmuxROpLaVTzg8ZbO4P
         XTsf9s+31Phuvi2hjkmQouUAP3YJQvmyIhRKi/C0j/G27/DLEayuzhi3TdEcAnOeVwZv
         lYcxpkkeEQVPOYJl5DUJ4e2tVJJmkapAf74KkPw/cEPXC636GlZUx+VjZDEebHmw3B8K
         Umi85j1WoKINF0E+5LPw85zQg7v5dcGmXfc5dbc39td6NDyCCOyeSQwR8XR1r9TABIOu
         Mt6A==
X-Gm-Message-State: AOAM531HeMB5VctDfvX08qwGNnzqs5KskFGUUbUNd0aVwLSRrFHewgGs
        Zym2Y7fXp+aqy6p6mDP64vdI5OQlSMydyA==
X-Google-Smtp-Source: ABdhPJypB+efRtG8TS8OrpRxIHiTmy7lcg5y8IjtCxDTxhA25fxkU/s6wNo7LO98W/Lkf1XV+ISPmw==
X-Received: by 2002:a50:e3cb:: with SMTP id c11mr1530211edm.105.1589406351843;
        Wed, 13 May 2020 14:45:51 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id ov4sm42896ejb.42.2020.05.13.14.45.51
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2020 14:45:51 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id 50so1281896wrc.11
        for <devicetree@vger.kernel.org>; Wed, 13 May 2020 14:45:51 -0700 (PDT)
X-Received: by 2002:a5d:4ccd:: with SMTP id c13mr1532413wrt.415.1589406350494;
 Wed, 13 May 2020 14:45:50 -0700 (PDT)
MIME-Version: 1.0
References: <20191204124732.10932-1-Jerry-Ch.chen@mediatek.com> <1588903371.16825.14.camel@mtksdccf07>
In-Reply-To: <1588903371.16825.14.camel@mtksdccf07>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 13 May 2020 23:45:37 +0200
X-Gmail-Original-Message-ID: <CAAFQd5CP+gH3zG9fejBv_hTzeAExMoY+L38W8e4e3OSc-gVRHg@mail.gmail.com>
Message-ID: <CAAFQd5CP+gH3zG9fejBv_hTzeAExMoY+L38W8e4e3OSc-gVRHg@mail.gmail.com>
Subject: Re: [RFC PATCH V4 0/4] media: platform: Add support for Face
 Detection (FD) on mt8183 SoC
To:     Jerry-ch Chen <Jerry-ch.Chen@mediatek.com>
Cc:     "hans.verkuil@cisco.com" <hans.verkuil@cisco.com>,
        "laurent.pinchart+renesas@ideasonboard.com" 
        <laurent.pinchart+renesas@ideasonboard.com>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "pihsun@chromium.org" <pihsun@chromium.org>,
        "yuzhao@chromium.org" <yuzhao@chromium.org>,
        "zwisler@chromium.org" <zwisler@chromium.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        =?UTF-8?B?U2VhbiBDaGVuZyAo6YSt5piH5byYKQ==?= 
        <Sean.Cheng@mediatek.com>,
        =?UTF-8?B?U2ogSHVhbmcgKOm7g+S/oeeSiyk=?= <sj.huang@mediatek.com>,
        =?UTF-8?B?Q2hyaXN0aWUgWXUgKOa4uOmbheaDoCk=?= 
        <christie.yu@mediatek.com>,
        =?UTF-8?B?RnJlZGVyaWMgQ2hlbiAo6Zmz5L+K5YWDKQ==?= 
        <Frederic.Chen@mediatek.com>,
        =?UTF-8?B?SnVuZ28gTGluICjmnpfmmI7kv4op?= <jungo.lin@mediatek.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Jerry,

On Fri, May 8, 2020 at 4:03 AM Jerry-ch Chen <Jerry-ch.Chen@mediatek.com> wrote:
>
> Hi Laurent, Tomasz, Matthias,
>
> gentle ping for this patch set,
> If no new comments, I would like to send a newer version.
>

Sorry, I still haven't had a chance to look at the series, so feel
free to send a new version and I will take a look at the new one.

Best regards,
Tomasz

> Thanks and Best Regards,
> Jerry
>
> On Wed, 2019-12-04 at 20:47 +0800, Jerry-ch Chen wrote:
> > Hello,
> >
> > This RFC patch series is adding Face Detection (FD) driver on Mediatek
> > mt8183 SoC. It belongs to the first Mediatek's camera driver series based
> > on V4L2 and media controller framework. I posted the main part of the FD
> > driver as RFC to discuss first and would like some review comments.
> >
> > ==============
> > Introduction
> > ==============
> >
> > Face Detection (FD) unit provides hardware accelerated face detection
> > feature. It can detect different sizes of faces in a given image.
> >
> > The driver is implemented as a normal V4L2 memory-to-memory device and
> > supports V4L2 controls for detection settings. It has two buffer queues.
> >
> > 1. Video output buffer: RAW image for face detection.
> >
> > 2. Meta capture buffer: Result of the detected faces.
> >
> > ==================
> > Changes in v4
> > ==================
> >
> > RFC v4 includes the following modification:
> > 1. Includes v4l2-mem2mem changes: add v4l2_m2m_suspend, v4l2_m2m_resume
> >
> > 2. Move FD V4L2 control ids back inside FD driver
> >
> > 3. Depend on newer SCP driver api
> >
> > 4. Add exit hw flow for FD driver
> >
> > 5. Add hardware timeout handling in the FD firmware
> >
> > 6. Move allocation of dma buffer from connect / disconnect to driver probe
> > / remove
> >
> > Todo:
> >  - Add v4l2 control menus for private mtk fd control
> > ==================
> > Changes in v3
> > ==================
> >
> > RFC v3 includes the following modification:
> > 1. Adjust the private control ids and place them in
> >  include/uapi/linux/mtk-fd-v4l2-controls.h
> >
> > 2. Merge struct mtk_fd_hw info struct mtk_fd_dev
> >
> > 3. Define FD meta capture buffer in include/uapi/linux/videodev2.h
> >
> > 4. Remove the usage of get_reserved_memory by scp driver,
> >  use dma_alloc api instead
> >
> > Todo:
> >  - Add v4l2 control menus for private mtk fd control
> >  - Refine the job finish flow when system suspend
> > ==================
> > Changes in v2
> > ==================
> >
> > RFC v2 includes the following modification:
> > 1. Implement FD as a V4L2 mem2mem driver
> >
> > 2. Replace meta input with V4L2 controls
> >
> > ==================
> > Changes in v1
> > ==================
> >
> > RFC v1 includes the following modification:
> > 1. Uses Request API instead of FD's buffer collection design
> >
> > 2. removed unnecessary abstraction structurally, including mtk_fd_ctx and
> > related ops
> >
> > 3. removed the fd_smem node from device tree
> >
> > 4. Fixed the common issues Tomasz commented on Mediatek ISP Pass 1's RFC v0
> > patch series
> >
> > ==================
> > Dependent patch
> > ==================
> >
> > FD driver depends on SCP driver. The patches are as following:
> >
> > [1]. Add support for mt8183 SCP
> > https://patchwork.kernel.org/cover/1152350/
> >
> > ==================
> > Compliance test
> > ==================
> >
> > * Version: https://git.linuxtv.org/v4l-utils.git/commit/?id=b16f9e945d74aa5
> > * Note: Some failures are caused by the implementation of FD driver,
> >         whic is a m2m device with VIDEO_OUT and META_CAPTURE queues,
> >         therefore we can't set V4L2_CAP_VIDEO_M2M in device capability, and
> >         fail in some non-m2m v4l2 test cases.
> > * Test command: v4l2-compliance -m 2
> > * test output:
> >
> > v4l2-compliance SHA: not available, 32 bits
> >
> > Compliance test for mtk-fd-4.0 device /dev/media2:
> >
> > Media Driver Info:
> >         Driver name      : mtk-fd-4.0
> >         Model            : mtk-fd-4.0
> >         Serial           :
> >         Bus info         : platform:1502b000.fd
> >         Media version    : 4.19.84
> >         Hardware revision: 0x00000000 (0)
> >         Driver version   : 4.19.84
> >
> > Required ioctls:
> >         test MEDIA_IOC_DEVICE_INFO: OK
> >
> > Allow for multiple opens:
> >         test second /dev/media2 open: OK
> >         test MEDIA_IOC_DEVICE_INFO: OK
> >         test for unlimited opens: OK
> >
> > Media Controller ioctls:
> >         test MEDIA_IOC_G_TOPOLOGY: OK
> >         Entities: 3 Interfaces: 1 Pads: 4 Links: 4
> >         test MEDIA_IOC_ENUM_ENTITIES/LINKS: OK
> >         test MEDIA_IOC_SETUP_LINK: OK
> >
> > Total for mtk-fd-4.0 device /dev/media2: 7, Succeeded: 7, Failed: 0, Warnings: 0
> > --------------------------------------------------------------------------------
> > Compliance test for mtk-fd-4.0 device /dev/video32:
> >
> > Driver Info:
> >         Driver name      : mtk-fd-4.0
> >         Card type        : mtk-fd-4.0
> >         Bus info         : platform:1502b000.fd
> >         Driver version   : 4.19.84
> >         Capabilities     : 0x84a02000
> >                 Video Output Multiplanar
> >                 Metadata Capture
> >                 Streaming
> >                 Extended Pix Format
> >                 Device Capabilities
> >         Device Caps      : 0x04a02000
> >                 Video Output Multiplanar
> >                 Metadata Capture
> >                 Streaming
> >                 Extended Pix Format
> > Media Driver Info:
> >         Driver name      : mtk-fd-4.0
> >         Model            : mtk-fd-4.0
> >         Serial           :
> >         Bus info         : platform:1502b000.fd
> >         Media version    : 4.19.84
> >         Hardware revision: 0x00000000 (0)
> >         Driver version   : 4.19.84
> > Interface Info:
> >         ID               : 0x0300000c
> >         Type             : V4L Video
> > Entity Info:
> >         ID               : 0x00000001 (1)
> >         Name             : mtk-fd-4.0-source
> >         Function         : V4L2 I/O
> >         Pad 0x01000002   : 0: Source
> >           Link 0x02000008: to remote pad 0x1000005 of entity 'mtk-fd-4.0-proc': Data, Enabled, Immutable
> >
> > Required ioctls:
> >         test MC information (see 'Media Driver Info' above): OK
> >                 fail: v4l2-compliance.cpp(668): dcaps & output_caps
> >         test VIDIOC_QUERYCAP: FAIL
> >
> > Allow for multiple opens:
> >         test second /dev/video32 open: OK
> >                 fail: v4l2-compliance.cpp(668): dcaps & output_caps
> >         test VIDIOC_QUERYCAP: FAIL
> >         test VIDIOC_G/S_PRIORITY: OK
> >         test for unlimited opens: OK
> >
> > Debug ioctls:
> >         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> >         test VIDIOC_LOG_STATUS: OK (Not Supported)
> >
> > Input ioctls:
> >         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> >         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> >         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> >         test VIDIOC_ENUMAUDIO: OK (Not Supported)
> >         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> >         test VIDIOC_G/S_AUDIO: OK (Not Supported)
> >         Inputs: 0 Audio Inputs: 0 Tuners: 0
> >
> > Output ioctls:
> >         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> >         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> >         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> >         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> >         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> >         Outputs: 0 Audio Outputs: 0 Modulators: 0
> >
> > Input/Output configuration ioctls:
> >         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> >         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> >         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> >         test VIDIOC_G/S_EDID: OK (Not Supported)
> >
> > Control ioctls:
> >         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
> >         test VIDIOC_QUERYCTRL: OK
> >         test VIDIOC_G/S_CTRL: OK
> >         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
> >         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
> >         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> >         Standard Controls: 1 Private Controls: 6
> >
> > Format ioctls:
> >         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> >         test VIDIOC_G/S_PARM: OK (Not Supported)
> >         test VIDIOC_G_FBUF: OK (Not Supported)
> >                 fail: v4l2-test-formats.cpp(457): pixelformat 00000000 () for buftype 10 not reported by ENUM_FMT
> >         test VIDIOC_G_FMT: FAIL
> >                 fail: v4l2-test-formats.cpp(457): pixelformat 00000000 () for buftype 10 not reported by ENUM_FMT
> >         test VIDIOC_TRY_FMT: FAIL
> >                 fail: v4l2-test-formats.cpp(457): pixelformat ffffffff (-BE) for buftype 10 not reported by ENUM_FMT
> >         test VIDIOC_S_FMT: FAIL
> >         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> >         test Cropping: OK (Not Supported)
> >         test Composing: OK (Not Supported)
> >         test Scaling: OK (Not Supported)
> >
> > Codec ioctls:
> >         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> >         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> >         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> >
> > Buffer ioctls:
> >                 fail: v4l2-test-buffers.cpp(667): q2.reqbufs(node->node2, 1) != EBUSY
> >         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
> >         test VIDIOC_EXPBUF: OK
> >         test Requests: OK
> >
> > Total for mtk-fd-4.0 device /dev/video32: 45, Succeeded: 39, Failed: 6, Warnings: 0
> >
> > Grand Total for mtk-fd-4.0 device /dev/media2: 52, Succeeded: 46, Failed: 6, Warnings: 0
> >
>
