Return-Path: <SRS0=ig8w=Y5=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9968C49EAD
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 Nov 2019 09:47:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AE23920869
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 Nov 2019 09:47:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AFaRIlMM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730686AbfKEJrF (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 5 Nov 2019 04:47:05 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:45971 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730550AbfKEJrE (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 5 Nov 2019 04:47:04 -0500
Received: by mail-lf1-f67.google.com with SMTP id v8so14557224lfa.12
        for <devicetree@vger.kernel.org>; Tue, 05 Nov 2019 01:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oDNWILhILXF6mm3H8oNcRKPRc083ULdV5HXXzp1YeDc=;
        b=AFaRIlMMQwRPRvs6hBDvvglJuPWks9L1fmgOScjoJ/K+WcuKcrtV6SmSdIYBovyIy5
         HJPQ50rNGla80V9nO70LfoT38gOPHKRHDJ7EAUk2tAty8u6jhaTFk3wz8jJR9YI/CSd1
         MyHqQdGBqXLO4S1WrLMR6xTqUPGKLqwytU8ezk9JDoycIQsMFVnhbdyOkAPNiCuC1EY5
         i9JfQZxKfWmzkiVkyxHgGWRMRypI5vzTMHRokDc3dKCP7fGMBKsOUHwBgwgpy0jAuOY8
         sMnwYJTy3BFjsVzUF4ZErDbqnEzVVMv3KlcEJPM0qsMG9F5YbxRIESz1yh+dGVrtp4dX
         YvaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oDNWILhILXF6mm3H8oNcRKPRc083ULdV5HXXzp1YeDc=;
        b=kyC2am/Zm7lRGuplhCR+xQqFutLHqZfAM9WLibWckOkH2lfq+syuzCxOrsQGNsI6xd
         u/mBB2nwYPnI7RZEi6bgqpASnLr8eMN0FEj0fc+m/7EUkYVmP1gB16lS72vCpMPlOS8t
         d+G49LZWpCPOujONHYI6oyAhc9JEVkeqfaJA2z7n/R5aj79jH/oxLvl7ZiTSS+n4iJK8
         zczKr0gVLeke0+NX7+uyGR3C6nKHfsdFuZ6wcnMqth83khn2NWNNGviHs934av8Ra/N0
         QIgzIBu6zer0S5uahT++rwsn6YjEk2xGNLwt8DW1j0ZIK5+nBXtUhstpmiTjTIEIrhnK
         aUAw==
X-Gm-Message-State: APjAAAVaT01GIBpM7InhGTO9haCVQCxa/XP6Xepqh2Pppa13J8QFu+Lw
        F+/2+T1NxSDS9T1h1LVGysTyscOfl7X3kTAqiJQnrg==
X-Google-Smtp-Source: APXvYqwfZqIhef589Sh7H+bqh1w3hb9xsL8VjAw2n9TDnV6oj/Lqb7qFfvrsz1pjeeXvoCktgzKbjc7xIdbUvbZlrCY=
X-Received: by 2002:a19:ca13:: with SMTP id a19mr19713764lfg.133.1572947220669;
 Tue, 05 Nov 2019 01:47:00 -0800 (PST)
MIME-Version: 1.0
References: <cover.1572926608.git.rahul.tanwar@linux.intel.com>
In-Reply-To: <cover.1572926608.git.rahul.tanwar@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 5 Nov 2019 10:46:49 +0100
Message-ID: <CACRpkdZWJ_4h_+QapgH1bP7EhMwBTy-6DRpv_EaWDzFutWHKaQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] pinctrl: Add new pinctrl/GPIO driver
To:     Rahul Tanwar <rahul.tanwar@linux.intel.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
        Andriy Shevchenko <andriy.shevchenko@intel.com>,
        qi-ming.wu@intel.com, yixin.zhu@linux.intel.com,
        cheol.yong.kim@intel.com
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Nov 5, 2019 at 7:49 AM Rahul Tanwar
<rahul.tanwar@linux.intel.com> wrote:

> This series is to add pinctrl & GPIO controller driver for a new SoC.
> Patch 1 adds pinmux & GPIO controller driver.
> Patch 2 adds the corresponding dt bindings YAML document.
>
> Patches are against Linux 5.4-rc1 at below Git tree:
> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
>
> v3:
> - Add locking for GPIO IRQ ops.
> - Fix property naming mistake in dt bindings document.
> - Address other code quality related review concerns.
> - Fix a build error reported by kbuild test robot.
> - Remove deleted structure fields from comments.

This version looks perfectly acceptable to me, any remaining nits
can surely be fixed-up in-tree.

I give the other reviewers some days to consider it and then I
will merge it for v5.5.

Yours,
Linus Walleij
