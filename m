Return-Path: <SRS0=r3bb=2H=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81141C43603
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Dec 2019 22:27:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 44B982082E
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Dec 2019 22:27:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="hwy8ilVy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725975AbfLQW1x (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 17 Dec 2019 17:27:53 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:46646 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbfLQW1x (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 17 Dec 2019 17:27:53 -0500
Received: by mail-io1-f67.google.com with SMTP id t26so12457575ioi.13
        for <devicetree@vger.kernel.org>; Tue, 17 Dec 2019 14:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4BblP9/i908jShbIZSL+2c+XD+vzjaoby0xZke9Jfhs=;
        b=hwy8ilVyYPf/1zh4cTBm0wx2snAxW5ajpSg1IftlqVKzZdwi6pnglyTnO6Rex+msFQ
         QWXUVUx9Py7HbcUDwcYdmQobMW2HIhdLsX37LYi0Fj8Eulv3/Iw0iYwt2sA8OgK5nHPU
         7Z7GwHO3za6j74lqClGbx0Wzuy9Mrx97NS+38ZuGkgxpJWbfPOCJcoFVvP4Hsu22sLzR
         SsBIHOIaHm+uHhrfGlTP9K+OaW/8umvRaddftnPJW3l/plfuIslK8EjqhEurM19qm1Dt
         8VUUX2sb3uvm1HNBgNjrK4CBO+fnkiycfRXlVarTE/wOHE2ZdOtIgurn5UBxoHIInaUF
         BrXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4BblP9/i908jShbIZSL+2c+XD+vzjaoby0xZke9Jfhs=;
        b=uktKQ3yVPo2rd1Q1fRPnjUYkvccXI8Sp8J/lWk1pMIDKJUDRZsOXWriCN4qtGZv7qf
         FkvQVYl+VAbY5vlyQMo4/DMIyVgFp4rUuH18Ww35iT2n8MPocZNjppDJu+bNQJix0Qji
         +Triy6IK/RfVsxxqq0TaQw5ffk4gLo54PXCubAj3FEv8m5K7UIGmblPKLN9JZwaHcseU
         dTN4ukoKk7kuxkBex7V9KwHcB5QvEJS/9y9V6sUCBjHILXZIK6ONtpEKLl3JGoTsg2TP
         BStjXKuMS7VrEeSRRchsf9OlBz7Q+NGj29rBTo3adBQvTlY/Qud2+4UBCDiBigEmA+u+
         paVg==
X-Gm-Message-State: APjAAAXuKo36EKi3sciqC5opOegvBZKzdQjSy8UJ8UxKFlPDQjBWSd6Y
        yJVf9sVANe4jcxuiG0Jjfxo4FiPYSbZAbErN53cX/A==
X-Google-Smtp-Source: APXvYqy0rRHGL9s7yY7B000MT7WR/INJXqgTqhoIz7ek+RV/ksx376sR7e4z7scCOVZr4j5vlfLhL8lZ9qPfBIdIcwc=
X-Received: by 2002:a02:6957:: with SMTP id e84mr355902jac.11.1576621671073;
 Tue, 17 Dec 2019 14:27:51 -0800 (PST)
MIME-Version: 1.0
References: <20191211230717.4879-1-mike.leach@linaro.org> <CANLsYkzVcTYutoYt5DWiOxyB8m3kCZVPHpTJPPe7YN=OoKtj1g@mail.gmail.com>
 <CAJ9a7VgiVGx4gsrGOUXSzSRixbgMauhtpQJfHd+aYifR43faGA@mail.gmail.com>
In-Reply-To: <CAJ9a7VgiVGx4gsrGOUXSzSRixbgMauhtpQJfHd+aYifR43faGA@mail.gmail.com>
From:   Olof Johansson <olof@lixom.net>
Date:   Tue, 17 Dec 2019 14:27:39 -0800
Message-ID: <CAOesGMhkH++W5DG5rYdo+t2-kM69cKSqeMvHO0G6knU6SLbyeg@mail.gmail.com>
Subject: Re: [PATCH v6 00/15] CoreSight CTI Driver
To:     Mike Leach <mike.leach@linaro.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Coresight ML <coresight@lists.linaro.org>,
        DTML <devicetree@vger.kernel.org>,
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

On Tue, Dec 17, 2019 at 3:51 AM Mike Leach <mike.leach@linaro.org> wrote:
>
> Hi Mathieu,
>
> On Mon, 16 Dec 2019 at 21:22, Mathieu Poirier
> <mathieu.poirier@linaro.org> wrote:
> >
> > On Wed, 11 Dec 2019 at 16:07, Mike Leach <mike.leach@linaro.org> wrote:
> > >
> > > CTIs are defined in the device tree and associated with other CoreSight
> > > devices. The core CoreSight code has been modified to enable the registration
> > > of the CTI devices on the same bus as the other CoreSight components,
> > > but as these are not actually trace generation / capture devices, they
> > > are not part of the Coresight path when generating trace.
> > >
> > > However, the definition of the standard CoreSight device has been extended
> > > to include a reference to an associated CTI device, and the enable / disable
> > > trace path operations will auto enable/disable any associated CTI devices at
> > > the same time.
> > >
> > > Programming is at present via sysfs - a full API is provided to utilise the
> > > hardware capabilities. As CTI devices are unprogrammed by default, the auto
> > > enable describe above will have no effect until explicit programming takes
> > > place.
> > >
> > > A set of device tree bindings specific to the CTI topology has been defined.
> > > The driver accesses these in a platform agnostic manner, so ACPI bindings
> > > can be added later, once they have been agreed and defined for the CTI device.
> > >
> > > Documentation has been updated to describe both the CTI hardware, its use and
> > > programming in sysfs, and the new dts bindings required.
> > >
> > > Tested on DB410 board and Juno board, against the Linux 5.5-rc1 tree.
> > >
> > > Changes since v5:
> > > 1) Fixed up device tree .yaml file. Using extra compatible string for
> > > v8 architecture CTI connections.
> > > 2) Ensure association code respects coresight mutex when setting cross
> > > referenced pointers. Add in shutdown code.
> > > 3) Multiple minor code fixes & rationalisation.
> > >
> > > Changes since v4:
> > > Multiple changes following feedback from Mathieu, Leo and Suzuki.
> > > 1) Dropped RFC tag - wider distribution
> > > 2) CTI bindings definition now presented as a .yaml file - tested with
> > > with 'dt-doc-validate' from devicetree.org/dt-schema project and in kernel
> > > build tree with 'make dtbs_check' per kernel docs.
> > > 3) Sysfs links to other CoreSight devices moved out of this set into
> > > a following set that deals with all CoreSight devices & sysfs links.
> > > 4) Documentation in .rst format and new directory following patchset in [1].
> > > Extended example provided in docs.
> > > 5) Rationalised devicetree of_ specifics to use generic fwnode functions
> > > where possible to enable easier addition of ACPI support later.
> > > 6) Other minor changes as requested in feedback from last patchset.
> > >
> > > Changes since v3:
> > > 1) After discussion on CS mailing list, each CTI connection has a triggers<N>
> > >    sysfs directory with name and trigger signals listed for the connection.
> > > 2) Initial code for creating sysfs links between CoreSight components is
> > >   introduced and implementation for CTI provided. This allows exploration
> > >   of the CoreSight topology within the sysfs infrastructure. Patches for
> > >   links between other CoreSight components to follow.
> > > 3) Power management - CPU hotplug and idle omitted from this set as ongoing
> > >    developments may define required direction. Additional patch set to follow.
> > > 4) Multiple fixes applied as requested by reviewers esp. Matthieu, Suzuki
> > >    and Leo.
> > >
> > > Changes since v2:
> > > Updates to allow for new features on coresight/next and feedback from
> > > Mathieu and Leo.
> > >
> > > 1) Rebase and restructuring to apply on top of ACPI support patch set,
> > > currently on coresight/next. of_coresight_cti has been renamed to
> > > coresight-cti-platform and device tree bindings added to this but accessed
> > > in a platform agnostic manner using fwnode for later ACPI support
> > > to be added.
> > > 2) Split the sysfs patch info a series of functional patches.
> > > 3) Revised the refcount and enabling support.
> > > 4) Adopted the generic naming protocol - CTIs are either cti_cpuN or
> > > cti_sysM
> > > 5) Various minor presentation /checkpatch issues highlighted in feedback.
> > > 6) revised CPU hotplug to cover missing cases needed by ETM.
> > >
> > > Changes since v1:
> > > 1) Significant restructuring of the source code. Adds cti-sysfs file and
> > > cti device tree file. Patches add per feature rather than per source
> > > file.
> > > 2) CPU type power event handling for hotplug moved to CoreSight core,
> > > with generic registration interface provided for all CPU bound CS devices
> > > to use.
> > > 3) CTI signal interconnection details in sysfs now generated dynamically
> > > from connection lists in driver. This to fix issue with multi-line sysfs
> > > output in previous version.
> > > 4) Full device tree bindings for DB410 and Juno provided (to the extent
> > > that CTI information is available).
> > > 5) AMBA driver update for UCI IDs are now upstream so no longer included
> > > in this set.
> > >
> > > Mike Leach (15):
> > >   coresight: cti: Initial CoreSight CTI Driver
> > >   coresight: cti: Add sysfs coresight mgmt reg access.
> > >   coresight: cti: Add sysfs access to program function regs
> > >   coresight: cti: Add sysfs trigger / channel programming API
> > >   dt-bindings: arm: Adds CoreSight CTI hardware definitions.
> > >   coresight: cti: Add device tree support for v8 arch CTI
> > >   coresight: cti: Add device tree support for custom CTI.
> > >   coresight: cti: Enable CTI associated with devices.
> > >   coresight: cti: Add connection information to sysfs
> > >   dt-bindings: qcom: Add CTI options for qcom msm8916
> > >   dt-bindings: arm: Juno platform - add CTI entries to device tree.
> > >   dt-bindings: hisilicon: Add CTI bindings for hi-6220
> > >   docs: coresight: Update documentation for CoreSight to cover CTI.
> > >   docs: sysfs: coresight: Add sysfs ABI documentation for CTI
> > >   Update MAINTAINERS to add reviewer for CoreSight.
> > >
> >
> > All that needs to be sorted out in this set are the comments made by
> > Maxime.  When you do address those please only resend that patch.
> > Since Maxime's comments are related to yaml syntax rather than the
> > bindings themselves, I have added your set to my next tree so that it
> > can soak in linux-next over the next few weeks.
> >
>
> As a result of the changes requested by Maxime - there are necessary
> changes to the .dts for the juno bindings as well as the .yaml file -
> juno bindings need to respect the requirement for reg = <> entries in
> the trig-conns@ child nodes.
>
> These changes are still limited to devicetree so I will post just
> these two patches next time.

Note that new driver features should not require updated DTS contents.
You might not get the new feature enabled, but continued function as
before needs to be maintained.


-Olof
