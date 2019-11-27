Return-Path: <SRS0=XuEv=ZT=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7145EC432C0
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 Nov 2019 19:00:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 278BE20715
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 Nov 2019 19:00:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PtILFn7X"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727071AbfK0TA0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 27 Nov 2019 14:00:26 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:35330 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727051AbfK0TA0 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 27 Nov 2019 14:00:26 -0500
Received: by mail-pl1-f194.google.com with SMTP id s10so10203198plp.2
        for <devicetree@vger.kernel.org>; Wed, 27 Nov 2019 11:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=W24vfSybe0Yt1bcIivsgitTM/1jmUBBFwk4xD6OiIw4=;
        b=PtILFn7XbOC8m7Px3/baePGxct5k3lUe8lzuGMcHoNCOzBCFFMpjz9xIP+00+2/T42
         hrHcwvI5ERyz+/Of+9GrEGkGi3ioDfEKeghdi28gk7WpLrFyo28tjb2idxPSFDbuv02t
         O7HCJzFDLQS9f7Upt/Nv0rCq75PfaOk10oGkf6tzTSOFB6gskDzemIqon6GW0J1PJYXM
         6PKqZqfdMCJxnb+Utr1atkPpVJUyYzSiHBt5dYWOYCzHgBKJftJJbLADME2Hqv7wmYV/
         gX+BzeF1bI67m3paaUc2Qu8lx/8s49j4gtEpoA2vmW4dVTarFDZ0d1her10CWPdN9i2V
         dHiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=W24vfSybe0Yt1bcIivsgitTM/1jmUBBFwk4xD6OiIw4=;
        b=ntmNudaCIP4buEmXVSECO5choqJZKVXrIMgO52uXA3QpQBc1bjM+rIkyWOauJPbHXf
         zBtZcz5g8bGF0ftMari6efuqIq2Rjk5kV1HLkrQ+vBZb06W+z8TbyKvcXuTzFCysR+i9
         Yjc9jfxNzlMM8Rv65cbwKbDELwycLKZmIrRY07OnfyG2v7ZrOmZhNBzxqnJRgrg+tq2+
         Wx42E8xEB3yZHZaBi/pN+rdwNcksBt+5rsN2lbzj586M/9ETtf5U+6DBjvJT3ROlnOD4
         C9X6C3g3200UW7jYj7rxKhLLQ0FzQGEXCO/z6qzXR+AFtgHrD3446MOCfs+MVkQ4Rpnc
         p9sg==
X-Gm-Message-State: APjAAAUGlnneMufrpOHlhAH19WA20rCnoBsIGD5AWNlYdXfWvwyRGd24
        n6IHbv9A0mPdKYzEIQsW4R4YQQ==
X-Google-Smtp-Source: APXvYqzVEOuwcwOUCX+fOeLYVy8O/wagYCbPlNJdNeF27gDkCpAhMi/62bYAsuw9jOh7DSmYFAHepg==
X-Received: by 2002:a17:90a:2223:: with SMTP id c32mr8220031pje.15.1574881225371;
        Wed, 27 Nov 2019 11:00:25 -0800 (PST)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id k13sm17434061pgl.69.2019.11.27.11.00.23
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Nov 2019 11:00:24 -0800 (PST)
Date:   Wed, 27 Nov 2019 12:00:22 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Mike Leach <mike.leach@linaro.org>
Cc:     coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        suzuki.poulose@arm.com
Subject: Re: [PATCH v5 13/14] docs: coresight: Update documentation for
 CoreSight to cover CTI.
Message-ID: <20191127190022.GD26544@xps15>
References: <20191119231912.12768-1-mike.leach@linaro.org>
 <20191119231912.12768-14-mike.leach@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191119231912.12768-14-mike.leach@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Nov 19, 2019 at 11:19:11PM +0000, Mike Leach wrote:
> Add new document covering CTI / CTM usage in CoreSight.
> 
> Add section in coresight.rst introducing CTI and CTM modules with link
> to new document.
> 
> Signed-off-by: Mike Leach <mike.leach@linaro.org>
> ---
>  .../trace/coresight/coresight-ect.rst         | 200 ++++++++++++++++++
>  Documentation/trace/coresight/coresight.rst   |  13 ++
>  2 files changed, 213 insertions(+)
>  create mode 100644 Documentation/trace/coresight/coresight-ect.rst
> 
> diff --git a/Documentation/trace/coresight/coresight-ect.rst b/Documentation/trace/coresight/coresight-ect.rst
> new file mode 100644
> index 000000000000..6448cf910f20
> --- /dev/null
> +++ b/Documentation/trace/coresight/coresight-ect.rst
> @@ -0,0 +1,200 @@
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
> +activiating connected output triggers there, unless filtered by the CTI

s/activiating/activating

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
> +the multiple register operations that are required if manipluating the

s/manipluating/manipulating

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
> +   * ``chan_set``: Set the channel - the set state will be propogated around

s/propogated/propagated

This patch will be handled by Jonathan Corbet and as such he needs to be CC'ed
in your next submission. 

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
> +   .../cti_sys0/channels# cat ../regs/trigoutstatus
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
> -- 
> 2.17.1
> 
