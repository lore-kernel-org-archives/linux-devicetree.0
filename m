Return-Path: <SRS0=58Ja=6S=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CACAC47257
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 May 2020 19:30:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8011D20705
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 May 2020 19:30:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ifAKVHKC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbgEDT36 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 4 May 2020 15:29:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726487AbgEDT35 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 4 May 2020 15:29:57 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3DB6C061A0F
        for <devicetree@vger.kernel.org>; Mon,  4 May 2020 12:29:57 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id 145so6022875pfw.13
        for <devicetree@vger.kernel.org>; Mon, 04 May 2020 12:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=a+aKA/BgdfGEu/HvAWAFuAhdXG7p1ne0trHem3E7jOk=;
        b=ifAKVHKC0hZoYu1uz7T+MCQlENWsSpvtqxL2qWOzP4dt6WBqYGegQJLc7aKAu6ORwq
         c+0XuYkxLDvgm4ktezqRjN/bhZoNgHAFiOp3/9w1fSCM3lL/kRS9SgDlVP9KKvF897qE
         a3BBFT3E/VklZ3JS7hJYTbc5Z/FSPRtwlYE94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=a+aKA/BgdfGEu/HvAWAFuAhdXG7p1ne0trHem3E7jOk=;
        b=V2MJDVo+egthRdrYdPbHhvsq6kvMzfI553hKB1sFTU/OGM3RBss039brEeohXUKDFe
         VX1J+MC1pEI5q7NbMEA/n8dXGqIdR/HqWJNOsmAlXRV0zoRWQYpVrFZjZRlOo8OAaYAr
         On8Yu8NRnMEfMfr8Fj9tcDeop6Z3R/XrY6SssctgNA4tAOnjR4QRoUndZBxI3NR+QuLZ
         bIKVbTrGTsTmrmQvXwAnTzMV2kJ5Qwi76k7rgxNGVlsn8a8oAIw30AVXdkL85yXl4hG8
         x2EjaUnyr38lVVialq2/GmZghn6MatxesVKih6zlsYzxW9j4r/6d0jGIJCyrzwJwD3Ve
         tU0A==
X-Gm-Message-State: AGi0PublTrEda03tpGMViozJ3EH4928qU7kqWfGNT6QbGgJlgZ1BFqgj
        BnTG82AK662Jip/etaDGGgaQzA==
X-Google-Smtp-Source: APiQypK9IFpilbSKQD/5CkKs5NvrrHkMqFihMhBDibi9+AN8TRPwUPHAGEj8obSzYs3+BjvU+9joBg==
X-Received: by 2002:a63:6d2:: with SMTP id 201mr503910pgg.160.1588620597225;
        Mon, 04 May 2020 12:29:57 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id w12sm9414441pfq.133.2020.05.04.12.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 12:29:56 -0700 (PDT)
Date:   Mon, 4 May 2020 12:29:55 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Pavel Tatashin <pasha.tatashin@soleen.com>
Cc:     jmorris@namei.org, sashal@kernel.org, linux-kernel@vger.kernel.org,
        pmladek@suse.com, sergey.senozhatsky@gmail.com,
        rostedt@goodmis.org, anton@enomsg.org, ccross@android.com,
        tony.luck@intel.com, robh+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v1 3/3] ramoops: add dump_all optional field to ramoops
 DT node
Message-ID: <202005041229.D410FE0B1@keescook>
References: <20200502143555.543636-1-pasha.tatashin@soleen.com>
 <20200502143555.543636-4-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200502143555.543636-4-pasha.tatashin@soleen.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sat, May 02, 2020 at 10:35:55AM -0400, Pavel Tatashin wrote:
> Currently, it is possible to dump kmesges for panic, or oops.
> With dump_all it is possible to dump messages for kmesg_dump events,
> for example reboot, halt, shutdown, kexec.

Please just collapse this into patch #2.

Thanks!

-Kees

> 
> Signed-off-by: Pavel Tatashin <pasha.tatashin@soleen.com>
> ---
>  Documentation/devicetree/bindings/reserved-memory/ramoops.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/reserved-memory/ramoops.txt b/Documentation/devicetree/bindings/reserved-memory/ramoops.txt
> index 0eba562fe5c6..3ce424c9ad4c 100644
> --- a/Documentation/devicetree/bindings/reserved-memory/ramoops.txt
> +++ b/Documentation/devicetree/bindings/reserved-memory/ramoops.txt
> @@ -47,5 +47,8 @@ Optional properties:
>  
>  - no-dump-oops: if present, only dump panics (defaults to panics and oops)
>  
> +- dump-all: if present, dump kernel messages during all kmesg dump events.
> +  Reasons are specified in include/linux/kmsg_dump.h KMSG_DUMP_*
> +
>  - flags: if present, pass ramoops behavioral flags (defaults to 0,
>    see include/linux/pstore_ram.h RAMOOPS_FLAG_* for flag values).
> -- 
> 2.25.1
> 

-- 
Kees Cook
