Return-Path: <SRS0=XuEv=ZT=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F61CC43215
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 Nov 2019 19:08:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1F698204FD
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 Nov 2019 19:08:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cBhYSQtq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726603AbfK0TIv (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 27 Nov 2019 14:08:51 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:33502 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726716AbfK0TIv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 27 Nov 2019 14:08:51 -0500
Received: by mail-pj1-f67.google.com with SMTP id r67so2694108pjb.0
        for <devicetree@vger.kernel.org>; Wed, 27 Nov 2019 11:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=96H218eeF6JZfYrMNDF+h5hMtKA/hT5z66cJp43pWyI=;
        b=cBhYSQtqqblpGZTuLvw9Zy2AtHGTNb11Cv0PS7hYetaBbkMe7ErGWIdFm0vlEnXdel
         TcvGeq/1mQIv1xmfFebhSgBtqWrl6++3mEZlE6JislZn0hs31oLgE6qGTGaso9bLxwV+
         IZ7ATIt32IYOmsObFvuCMRZ/ssF80gtkdicmECoVcnU+rtYwLHOFJKwrdAlZB7Hog9QF
         +yetSrMXtQG0ew2J2aQdW3zNRSh6ZV/JgzaCRL91dAlJ/O03WzBLJ3aAW4WFBthNEet8
         cnfoFp/f6wwGgqLQZENpR+M/DJ1fpfi//9tMCyuhZT2MjS8oiGOvxkb0b+ND7GVmGWmi
         zJpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=96H218eeF6JZfYrMNDF+h5hMtKA/hT5z66cJp43pWyI=;
        b=Ks9WC+Uy4mRTefb/59WvhNILrDry2H808pw6jmPpZnr1UCb5zFBkutK//HsT1X+Tju
         iNaWrnGsQ+boC2fXTidzOgkxkkEojXJibuUPLIsli/dAedau+9aOlVr4naAPVCQxBb3l
         giI3Rs4p/g7TI5t5NZQMm/uw8t3FJ5EuSwS89yQfZE9AwM0ghZ/NrHbVDY7atLf+6lo+
         3z30WQiMyMreO4IWklSn9jtNUjyVsiqsdAzZN5hmxAeyVwMG6HwLxuKJ8AQz3AQYBt+b
         LKPKm3gmIxE//RjwpjIE+fAuEVoN0NVG/hRqMuviiDOfe6NooSSkyDwRuxLRGSzytfTd
         HZ8Q==
X-Gm-Message-State: APjAAAV86csTjuJVIiGbA9VQ4xE2RFsAB8bVS5ysEPK6fqKP3zntMSsd
        wMrhXLWtawu1n577OxnDJ+01DQ==
X-Google-Smtp-Source: APXvYqx+Un/0YdMBxWG9C8VV0SxFi2jCnPHkzXbhC8ezEmt5lN/1Liha59YFuItEO5sEs4Vpn4hO9g==
X-Received: by 2002:a17:902:b68c:: with SMTP id c12mr5680161pls.126.1574881730173;
        Wed, 27 Nov 2019 11:08:50 -0800 (PST)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id j18sm957568pfn.112.2019.11.27.11.08.49
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Nov 2019 11:08:49 -0800 (PST)
Date:   Wed, 27 Nov 2019 12:08:47 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Mike Leach <mike.leach@linaro.org>
Cc:     coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        suzuki.poulose@arm.com
Subject: Re: [PATCH v5 14/14] docs: sysfs: coresight: Add sysfs ABI
 documentation for CTI
Message-ID: <20191127190847.GE26544@xps15>
References: <20191119231912.12768-1-mike.leach@linaro.org>
 <20191119231912.12768-15-mike.leach@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191119231912.12768-15-mike.leach@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Nov 19, 2019 at 11:19:12PM +0000, Mike Leach wrote:
> Add API usage document for sysfs API in CTI driver.
> 
> Signed-off-by: Mike Leach <mike.leach@linaro.org>
> ---
>  .../testing/sysfs-bus-coresight-devices-cti   | 221 ++++++++++++++++++
>  1 file changed, 221 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti b/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
> new file mode 100644
> index 000000000000..d867800f567f
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
> @@ -0,0 +1,221 @@
> +What:		/sys/bus/coresight/devices/<cti-name>/enable
> +Date:		Jul 2019
> +KernelVersion	5.4
> +Contact:	Mike Leach or Mathieu Poirier
> +Description:	(RW) Enable/Disable the CTI hardware.

This will (likely) go in kernel 5.6 that should be released in January 2020.

In your next revision please add yourself as an official reviewer to the
coresight subsystem.  This should be done at the end of the set, in a patch on
its own.

Thanks,
Mathieu

> +
> +What:		/sys/bus/coresight/devices/<cti-name>/ctmid
> +Date:		Jul 2019
> +KernelVersion	5.4
> +Contact:	Mike Leach or Mathieu Poirier
> +Description:	(R) Display the associated CTM ID
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/nr_trigger_cons
> +Date:		Jul 2019
> +KernelVersion	5.4
> +Contact:	Mike Leach or Mathieu Poirier
> +Description:	(R) Number of devices connected to triggers on this CTI
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/triggers<N>/name
> +Date:		Jul 2019
> +KernelVersion	5.4
> +Contact:	Mike Leach or Mathieu Poirier
> +Description:	(R) Name of connected device <N>
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/triggers<N>/in_signals
> +Date:		Jul 2019
> +KernelVersion	5.4
> +Contact:	Mike Leach or Mathieu Poirier
> +Description:	(R) Input trigger signals from connected device <N>
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/triggers<N>/in_types
> +Date:		Jul 2019
> +KernelVersion	5.4
> +Contact:	Mike Leach or Mathieu Poirier
> +Description:	(R) Functional types for the input trigger signals
> +		from connected device <N>
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/triggers<N>/out_signals
> +Date:		Jul 2019
> +KernelVersion	5.4
> +Contact:	Mike Leach or Mathieu Poirier
> +Description:	(R) Output trigger signals to connected device <N>
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/triggers<N>/out_types
> +Date:		Jul 2019
> +KernelVersion	5.4
> +Contact:	Mike Leach or Mathieu Poirier
> +Description:	(R) Functional types for the output trigger signals
> +		to connected device <N>
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/regs/inout_sel
> +Date:		Jul 2019
> +KernelVersion	5.4
> +Contact:	Mike Leach or Mathieu Poirier
> +Description:	(RW) Select the index for inen and outen registers.
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/regs/inen
> +Date:		Jul 2019
> +KernelVersion	5.4
> +Contact:	Mike Leach or Mathieu Poirier
> +Description:	(RW) Read or write the CTIINEN register selected by inout_sel.
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/regs/outen
> +Date:		Jul 2019
> +KernelVersion	5.4
> +Contact:	Mike Leach or Mathieu Poirier
> +Description:	(RW) Read or write the CTIOUTEN register selected by inout_sel.
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/regs/gate
> +Date:		Jul 2019
> +KernelVersion	5.4
> +Contact:	Mike Leach or Mathieu Poirier
> +Description:	(RW) Read or write CTIGATE register.
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/regs/asicctl
> +Date:		Jul 2019
> +KernelVersion	5.4
> +Contact:	Mike Leach or Mathieu Poirier
> +Description:	(RW) Read or write ASICCTL register.
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/regs/intack
> +Date:		Jul 2019
> +KernelVersion	5.4
> +Contact:	Mike Leach or Mathieu Poirier
> +Description:	(W) Write the INTACK register.
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/regs/appset
> +Date:		Jul 2019
> +KernelVersion	5.4
> +Contact:	Mike Leach or Mathieu Poirier
> +Description:	(RW) Set CTIAPPSET register to activate channel. Read back to
> +		determine current value of register.
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/regs/appclear
> +Date:		Jul 2019
> +KernelVersion	5.4
> +Contact:	Mike Leach or Mathieu Poirier
> +Description:	(W) Write APPCLEAR register to deactivate channel.
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/regs/apppulse
> +Date:		Jul 2019
> +KernelVersion	5.4
> +Contact:	Mike Leach or Mathieu Poirier
> +Description:	(W) Write APPPULSE to pulse a channel active for one clock
> +		cycle.
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/regs/chinstatus
> +Date:		Jul 2019
> +KernelVersion	5.4
> +Contact:	Mike Leach or Mathieu Poirier
> +Description:	(R) Read current status of channel inputs.
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/regs/choutstatus
> +Date:		Jul 2019
> +KernelVersion	5.4
> +Contact:	Mike Leach or Mathieu Poirier
> +Description:	(R) read current status of channel outputs.
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/regs/triginstatus
> +Date:		Jul 2019
> +KernelVersion	5.4
> +Contact:	Mike Leach or Mathieu Poirier
> +Description:	(R) read current status of input trigger signals
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/regs/trigoutstatus
> +Date:		Jul 2019
> +KernelVersion	5.4
> +Contact:	Mike Leach or Mathieu Poirier
> +Description:	(R) read current status of output trigger signals.
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/channels/trigin_attach
> +Date:		Jul 2019
> +KernelVersion	5.4
> +Contact:	Mike Leach or Mathieu Poirier
> +Description:	(W) Attach a CTI input trigger to a CTM channel.
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/channels/trigin_detach
> +Date:		Jul 2019
> +KernelVersion	5.4
> +Contact:	Mike Leach or Mathieu Poirier
> +Description:	(W) Detach a CTI input trigger from a CTM channel.
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/channels/trigout_attach
> +Date:		Jul 2019
> +KernelVersion	5.4
> +Contact:	Mike Leach or Mathieu Poirier
> +Description:	(W) Attach a CTI output trigger to a CTM channel.
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/channels/trigout_detach
> +Date:		Jul 2019
> +KernelVersion	5.4
> +Contact:	Mike Leach or Mathieu Poirier
> +Description:	(W) Detach a CTI output trigger from a CTM channel.
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/channels/chan_gate_enable
> +Date:		Jul 2019
> +KernelVersion	5.4
> +Contact:	Mike Leach or Mathieu Poirier
> +Description:	(RW) Enable CTIGATE for single channel (W) or list enabled
> +		channels through the gate (R).
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/channels/chan_gate_disable
> +Date:		Jul 2019
> +KernelVersion	5.4
> +Contact:	Mike Leach or Mathieu Poirier
> +Description:	(W) Disable CTIGATE for single channel.
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/channels/chan_set
> +Date:		Jul 2019
> +KernelVersion	5.4
> +Contact:	Mike Leach or Mathieu Poirier
> +Description:	(W) Activate a single channel.
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/channels/chan_clear
> +Date:		Jul 2019
> +KernelVersion	5.4
> +Contact:	Mike Leach or Mathieu Poirier
> +Description:	(W) Deactivate a single channel.
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/channels/chan_pulse
> +Date:		Jul 2019
> +KernelVersion	5.4
> +Contact:	Mike Leach or Mathieu Poirier
> +Description:	(W) Pulse a single channel - activate for a single clock cycle.
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/channels/trigout_filtered
> +Date:		Jul 2019
> +KernelVersion	5.4
> +Contact:	Mike Leach or Mathieu Poirier
> +Description:	(R) List of output triggers filtered across all connections.
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/channels/trig_filter_enable
> +Date:		Jul 2019
> +KernelVersion	5.4
> +Contact:	Mike Leach or Mathieu Poirier
> +Description:	(RW) Enable or disable trigger output signal filtering.
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/channels/chan_inuse
> +Date:		Jul 2019
> +KernelVersion	5.4
> +Contact:	Mike Leach or Mathieu Poirier
> +Description:	(R) show channels with at least one attached trigger signal.
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/channels/chan_free
> +Date:		Jul 2019
> +KernelVersion	5.4
> +Contact:	Mike Leach or Mathieu Poirier
> +Description:	(R) show channels with no attached trigger signals.
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/channels/chan_xtrigs_view
> +Date:		Jul 2019
> +KernelVersion	5.4
> +Contact:	Mike Leach or Mathieu Poirier
> +Description:	(RW) Write channel number to select a channel to view, read to
> +		see triggers attached to selected channel on this CTI.
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/channels/chan_xtrigs_reset
> +Date:		Jul 2019
> +KernelVersion	5.4
> +Contact:	Mike Leach or Mathieu Poirier
> +Description:	(W) Clear all channel / trigger programming.
> -- 
> 2.17.1
> 
