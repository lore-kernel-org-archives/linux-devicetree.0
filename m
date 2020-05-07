Return-Path: <SRS0=rqTW=6V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C615CC38A2A
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 12:58:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A33142082E
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 12:58:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="JHyNVkG+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725879AbgEGM63 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 7 May 2020 08:58:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725903AbgEGM62 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 7 May 2020 08:58:28 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15B1EC05BD09
        for <devicetree@vger.kernel.org>; Thu,  7 May 2020 05:58:28 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id d16so5267716edv.8
        for <devicetree@vger.kernel.org>; Thu, 07 May 2020 05:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JhXYcpwKf2XpGZELWtHA1frK/acuUyPFrjCaNoc2FRk=;
        b=JHyNVkG+93UuLQKtfOniky75gTXR//TNux3FixdF8PnLgOw9/dy6zBIhm248HfGnCl
         90JDM8VELNhrd5z34reDxxxJNI3ibPs/qJy1Nw0lwklQiEwVDZt7Zia9HH4BLqFdSIn/
         LkXmpaioVzgbR/RCZdp5Y+LC9SGlIu69v97t2YKM1qv4uk4DRq4PTzk9nZ8nrn3TQvUf
         +kDkattSiHnljhbNJdSBG/ipnDep7QQRc9enZF8bfUYqttNxFQ1GBsqE4BnmI0qkEVnG
         RUQsD0Zb2jWXYAPCK5Cs6oXrn6Pdl06KLdgVGGK/YzDF5KRCCWhDti6+uxGXzQh9tY1s
         fKeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JhXYcpwKf2XpGZELWtHA1frK/acuUyPFrjCaNoc2FRk=;
        b=FC4veeE5VowB1o9IK7j2a26vDj+8bPmLh0olO4lD9k0UuDxr1PGuElkVeFOAhb/ea7
         JfdF3pboTPpmCN+ZUXV1kw1nZVfmVwADI+tAvtDCU9mIGfqYzsRoch0iTUypJYbWX4JZ
         dUwhehhQOAucLKqcrMW2el/ITGh37oUcgyfBfL9cmtDkf4Qwuui3GyFp5iB1v6r004UM
         LB0zSTvfT3bFsUYm2kPavk+8qIhcPftRcWA6w1T//QEpm9QaHsZKcfNqtV8kG0FtNHrO
         hRbs7LomrEyLiCed68Fx1xO7B08SRsoXw5GZ+9NHfvijibEEON+ho8ahglBxs5VQCgqK
         Rzqg==
X-Gm-Message-State: AGi0PubPAk6iVId8Ov/7DI+qProBuZpeauasI07skHA20a0xR0fgwmJv
        dEuAkt3Pz0Vcp7L2jtYSFPuhihqTl+1QeVJ8TgaDQQ==
X-Google-Smtp-Source: APiQypJW23seoNUjQ9Cjb9iCJOyGQrSpBnxCRp+l1gSYgC9RrkDJ7cqjnZwF8iBU8cJartiNHh3Pvba2heWCxCMCrFA=
X-Received: by 2002:aa7:cfc3:: with SMTP id r3mr12143634edy.342.1588856306666;
 Thu, 07 May 2020 05:58:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200506211523.15077-1-keescook@chromium.org> <20200506211523.15077-4-keescook@chromium.org>
In-Reply-To: <20200506211523.15077-4-keescook@chromium.org>
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
Date:   Thu, 7 May 2020 08:57:50 -0400
Message-ID: <CA+CK2bCu8eFomiU+NeBjVn-o2dbuECxwRfssNjB3ys3caCbXeA@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] pstore/ram: Refactor DT size parsing
To:     Kees Cook <keescook@chromium.org>
Cc:     Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Petr Mladek <pmladek@suse.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        James Morris <jmorris@namei.org>,
        Sasha Levin <sashal@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, May 6, 2020 at 5:15 PM Kees Cook <keescook@chromium.org> wrote:
>
> Refactor device tree size parsing routines to be able to pass a non-zero
> default value for providing a configurable default for the coming
> "max_reason" field.
>
> Signed-off-by: Kees Cook <keescook@chromium.org>

ramoops_parse_dt_size
parse_size

Are used to parse flags, and max-reason properties, so the "size" in
their names become outdated. How about:
ramoops_parse_dt_prop
parse_prop

Otherwise it looks good.

Thank you,
Pasha
