Return-Path: <SRS0=2e0x=5J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF272C43331
	for <linux-devicetree@archiver.kernel.org>; Tue, 24 Mar 2020 12:20:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 88665208CA
	for <linux-devicetree@archiver.kernel.org>; Tue, 24 Mar 2020 12:20:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XS7FO5qu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727545AbgCXMU5 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 24 Mar 2020 08:20:57 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:44613 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727480AbgCXMUy (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 24 Mar 2020 08:20:54 -0400
Received: by mail-lf1-f66.google.com with SMTP id j188so9147758lfj.11
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2020 05:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xE4MP5AqUCPd9XtoEWD/FK2YPE6NfLNz1ySPK/KUqcg=;
        b=XS7FO5quXRQMzlcU6oLgb0XC3ZGpFmBkGVb2+urTxc0RoXE+LhQwMcjmE1iMAOa4zj
         5PDAtVRds458I1ZL9d59wLIw4CZpPrU4m4igICIiVAXvDor0bsq0DssE4nmVlA1PDTlr
         9Juvmpsk6zwiXtmO5tbpYKysU5GPTSeag89VuFevHBL8HovL4xeC2CptKa/9avBarldI
         TNKRCuIdtZyWoZlwAcrKcb4Cq5dHK9UKgDmiunIO8+8Ty4coajwPeKXNmvWqU9OBiiIQ
         YkQFBoINbMMKzAyLh7/C9VyRE7zFm2KikI2U9i1pS66meUqbKQlBhvdRAOHMPTiLB293
         udYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xE4MP5AqUCPd9XtoEWD/FK2YPE6NfLNz1ySPK/KUqcg=;
        b=Ezm53KtqibQqVqucAZK9s5UHS4Rs9kkjcgwNBU3SaT7Y1bFhJJpdj/mpF+uHgxP12M
         zaIntYKUkvrcxH2+pfXXV8RW+N4ujkqBRbkoUNl5G2/uonzl1CJOD20IxDlAOaG1BIXC
         IOAJnqQZjjWX/X5leJ+Af/2pNUmxzzr52q4PnBGbh0gndJHiWzmYUMVFxbqDLNuiJPD8
         c67wq6Mkwko7d9Hh818SFLDwjFzb5EHkSQgTcyogNNQOUau1rfp5aU1Z1BQTDkW6soQv
         0c+E8Fe1FG/o7HmLQnGkteMDdTHY2rWxTXKRXNI1E5g4ud1VtUZPJ0rRHxNVEZsSkblz
         pVUA==
X-Gm-Message-State: ANhLgQ0BqGI0odlgFKQup9I7EtRenLju+3Q10JS5VcrxracrM9qDII2y
        HRsbwezeLsZYmHosxcxbIEnQ31ASeDgZqrLLtWRcdg==
X-Google-Smtp-Source: ADFU+vvOwzEWB/KB6v68gGlAUeCZXrHF76lOWQJ2agZ6yCYIP2gtQNst0yT5ZM3f+idvKa0KVyZTDM7DqQh+3t9vivQ=
X-Received: by 2002:ac2:5b49:: with SMTP id i9mr2148928lfp.21.1585052452258;
 Tue, 24 Mar 2020 05:20:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200323234505.226919-1-rajatja@google.com> <20200324115059.GA2333340@kroah.com>
In-Reply-To: <20200324115059.GA2333340@kroah.com>
From:   Rajat Jain <rajatja@google.com>
Date:   Tue, 24 Mar 2020 05:20:14 -0700
Message-ID: <CACK8Z6EHAv03XGXT0sY2H3TSjS4-yQtCscbHG_o1qCuG94zb6g@mail.gmail.com>
Subject: Re: [PATCH RESEND 1/5] input/serio/i8042: Attach fwnode to serio
 i8042 kbd device
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Dmitry Torokhov <dtor@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Enrico Weigelt <info@metux.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Allison Randal <allison@lohutok.net>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-input <linux-input@vger.kernel.org>,
        devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Furquan Shaikh <furquan@google.com>,
        Duncan Laurie <dlaurie@google.com>,
        Benson Leung <bleung@google.com>,
        Zentaro Kavanagh <zentaro@google.com>,
        Dominik Behr <dbehr@google.com>,
        Rajat Jain <rajatxjain@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hello,

On Tue, Mar 24, 2020 at 4:51 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Mar 23, 2020 at 04:45:01PM -0700, Rajat Jain wrote:
> > Attach the firmware node to the serio i8042 kbd device so that device
> > properties can be passed from the firmware.
> >
> > Signed-off-by: Rajat Jain <rajatja@google.com>
> > Change-Id: I36032f4bdee1dc52f26b57734068fd0ee7a6db0b
>
> Didn't you run checkpatch.pl on your patches which told you to remove
> all of these Change-Id: values?

My apologies. However I did run checkpatch.pl on my patches before
sending (also checked just now again) and it did not complain about
the Change-Id values in the commit log. Not sure if I'm running the
command incorrectly?

rajatja@rajat2:~/stock_kernel/linux$ ./scripts/checkpatch.pl
../patches/input_atkbd/v1/000*
-----------------------------------------------------------------------------------------
../patches/input_atkbd/v1/0001-input-serio-i8042-Attach-fwnode-to-serio-i8042-kbd-d.patch
-----------------------------------------------------------------------------------------
total: 0 errors, 0 warnings, 28 lines checked

../patches/input_atkbd/v1/0001-input-serio-i8042-Attach-fwnode-to-serio-i8042-kbd-d.patch
has no obvious style problems and is ready for submission.
-----------------------------------------------------------------------------------------
../patches/input_atkbd/v1/0002-Input-atkbd-Expose-function-row-physical-map-to-user.patch
-----------------------------------------------------------------------------------------
total: 0 errors, 0 warnings, 106 lines checked
../patches/input_atkbd/v1/0002-Input-atkbd-Expose-function-row-physical-map-to-user.patch
has no obvious style problems and is ready for submission.
......
<snip>
......

I will now resubmit the patches removing the Change-Id(s).

Thanks & Best Regards,

Rajat



>
> Please do so...
>
> greg k-h
