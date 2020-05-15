Return-Path: <SRS0=lCsO=65=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4015AC433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 May 2020 19:31:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 12D412070A
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 May 2020 19:31:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="FKh4uRFu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726223AbgEOTbF (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 15 May 2020 15:31:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726168AbgEOTbF (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Fri, 15 May 2020 15:31:05 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0078C061A0C
        for <devicetree@vger.kernel.org>; Fri, 15 May 2020 12:31:04 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id g16so3178523eds.1
        for <devicetree@vger.kernel.org>; Fri, 15 May 2020 12:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vErvnQoqbf5Meaqtse3zpzTQXTThCj+PlNibNhhv2Uo=;
        b=FKh4uRFuzk6LWrSXDP88E2gJbQI+bBtvd2Vrw7lgHu5eyGOb+HDjTj2KDYFJxLUWzB
         PeZd/YkHHi25f64qU7/fLCFVGlERXsCjnxhlPRoAPpUYPCS+rmfQlU95K29FzuDaYRU1
         DB5aTnj3yrcjckhA/nS5y/+P1iauWWrbkRD5BHYJlSy71m6X61xPbEfO0sKbRrA75lmQ
         0SV5LPanC51ygC4iYuKyA1gPRqiKOWdHrmIvWhdmUpTWlJnEH8lXicDlYcgQ98lpSm5+
         cRmYG4HbwPlg1LKXAdiwuFNu/WuRc8kWB33kOw6rB15rTCvWOEmMSbQwGdErqx0Gd1vf
         3/hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vErvnQoqbf5Meaqtse3zpzTQXTThCj+PlNibNhhv2Uo=;
        b=K5UKaTwNchISNnQYZV2OHILXks4esH1kYBT7IuEMA8LdS8NYUYtazmjwpDyHxT6BUu
         FhVgzl4xIHaD1SAC3D9jvGdTxUdClvIqiSGgRiyh9x/NCDE2SjzegvAMQ/jjwlqTig4V
         X+FYCtFDnn69RD2SduixJfuttxooCuTmAgdRzH+xzlVifmy/yXDC4Nzg+IwSJKgK/pc6
         w5OikMDcKKh0jqa/IE9MkqcxuCyDo65U+kChHVqt5InqNzOxdoamPepStZZGrk0BxB48
         23WOqAo7R3OJDboWcsfOmjkS6cXSSd4P4NmqGvBK9e9EeRig+GCVdf4SLkJlplgyPKha
         JxSA==
X-Gm-Message-State: AOAM531xY8C3UlOtqRszG9REj2FQziOxu9uxGaXMq7fI4iC+pRQX+BuR
        i7rjtVM6DsF4EKnYJOxbLD4JcRVGtZOzZW4tYZVuQQ==
X-Google-Smtp-Source: ABdhPJxVNhuoHXSVLn9PLNKxdspcJcNGGfAsekctXnv0fKnHI35D8TQO83ALfAlxb/fVSimNFlN5uGf+30lkrJL6Cxw=
X-Received: by 2002:aa7:da04:: with SMTP id r4mr4302843eds.346.1589571063296;
 Fri, 15 May 2020 12:31:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200515184434.8470-1-keescook@chromium.org> <20200515184434.8470-6-keescook@chromium.org>
In-Reply-To: <20200515184434.8470-6-keescook@chromium.org>
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
Date:   Fri, 15 May 2020 15:30:27 -0400
Message-ID: <CA+CK2bAvTo1=oLH32-Wdz07F3OP=T+gA6GgzkBH1Q9W8upHkNg@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] pstore/ram: Introduce max_reason and convert dump_oops
To:     Kees Cook <keescook@chromium.org>
Cc:     Petr Mladek <pmladek@suse.com>, Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Benson Leung <bleung@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

>  #define parse_u32(name, field, default_value) {                                \
>                 ret = ramoops_parse_dt_u32(pdev, name, default_value,   \

The series seems to be missing the patch where ramoops_parse_dt_size
-> ramoops_parse_dt_u32 get renamed, and updated to handle default
value.
