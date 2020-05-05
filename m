Return-Path: <SRS0=A/SL=6T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D890AC47254
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 May 2020 21:59:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B6399206B8
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 May 2020 21:59:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="W+FRQA/+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729332AbgEEV7m (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 5 May 2020 17:59:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727089AbgEEV7l (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 5 May 2020 17:59:41 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DFA6C061A0F
        for <devicetree@vger.kernel.org>; Tue,  5 May 2020 14:59:39 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id t9so223228pjw.0
        for <devicetree@vger.kernel.org>; Tue, 05 May 2020 14:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7DJAN+zbZyTzksYSg0qDgZvny75gqESht2EoDUaeiY0=;
        b=W+FRQA/+YRd56cMxtvZmLJp090eeRcsIqjOPZmT1h4oT7cL+3/93gEuj0aZsyxswoj
         /g8sIOtDYHgVk9tLzJ0zNLel9iYPQK5Q2L7XWTLQK62Y5fp3tPpRxenMDhgvVGCFLmOQ
         cax5jcZmQljak+AOJMscZtwwXalTjIF8cLBh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7DJAN+zbZyTzksYSg0qDgZvny75gqESht2EoDUaeiY0=;
        b=gkTNl2UMgyH9okmccaino3qVm7fSOaE1IzeiaxfhY2aQU8zPJ+nbjDhBcd21JmK4RH
         2SKKE0YcGyJL7t2V9QGjx4r+SjX6UhFmQX0jtbyhFdnvOFXDwU8Lxd7sNfmhs4OGUNPi
         hyu/+43MmbKMomWEqoJFwQt0MofxbAu5jQR8Z1hwTD93Ne18XWZx/1A8dvdEc25HwSqF
         gzD5Hk0PVegqrZW9lryOE3pE4e/+aUrorWy8D2Dx3u0nJH29OUSGDmrkK6EOwP99iP1e
         TYvvnQ3cvZ6JAs6gAMfE/Es+Sv5spYVvqoeMkdrPNuwqM4YEzByClOGRFGzGXxl05Olg
         Nw+Q==
X-Gm-Message-State: AGi0PuaZuZCcurqiYA0jXZOBnVZ3h922G50lORqHBvTUYWeZwGuR5HvK
        Uq4JSbsj2hRrBR6qtEjYT/p/kg==
X-Google-Smtp-Source: APiQypJCt+dy6XRM52vo53M6C2Qv1WIYAb9bhb2IKGG9HB+savuLO3ddRG8mUd+gHanaOatqDPK8Jw==
X-Received: by 2002:a17:90a:276a:: with SMTP id o97mr5469618pje.194.1588715979157;
        Tue, 05 May 2020 14:59:39 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id s44sm3065952pjc.28.2020.05.05.14.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 14:59:38 -0700 (PDT)
Date:   Tue, 5 May 2020 14:59:37 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Pavel Tatashin <pasha.tatashin@soleen.com>
Cc:     jmorris@namei.org, sashal@kernel.org, linux-kernel@vger.kernel.org,
        pmladek@suse.com, sergey.senozhatsky@gmail.com,
        rostedt@goodmis.org, anton@enomsg.org, ccross@android.com,
        tony.luck@intel.com, robh+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/5] pstore/platform: pass max_reason to kmesg dump
Message-ID: <202005051444.14B6686@keescook>
References: <20200505154510.93506-1-pasha.tatashin@soleen.com>
 <20200505154510.93506-3-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200505154510.93506-3-pasha.tatashin@soleen.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, May 05, 2020 at 11:45:07AM -0400, Pavel Tatashin wrote:
> Add a new field to pstore_info that passes information about kmesg dump
> maximum reason.
> 
> This allows a finer control of what kmesg dumps are stored on pstore
> device.
> 
> Those clients that do not explicitly set this field (keep it equal to 0),
> get the default behavior: dump only Oops and Panics, and dump everything
> if printk.always_kmsg_dump is provided.
> 
> Signed-off-by: Pavel Tatashin <pasha.tatashin@soleen.com>
> ---
>  fs/pstore/platform.c   | 4 +++-
>  include/linux/pstore.h | 3 +++
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/pstore/platform.c b/fs/pstore/platform.c
> index 408277ee3cdb..75bf8a43f92a 100644
> --- a/fs/pstore/platform.c
> +++ b/fs/pstore/platform.c
> @@ -602,8 +602,10 @@ int pstore_register(struct pstore_info *psi)
>  	if (pstore_is_mounted())
>  		pstore_get_records(0);
>  
> -	if (psi->flags & PSTORE_FLAGS_DMESG)
> +	if (psi->flags & PSTORE_FLAGS_DMESG) {
> +		pstore_dumper.max_reason = psinfo->max_reason;
>  		pstore_register_kmsg();
> +	}

I haven't finished reading the whole series carefully, but I think
something we can do here to make things a bit more user-friendly is to
do the KMSG_DUMP_UNDEF value here to get us the "all" instead of INT_MAX:

	if (psi->flags & PSTORE_FLAGS_DMESG) {
		pstore_dumper.max_reason = psinfo->max_reason;
		if (pstore_dumper.max_reason == KMSG_DUMP_UNDEF)
			pstore_dumper.max_reason = KMSG_DUMP_MAX;
		pstore_register_kmsg();
	}

That way setting max_reason to 0 without setting dump_oops at all will
get "all". I think it'll need some tweaks to the next patch.

>  	if (psi->flags & PSTORE_FLAGS_CONSOLE)
>  		pstore_register_console();
>  	if (psi->flags & PSTORE_FLAGS_FTRACE)
> diff --git a/include/linux/pstore.h b/include/linux/pstore.h
> index e779441e6d26..45ae424bfeb5 100644
> --- a/include/linux/pstore.h
> +++ b/include/linux/pstore.h
> @@ -97,6 +97,8 @@ struct pstore_record {
>   * @read_mutex:	serializes @open, @read, @close, and @erase callbacks
>   * @flags:	bitfield of frontends the backend can accept writes for
>   * @data:	backend-private pointer passed back during callbacks
> + * @max_reason: Used when PSTORE_FLAGS_DMESG is set. Contains the
> + *              kmsg_dump_reason enum value.

Nit: please move this above @data since it has a @flags dependency.

>   *
>   * Callbacks:
>   *
> @@ -180,6 +182,7 @@ struct pstore_info {
>  
>  	int		flags;
>  	void		*data;
> +	int		max_reason;
>  
>  	int		(*open)(struct pstore_info *psi);
>  	int		(*close)(struct pstore_info *psi);
> -- 
> 2.25.1
> 

Looking good!

-- 
Kees Cook
