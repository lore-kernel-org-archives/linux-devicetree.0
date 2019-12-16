Return-Path: <SRS0=KHEV=2G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1F0BC2D0C3
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Dec 2019 21:11:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9889221835
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Dec 2019 21:11:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p0lL2isV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726692AbfLPVLa (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 16 Dec 2019 16:11:30 -0500
Received: from mail-il1-f196.google.com ([209.85.166.196]:34839 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726633AbfLPVL3 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 16 Dec 2019 16:11:29 -0500
Received: by mail-il1-f196.google.com with SMTP id g12so6609213ild.2
        for <devicetree@vger.kernel.org>; Mon, 16 Dec 2019 13:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fkYJ5pa9nbKOKyFcP8C8UHZBwLa5GTQfg7UnOmnBomE=;
        b=p0lL2isV5hhyipvhkSqpkezqiNxO/gomyfNXgVp1sNiokvE7WHAgy5YsnlImH0Rcbp
         FZlC8YcC64xQb73aWSxz20NfuGmGUn5JWUrrcpX6iKK6iYlxmH9L8Er8YZQVt2CR6XZY
         CUDjfqHU9fSm7uD+buILT2h3MCCk+3b7gh5Xl4UsUEGhhoHxDK1b070+sxL3GEkCzEQD
         1ka6D1oeH/jAsr+lvK/ENdP2aQqzNUP1t5t0vBxnC37Qz41qx2mLaAZKhqE/HodKMfUL
         nKKEBe8aTv7w5xUTv3r6Fi3ARFBjvmdU+ULTqhd8l5rSPGfacfny7kNCbG5NGNNMOHKT
         F6hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fkYJ5pa9nbKOKyFcP8C8UHZBwLa5GTQfg7UnOmnBomE=;
        b=O+ZAbkAqhsgw0KzaMRCkmNXYG8vTII88b22yxWdTv//27VlHxv5FLAvg78GDN7se3e
         ZAK2q9wueDBua+X89Wcu0syvry+VxXwjbxFM+jjFVC+aws4wWrT9A/aHFxQv9JMpgVVK
         vza2IW5fgx3zvbZwLL+dO41R8Py8XiHnpSfk0XjYAeWC3hz1KK65aowRrGrpwFvXqavM
         TzOiL7H7hphTZAy+U/91Wk0RAgpvSiEH69LM9+YoWKcqlcBkbvteYW25r67a2Pu6NGUc
         A2phoR8cL4yIYadllvBmrrLtJuDtUuyoybPKrX73UCf9ksb9cyN5fx0OYesAkbuQpeaT
         tCzg==
X-Gm-Message-State: APjAAAVSYZvEGSwrRQ97rEbcfQYXXrG/oWkHPV4wt9uvKh+t6BJfTDU2
        OQTesqYdyr9XAE+Q8F6B20Smuhk01qyy8Nqhff505g==
X-Google-Smtp-Source: APXvYqxVHsdIC8VlRYTzYqeb69NqWhrUbzqstR4rImviApaGK7bQAGkdHjoiFC5rrFcG91bXmTXETB1cct+Y6qGPmJU=
X-Received: by 2002:a92:5f86:: with SMTP id i6mr13599326ill.57.1576530688363;
 Mon, 16 Dec 2019 13:11:28 -0800 (PST)
MIME-Version: 1.0
References: <20191211230959.5577-1-mike.leach@linaro.org>
In-Reply-To: <20191211230959.5577-1-mike.leach@linaro.org>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Mon, 16 Dec 2019 14:11:17 -0700
Message-ID: <CANLsYkx_bG4GLcP5qhdDgHNmGa0C6Wi0HaLcdzCJj1yHE0iNXQ@mail.gmail.com>
Subject: Re: [PATCH v6 13/15] docs: coresight: Update documentation for
 CoreSight to cover CTI.
To:     Mike Leach <mike.leach@linaro.org>, Jon Corbet <corbet@lwn.net>
Cc:     linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Coresight ML <coresight@lists.linaro.org>,
        devicetree@vger.kernel.org,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        "Suzuki K. Poulose" <suzuki.poulose@arm.com>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 11 Dec 2019 at 16:10, Mike Leach <mike.leach@linaro.org> wrote:
>
> Add new document covering CTI / CTM usage in CoreSight.
>
> Add section in coresight.rst introducing CTI and CTM modules with link
> to new document.
>
> Signed-off-by: Mike Leach <mike.leach@linaro.org>
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>  .../trace/coresight/coresight-ect.rst         | 211 ++++++++++++++++++
>  Documentation/trace/coresight/coresight.rst   |  13 ++
>  2 files changed, 224 insertions(+)
>  create mode 100644 Documentation/trace/coresight/coresight-ect.rst
>
> diff --git a/Documentation/trace/coresight/coresight-ect.rst b/Documentation/trace/coresight/coresight-ect.rst
> new file mode 100644
> index 000000000000..3e06588f24fa
> --- /dev/null
> +++ b/Documentation/trace/coresight/coresight-ect.rst
> @@ -0,0 +1,211 @@
> +=============================================
> +CoreSight Embedded Cross Trigger (CTI & CTM).
> +=============================================
> +
> +    :Author:   Mike Leach <mike.leach@linaro.org>
> +    :Date:     November 2019
> +
> +Hardware Description
> +--------------------
> +
> +The CoreSight Cross Trigger Interface (CTI) is a hardware device that takes
> +individual input and output hardware signals known as triggers to and from
> +devices and interconnects them via the Cross Trigger Matrix (CTM) to other
> +devices via numbered channels, in order to propagate events between devices.
> +
> +e.g.::
> +
> + 0000000  in_trigs  :::::::
> + 0 C   0----------->:     :             +======>(other CTI channel IO)
> + 0  P  0<-----------:     :             v
> + 0   U 0  out_trigs :     : Channels  *****      :::::::
> + 0000000            : CTI :<=========>*CTM*<====>: CTI :---+
> + #######  in_trigs  :     : (id 0-3)  *****      :::::::   v
> + # ETM #----------->:     :                         ^   #######
> + #     #<-----------:     :                         +---# ETR #
> + ####### out_trigs  :::::::                             #######
> +
> +The CTI driver enables the programming of the CTI to attach triggers to
> +channels. When an input trigger becomes active, the attached channel will
> +become active. Any output trigger attached to that channel will also
> +become active. The active channel is propagated to other CTIs via the CTM,
> +activating connected output triggers there, unless filtered by the CTI
> +channel gate.
> +
> +It is also possible to activate a channel using system software directly
> +programming registers in the CTI.
> +
> +The CTIs are registered by the system to be associated with CPUs and/or other
> +CoreSight devices on the trace data path. When these devices are enabled the
> +attached CTIs will also be enabled. By default/on power up the CTIs have
> +no programmed trigger/channel attachments, so will not affect the system
> +until explicitly programmed.
> +
> +The hardware trigger connections between CTIs and devices is implementation
> +defined, unless the CPU/ETM combination is a v8 architecture, in which case
> +the connections have an architecturally defined standard layout.
> +
> +The hardware trigger signals can also be connected to non-CoreSight devices
> +(e.g. UART), or be propagated off chip as hardware IO lines.
> +
> +All the CTI devices are associated with a CTM. On many systems there will be a
> +single effective CTM (one CTM, or multiple CTMs all interconnected), but it is
> +possible that systems can have nets of CTIs+CTM that are not interconnected by
> +a CTM to each other. On these systems a CTM index is declared to associate
> +CTI devices that are interconnected via a given CTM.
> +
> +Sysfs files and directories
> +---------------------------
> +
> +The CTI devices appear on the existing CoreSight bus alongside the other
> +CoreSight devices::
> +
> +    >$ ls /sys/bus/coresight/devices
> +     cti_cpu0  cti_cpu2  cti_sys0  etm0  etm2  funnel0  replicator0  tmc_etr0
> +     cti_cpu1  cti_cpu3  cti_sys1  etm1  etm3  funnel1  tmc_etf0     tpiu0
> +
> +The ``cti_cpu<N>`` named CTIs are associated with a CPU, and any ETM used by
> +that core. the ``cti_sys<N>`` CTIs are general system infrastructure CTIs that
> +can be associated with other CoreSight devices, or other system hardware
> +capable of generating or using trigger signals.::
> +
> +  >$ ls /sys/bus/coresight/devices/etm0/cti_cpu0
> +  channels  ctmid  enable  nr_trigger_cons mgmt  power  regs  subsystem
> +  triggers0 triggers1  uevent
> +
> +*Key file items are:-*
> +   * ``enable``: enables/disables the CTI.
> +   * ``ctmid`` : associated CTM - only relevant if system has multiple CTI+CTM
> +     clusters that are not interconnected.
> +   * ``nr_trigger_cons`` : total connections - triggers<N> directories.
> +
> +*Sub-directories:-*
> +   * ``triggers<N>``: contains list of triggers for an individual connection.
> +   * ``channels``: Contains the channel API - CTI main programming interface.
> +   * ``regs``: Gives access to the raw programmable CTI regs.
> +   * ``mgmt``: the standard CoreSight management registers.
> +
> +
> +triggers<N> directories
> +~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Individual trigger connection information. This describes trigger signals for
> +CoreSight and non-CoreSight connections.
> +
> +Each triggers directory has a set of parameters describing the triggers for
> +the connection.
> +
> +   * ``name`` : name of connection
> +   * ``in_signals`` : input trigger signal indexes used in this connection.
> +   * ``in_types`` : functional types for in signals.
> +   * ``out_signals`` : output trigger signals for this connection.
> +   * ``out_types`` : functional types for out signals.
> +
> +e.g::
> +
> +    >$ ls ./cti_cpu0/triggers0/
> +    in_signals  in_types  name  out_signals  out_types
> +    >$ cat ./cti_cpu0/triggers0/name
> +    cpu0
> +    >$ cat ./cti_cpu0/triggers0/out_signals
> +    0-2
> +    >$ cat ./cti_cpu0/triggers0/out_types
> +    pe_edbgreq pe_dbgrestart pe_ctiirq
> +    >$ cat ./cti_cpu0/triggers0/in_signals
> +    0-1
> +    >$ cat ./cti_cpu0/triggers0/in_types
> +    pe_dbgtrigger pe_pmuirq
> +
> +If a connection has zero signals in either the 'in' or 'out' triggers then
> +those parameters will be omitted.
> +
> +Channels API Directory
> +~~~~~~~~~~~~~~~~~~~~~~
> +
> +This provides an easy way to attach triggers to channels, without needing
> +the multiple register operations that are required if manipulating the
> +'regs' sub-dir elements directly.
> +
> +A number of files provide this API::
> +
> +   >$ ls ./cti_sys0/channels/
> +   chan_clear         chan_inuse         chan_xtrigs_view      trigin_detach
> +   chan_free          chan_pulse         chan_xtrigs_view_sel  trigout_attach
> +   chan_gate_disable  chan_set           trig_filter_enable    trigout_detach
> +   chan_gate_enable   chan_xtrigs_reset  trigin_attach         trigout_filtered
> +
> +Most access to these elements take the form::
> +
> +  echo <chan> [<trigger>] > /<device_path>/<operation>
> +
> +where the optional <trigger> is only needed for trigXX_attach | detach
> +operations.
> +
> +e.g.::
> +
> +   >$ echo 0 1 > ./cti_sys0/channels/trigout_attach
> +   >$ echo 0 > ./cti_sys0/channels/chan_set
> +
> +Attaches trigout(1) to channel(0), then activates channel(0) generating a
> +set state on cti_sys0.trigout(1)
> +
> +
> +*API operations*
> +
> +   * ``trigin_attach, trigout_attach``: Attach a channel to a trigger signal.
> +   * ``trigin_detach, trigout_detach``: Detach a channel from a trigger signal.
> +   * ``chan_set``: Set the channel - the set state will be propagated around
> +     the CTM to other connected devices.
> +   * ``chan_clear``: Clear the channel.
> +   * ``chan_pulse``: Set the channel for a single CoreSight clock cycle.
> +   * ``chan_gate_enable``: Write operation sets the CTI gate to propagate
> +     (enable) the channel to other devices. This operation takes a channel
> +     number. CTI gate is enabled for all channels by default at power up. Read
> +     to list the currently enabled channels on the gate.
> +   * ``chan_gate_disable``: Write channel number to disable gate for that
> +     channel.
> +   * ``chan_inuse``: Show the current channels attached to any signal
> +   * ``chan_free``: Show channels with no attached signals.
> +   * ``chan_xtrig_view``: write a channel number to select a channel to view,
> +     read to show the cross triggers programmed for the selected channel.
> +   * ``trig_filter_enable``: Defaults to enabled, disable to allow potentially
> +     dangerous output signals to be set.
> +   * ``trigout_filtered``: Trigger out signals that are prevented from being
> +     set if filtering ``trig_filter_enable`` is enabled. One use is to prevent
> +     accidental ``EDBGREQ`` signals stopping a core.
> +   * ``chan_xtrigs_reset``: Write 1 to clear all channel / trigger programming.
> +     Resets device hardware to default state.
> +
> +
> +The example below attaches input trigger index 1 to channel 2, and output
> +trigger index 6 to the same channel. It then examines the state of the
> +channel / trigger connections using the appropriate sysfs attributes.
> +
> +The settings mean that if either input trigger 1, or channel 2 go active then
> +trigger out 6 will go active. We then enable the CTI, and use the software
> +channel control to activate channel 2. We see the active channel on the
> +``choutstatus`` register and the active signal on the ``trigoutstatus``
> +register. Finally clearing the channel removes this.
> +
> +e.g.::
> +
> +   .../cti_sys0/channels# echo 2 1 > trigin_attach
> +   .../cti_sys0/channels# echo 2 6 > trigout_attach
> +   .../cti_sys0/channels# cat chan_free
> +   0-1,3
> +   .../cti_sys0/channels# cat chan_inuse
> +   2
> +   .../cti_sys0/channels# echo 2 > chan_xtrigs_view
> +   .../cti_sys0/channels# cat chan_xtrigs_view
> +   [2] IN: 1 OUT: 6
> +   .../cti_sys0/# echo 1 > enable
> +   .../cti_sys0/channels# echo 2 > chan_set
> +   .../cti_sys0/channels# cat ../regs/choutstatus
> +   0x4
> +   .../cti_sys0/channels# cat ../regs/trigoutstatus
> +   0x40
> +   .../cti_sys0/channels# echo 2 > chan_clear
> +   .../cti_sys0/channels# cat ../regs/trigoutstatus
> +   0x0
> +   .../cti_sys0/channels# cat ../regs/choutstatus
> +   0x0
> diff --git a/Documentation/trace/coresight/coresight.rst b/Documentation/trace/coresight/coresight.rst
> index a566719f8e7e..108600ee1e12 100644
> --- a/Documentation/trace/coresight/coresight.rst
> +++ b/Documentation/trace/coresight/coresight.rst
> @@ -491,8 +491,21 @@ interface provided for that purpose by the generic STM API::
>
>  Details on how to use the generic STM API can be found here:- :doc:`../stm` [#second]_.
>
> +The CTI & CTM Modules
> +---------------------
> +
> +The CTI (Cross Trigger Interface) provides a set of trigger signals between
> +individual CTIs and components, and can propagate these between all CTIs via
> +channels on the CTM (Cross Trigger Matrix).
> +
> +A separate documentation file is provided to explain the use of these devices.
> +(:doc:`coresight-ect`) [#fourth]_.
> +
> +
>  .. [#first] Documentation/ABI/testing/sysfs-bus-coresight-devices-stm
>
>  .. [#second] Documentation/trace/stm.rst
>
>  .. [#third] https://github.com/Linaro/perf-opencsd
> +
> +.. [#fourth] Documentation/trace/coresight/coresight-ect.rst

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> --
> 2.17.1
>
