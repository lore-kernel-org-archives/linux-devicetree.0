Return-Path: <SRS0=KHEV=2G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 014EFC43603
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Dec 2019 21:22:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B916722464
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Dec 2019 21:22:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mQ67J6VJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726692AbfLPVWn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 16 Dec 2019 16:22:43 -0500
Received: from mail-il1-f193.google.com ([209.85.166.193]:37483 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726646AbfLPVWn (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 16 Dec 2019 16:22:43 -0500
Received: by mail-il1-f193.google.com with SMTP id t8so5176724iln.4
        for <devicetree@vger.kernel.org>; Mon, 16 Dec 2019 13:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ADULMXYZJpcRkOz8oTK37UQEihg1gv7L4Ikzy6wAV8w=;
        b=mQ67J6VJ/LWSkL+e7p0f5Fk2NJWWIADY59kJlh/sRuY42DK0DHq/QjDsmKVCP7enot
         NNhbE3vWS/2WbTqxpD4BPctVOSWpLETvpgtQ+lz1q/bjvqjW00mx71xFi9kiAw8xPS5i
         BLTSVJT+8skCvNfcBilC4UOVSOTuq9v3/cgeRDL3PgmDq7W/Gxi6UOVo5KOE8EBdZF1c
         ELDU5BrKsyXcVKxRUqpvbOaUka1pdgR0vEefjodOj5fAxa04+aGLHgavSgMIrP29BBVA
         YkOgadcRtaYm1t0x7S6O/mFzzSnbberlwvfjneCy8ULEuZrzhCXo/I0vmhmXgkwtLWre
         LW8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ADULMXYZJpcRkOz8oTK37UQEihg1gv7L4Ikzy6wAV8w=;
        b=K16Qnw687DrxOKF7Zt+FXH1vnBeAJd+EdkscC9n3x0BN0Oon/uvOND6NSWEBiy8K6p
         kICg2DuRlGkY+xsLy/zgu14jCSriI+Lx4sQw6Sz/fn3GlJEo17jgtdd2tdQNwpzmW2x/
         +XcUSmYzN/G3GV5Xk9hOrdazjfNhpGJzde5XSwdWUd3QSPaQ3g0wjV06Y/AAJvzdJaP3
         p4GrkfExIjVAoTjG5FP3s/Y3s9anoqYqJwlDSQOiethnQogaNlcnzGoc2fU8hE/lD+kU
         L/w1jAEU/eAo1EI7WCYeSnU+bAWXR9W2wOatrlOkBglrrpS279ayggy4hJhL8NOnkr0r
         LeYw==
X-Gm-Message-State: APjAAAWgb205wtY8mwSQmIksEYEXMGGF4kfzNaQk6v1RRpFioLGCw/p2
        E+yLuiw1HKJqm3naxqJhqa/32HjUKRfzcnOWmh4i7g==
X-Google-Smtp-Source: APXvYqxKp36+zgCZmrmmEq4UUIRfilecqGMmjdSfPKSfrEGJReCrdXjvR9aFopP+CCSdjkywQS2yOLBeyO/r9DNsSvM=
X-Received: by 2002:a92:1711:: with SMTP id u17mr12955418ill.72.1576531362252;
 Mon, 16 Dec 2019 13:22:42 -0800 (PST)
MIME-Version: 1.0
References: <20191211230717.4879-1-mike.leach@linaro.org>
In-Reply-To: <20191211230717.4879-1-mike.leach@linaro.org>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Mon, 16 Dec 2019 14:22:30 -0700
Message-ID: <CANLsYkzVcTYutoYt5DWiOxyB8m3kCZVPHpTJPPe7YN=OoKtj1g@mail.gmail.com>
Subject: Re: [PATCH v6 00/15] CoreSight CTI Driver
To:     Mike Leach <mike.leach@linaro.org>
Cc:     linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Coresight ML <coresight@lists.linaro.org>,
        devicetree@vger.kernel.org,
        "Suzuki K. Poulose" <suzuki.poulose@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Andy Gross <agross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 11 Dec 2019 at 16:07, Mike Leach <mike.leach@linaro.org> wrote:
>
> CTIs are defined in the device tree and associated with other CoreSight
> devices. The core CoreSight code has been modified to enable the registration
> of the CTI devices on the same bus as the other CoreSight components,
> but as these are not actually trace generation / capture devices, they
> are not part of the Coresight path when generating trace.
>
> However, the definition of the standard CoreSight device has been extended
> to include a reference to an associated CTI device, and the enable / disable
> trace path operations will auto enable/disable any associated CTI devices at
> the same time.
>
> Programming is at present via sysfs - a full API is provided to utilise the
> hardware capabilities. As CTI devices are unprogrammed by default, the auto
> enable describe above will have no effect until explicit programming takes
> place.
>
> A set of device tree bindings specific to the CTI topology has been defined.
> The driver accesses these in a platform agnostic manner, so ACPI bindings
> can be added later, once they have been agreed and defined for the CTI device.
>
> Documentation has been updated to describe both the CTI hardware, its use and
> programming in sysfs, and the new dts bindings required.
>
> Tested on DB410 board and Juno board, against the Linux 5.5-rc1 tree.
>
> Changes since v5:
> 1) Fixed up device tree .yaml file. Using extra compatible string for
> v8 architecture CTI connections.
> 2) Ensure association code respects coresight mutex when setting cross
> referenced pointers. Add in shutdown code.
> 3) Multiple minor code fixes & rationalisation.
>
> Changes since v4:
> Multiple changes following feedback from Mathieu, Leo and Suzuki.
> 1) Dropped RFC tag - wider distribution
> 2) CTI bindings definition now presented as a .yaml file - tested with
> with 'dt-doc-validate' from devicetree.org/dt-schema project and in kernel
> build tree with 'make dtbs_check' per kernel docs.
> 3) Sysfs links to other CoreSight devices moved out of this set into
> a following set that deals with all CoreSight devices & sysfs links.
> 4) Documentation in .rst format and new directory following patchset in [1].
> Extended example provided in docs.
> 5) Rationalised devicetree of_ specifics to use generic fwnode functions
> where possible to enable easier addition of ACPI support later.
> 6) Other minor changes as requested in feedback from last patchset.
>
> Changes since v3:
> 1) After discussion on CS mailing list, each CTI connection has a triggers<N>
>    sysfs directory with name and trigger signals listed for the connection.
> 2) Initial code for creating sysfs links between CoreSight components is
>   introduced and implementation for CTI provided. This allows exploration
>   of the CoreSight topology within the sysfs infrastructure. Patches for
>   links between other CoreSight components to follow.
> 3) Power management - CPU hotplug and idle omitted from this set as ongoing
>    developments may define required direction. Additional patch set to follow.
> 4) Multiple fixes applied as requested by reviewers esp. Matthieu, Suzuki
>    and Leo.
>
> Changes since v2:
> Updates to allow for new features on coresight/next and feedback from
> Mathieu and Leo.
>
> 1) Rebase and restructuring to apply on top of ACPI support patch set,
> currently on coresight/next. of_coresight_cti has been renamed to
> coresight-cti-platform and device tree bindings added to this but accessed
> in a platform agnostic manner using fwnode for later ACPI support
> to be added.
> 2) Split the sysfs patch info a series of functional patches.
> 3) Revised the refcount and enabling support.
> 4) Adopted the generic naming protocol - CTIs are either cti_cpuN or
> cti_sysM
> 5) Various minor presentation /checkpatch issues highlighted in feedback.
> 6) revised CPU hotplug to cover missing cases needed by ETM.
>
> Changes since v1:
> 1) Significant restructuring of the source code. Adds cti-sysfs file and
> cti device tree file. Patches add per feature rather than per source
> file.
> 2) CPU type power event handling for hotplug moved to CoreSight core,
> with generic registration interface provided for all CPU bound CS devices
> to use.
> 3) CTI signal interconnection details in sysfs now generated dynamically
> from connection lists in driver. This to fix issue with multi-line sysfs
> output in previous version.
> 4) Full device tree bindings for DB410 and Juno provided (to the extent
> that CTI information is available).
> 5) AMBA driver update for UCI IDs are now upstream so no longer included
> in this set.
>
> Mike Leach (15):
>   coresight: cti: Initial CoreSight CTI Driver
>   coresight: cti: Add sysfs coresight mgmt reg access.
>   coresight: cti: Add sysfs access to program function regs
>   coresight: cti: Add sysfs trigger / channel programming API
>   dt-bindings: arm: Adds CoreSight CTI hardware definitions.
>   coresight: cti: Add device tree support for v8 arch CTI
>   coresight: cti: Add device tree support for custom CTI.
>   coresight: cti: Enable CTI associated with devices.
>   coresight: cti: Add connection information to sysfs
>   dt-bindings: qcom: Add CTI options for qcom msm8916
>   dt-bindings: arm: Juno platform - add CTI entries to device tree.
>   dt-bindings: hisilicon: Add CTI bindings for hi-6220
>   docs: coresight: Update documentation for CoreSight to cover CTI.
>   docs: sysfs: coresight: Add sysfs ABI documentation for CTI
>   Update MAINTAINERS to add reviewer for CoreSight.
>

All that needs to be sorted out in this set are the comments made by
Maxime.  When you do address those please only resend that patch.
Since Maxime's comments are related to yaml syntax rather than the
bindings themselves, I have added your set to my next tree so that it
can soak in linux-next over the next few weeks.

Thanks,
Mathieu

>  .../testing/sysfs-bus-coresight-devices-cti   |  221 ++++
>  .../bindings/arm/coresight-cti.yaml           |  303 +++++
>  .../devicetree/bindings/arm/coresight.txt     |    7 +
>  .../trace/coresight/coresight-ect.rst         |  211 +++
>  Documentation/trace/coresight/coresight.rst   |   13 +
>  MAINTAINERS                                   |    3 +
>  arch/arm64/boot/dts/arm/juno-base.dtsi        |  149 ++-
>  arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi     |   31 +-
>  arch/arm64/boot/dts/arm/juno-r1.dts           |   25 +
>  arch/arm64/boot/dts/arm/juno-r2.dts           |   25 +
>  arch/arm64/boot/dts/arm/juno.dts              |   25 +
>  .../boot/dts/hisilicon/hi6220-coresight.dtsi  |  130 +-
>  arch/arm64/boot/dts/qcom/msm8916.dtsi         |   85 +-
>  drivers/hwtracing/coresight/Kconfig           |   21 +
>  drivers/hwtracing/coresight/Makefile          |    3 +
>  .../coresight/coresight-cti-platform.c        |  485 +++++++
>  .../hwtracing/coresight/coresight-cti-sysfs.c | 1175 +++++++++++++++++
>  drivers/hwtracing/coresight/coresight-cti.c   |  748 +++++++++++
>  drivers/hwtracing/coresight/coresight-cti.h   |  235 ++++
>  .../hwtracing/coresight/coresight-platform.c  |   21 +
>  drivers/hwtracing/coresight/coresight-priv.h  |   15 +
>  drivers/hwtracing/coresight/coresight.c       |   86 +-
>  include/dt-bindings/arm/coresight-cti-dt.h    |   37 +
>  include/linux/coresight.h                     |   27 +
>  24 files changed, 4050 insertions(+), 31 deletions(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
>  create mode 100644 Documentation/devicetree/bindings/arm/coresight-cti.yaml
>  create mode 100644 Documentation/trace/coresight/coresight-ect.rst
>  create mode 100644 drivers/hwtracing/coresight/coresight-cti-platform.c
>  create mode 100644 drivers/hwtracing/coresight/coresight-cti-sysfs.c
>  create mode 100644 drivers/hwtracing/coresight/coresight-cti.c
>  create mode 100644 drivers/hwtracing/coresight/coresight-cti.h
>  create mode 100644 include/dt-bindings/arm/coresight-cti-dt.h
>
> --
> 2.17.1
>
