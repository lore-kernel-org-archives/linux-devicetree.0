Return-Path: <devicetree-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 71F457D981
	for <lwn-devicetree@archive.lwn.net>; Wed, 11 Mar 2020 16:27:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730019AbgCKQ0a (ORCPT <rfc822;lwn-devicetree@archive.lwn.net>);
        Wed, 11 Mar 2020 12:26:30 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:39883 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730114AbgCKQ0a (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 11 Mar 2020 12:26:30 -0400
Received: by mail-pl1-f193.google.com with SMTP id j20so1332168pll.6
        for <devicetree@vger.kernel.org>; Wed, 11 Mar 2020 09:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=sgEL1n9bMN/O1CVsdBOAUN7B6KuMrGBamPwvlUPomHs=;
        b=N3LP2s05koqIsRBODtJJNqQ30YJXE8DrJbP/lZ+mhj7afZUw6P1NPsitJsx0cT4DKP
         +tN7X4nGfwdAXkSGBD/RuWlFu5sQqTjG6Qelgue+1S1LMbvc13cX5hcIhQmfo+32npLq
         NC6+ucUVyahgjS1qz0zA5oJjebrXCOqdexXdS3l7sLdpYAe/+7lmBYPScRG6/qr1Q0pT
         gAhRLxaYzzSLLBoQH+O9FI55aGssTGOFViVBGn0UGmDVJYNBXhfdQHidqwaJUFjUkTVK
         sZ7/Qa7FulIbLZN73FsLtVuWZ7F4Y6fyh+zcIg1mpfLStHHTsxWZC0NPm0wWu+DcAK2o
         zzRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sgEL1n9bMN/O1CVsdBOAUN7B6KuMrGBamPwvlUPomHs=;
        b=j36+U1vkJYAkafOzpVqNItHcDR08hNI2H1of9g9JoRqoRqfoS77GECswGzdD23tQ7j
         j3BYHKtym7KEtjfD2mCPXmYMlU2q3nS5acU88HaOdT+/68IDCO49/Nb164GSAMLlRY9y
         xZSvt6UlKBc1Uklxam+CYpqZPCDcTdmjCkCk6zO7M5NTvVZOMatU3/TtyvkhD3edqScP
         jG18sjYRJX3pa4vbnLMaZV9wJ52NqLEJDGZwDNTw7p6nhxaCJBGyVndvPlfpQiNTrUbF
         pMdqn+oKG4GLrgA7BQHjsHzR7pY0RF3+wr7TH5yPvo85jECL7hP5axC3iHTe+nFLNw8g
         7wgA==
X-Gm-Message-State: ANhLgQ3LjdIlJ8/x4nAAGpulukjJC/LMruQgw/NOUm263/6Lq+K9lUcj
        JXLwfWZa/+mxiK7mnFmdx0GVCw==
X-Google-Smtp-Source: ADFU+vtYHkA1RwRTnEx/D17mP3PWcu1tYDU6Vt1EnLy/Moje/acIYiygvM0mMQ8rn5GlHvWSoajW8w==
X-Received: by 2002:a17:90a:f0c1:: with SMTP id fa1mr4170355pjb.180.1583943987427;
        Wed, 11 Mar 2020 09:26:27 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id u24sm50163508pgo.83.2020.03.11.09.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 09:26:26 -0700 (PDT)
Date:   Wed, 11 Mar 2020 10:26:24 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Ben Levinsky <ben.levinsky@xilinx.com>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        michal.simek@xilinx.com, jollys@xilinx.com, rajan.vaja@xilinx.com,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] firmware: xilinx: Add zynqmp_get_node_status API
Message-ID: <20200311162624.GA32395@xps15>
References: <1582566751-13118-1-git-send-email-ben.levinsky@xilinx.com>
 <1582566751-13118-4-git-send-email-ben.levinsky@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1582566751-13118-4-git-send-email-ben.levinsky@xilinx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
Archived-At: <http://archive.lwn.net:8080/devicetree/20200311162624.GA32395@xps15/>
List-Archive: <http://archive.lwn.net:8080/devicetree/>
List-Post: <mailto:devicetree@vger.kernel.org>

Hi Ben,

On Mon, Feb 24, 2020 at 09:52:29AM -0800, Ben Levinsky wrote:
> This patch adds a new API to provide access to the
> current power state of a sub-system on Zynqmp sub-system.
> 
> Signed-off-by: Ben Levinsky <ben.levinsky@xilinx.com>

Patches 1 to 3 look good to me but they will need an R-b from Michal Simek
before it is possible to move foward with them.

Thanks,
Mathieu

> ---
>  drivers/firmware/xilinx/zynqmp.c     | 42 ++++++++++++++++++++++++++++++++++++
>  include/linux/firmware/xlnx-zynqmp.h |  3 +++
>  2 files changed, 45 insertions(+)
> 
> diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
> index 486dcb1..98e35d4 100644
> --- a/drivers/firmware/xilinx/zynqmp.c
> +++ b/drivers/firmware/xilinx/zynqmp.c
> @@ -725,6 +725,47 @@ static int zynqmp_pm_request_wakeup(const u32 node,
>  }
>  
>  /**
> + * zynqmp_pm_get_node_status - PM call to request a node's current power state
> + * @node:		ID of the component or sub-system in question
> + * @status:		Current operating state of the requested node
> + * @requirements:	Current requirements asserted on the node,
> + *			used for slave nodes only.
> + * @usage:		Usage information, used for slave nodes only:
> + *			PM_USAGE_NO_MASTER	- No master is currently using
> + *						  the node
> + *			PM_USAGE_CURRENT_MASTER	- Only requesting master is
> + *						  currently using the node
> + *			PM_USAGE_OTHER_MASTER	- Only other masters are
> + *						  currently using the node
> + *			PM_USAGE_BOTH_MASTERS	- Both the current and at least
> + *						  one other master is currently
> + *						  using the node
> + *
> + * Return:		Returns status, either success or error+reason
> + */
> +static int zynqmp_pm_get_node_status(const u32 node, u32 *const status,
> +				     u32 *const requirements, u32 *const usage)
> +{
> +	u32 ret_payload[PAYLOAD_ARG_CNT];
> +	int ret;
> +
> +	if (!status)
> +		return -EINVAL;
> +
> +	ret = zynqmp_pm_invoke_fn(PM_GET_NODE_STATUS, node, 0, 0,
> +				  0, ret_payload);
> +	if (ret_payload[0] == XST_PM_SUCCESS) {
> +		*status = ret_payload[1];
> +		if (requirements)
> +			*requirements = ret_payload[2];
> +		if (usage)
> +			*usage = ret_payload[3];
> +	}
> +
> +	return ret;
> +}
> +
> +/**
>   * zynqmp_pm_set_requirement() - PM call to set requirement for PM slaves
>   * @node:		Node ID of the slave
>   * @capabilities:	Requested capabilities of the slave
> @@ -769,6 +810,7 @@ static const struct zynqmp_eemi_ops eemi_ops = {
>  	.set_requirement = zynqmp_pm_set_requirement,
>  	.fpga_load = zynqmp_pm_fpga_load,
>  	.fpga_get_status = zynqmp_pm_fpga_get_status,
> +	.get_node_status = zynqmp_pm_get_node_status,
>  };
>  
>  /**
> diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
> index 0a68849..fb4efc9 100644
> --- a/include/linux/firmware/xlnx-zynqmp.h
> +++ b/include/linux/firmware/xlnx-zynqmp.h
> @@ -62,6 +62,7 @@
>  
>  enum pm_api_id {
>  	PM_GET_API_VERSION = 1,
> +	PM_GET_NODE_STATUS = 3,
>  	PM_REQUEST_NODE = 13,
>  	PM_RELEASE_NODE,
>  	PM_SET_REQUIREMENT,
> @@ -309,6 +310,8 @@ struct zynqmp_pm_query_data {
>  struct zynqmp_eemi_ops {
>  	int (*get_api_version)(u32 *version);
>  	int (*get_chipid)(u32 *idcode, u32 *version);
> +	int (*get_node_status)(const u32 node, u32 *const status,
> +			       u32 *const requirements, u32 *const usage);
>  	int (*fpga_load)(const u64 address, const u32 size, const u32 flags);
>  	int (*fpga_get_status)(u32 *value);
>  	int (*query_data)(struct zynqmp_pm_query_data qdata, u32 *out);
> -- 
> 2.7.4
> 
