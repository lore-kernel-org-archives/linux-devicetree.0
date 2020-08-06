Return-Path: <SRS0=kUjg=BQ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76AC7C433E0
	for <linux-devicetree@archiver.kernel.org>; Thu,  6 Aug 2020 16:55:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB3B62086A
	for <linux-devicetree@archiver.kernel.org>; Thu,  6 Aug 2020 16:55:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="Q0Vkd8f+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729834AbgHFQz1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 6 Aug 2020 12:55:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729824AbgHFQzI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 6 Aug 2020 12:55:08 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AE46C0A8897
        for <devicetree@vger.kernel.org>; Thu,  6 Aug 2020 07:46:13 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id c19so6724334wmd.1
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2020 07:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gLXqGFGiHgPstKedhUHjfysLbjGakCzVB3i4zDx+oWw=;
        b=Q0Vkd8f+xEGj7g+Tfc/bf7PgGTANOuxb8H/vt4RA8nQe0K9jblkNaMap5vDZwOxwRH
         jtVczWc4chEpp+xh4NPMhlEUHFF83KX3i+4LOutvQnN1JiU9nq85rZ0MbqjQMUtAK/yf
         1aI0JEz98Tx2V1OOL9Blul3Bt50mZ7MHmN4yA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gLXqGFGiHgPstKedhUHjfysLbjGakCzVB3i4zDx+oWw=;
        b=KqL9iLXRD+fQwUoOAB56yKGI9sGdW8SbskajFmGcdX0iOeecqT+bRDWzo3blnTzkpM
         PNpvj4KKO1T9WdDrWawcScktsm409rgOUqKPzuBs3LKsik7QBoEP+YtBDBVh74Q1/H0L
         JaeyFUT4hUqIKC4yxjTvdI9mE9gJbDFtu4ALdPbhsy2SnXY3ymjyQkn4mrDa8J9CUt/T
         a8/ykGOajA4B346RgjFCvnRRGYFEPpdsCCFCg2ynGt5Bxh6YqorzIRoIW5lbz/edYWQi
         GJa9fHrZNiZc+mI3VYhyypBSUnhN4zkaToHqjP8Mz4LstHFth8gvxxrzZXGDApmvhb6s
         PrvA==
X-Gm-Message-State: AOAM530iQETxqUJipr+rj996dPH8b1oZ6KBVjfrR6N+TYlB38OBqDtOz
        cWkSfvvOUqS6vL0XPtolQ7LPn58jK5aMSXrpnh9FcQ==
X-Google-Smtp-Source: ABdhPJyRPdnu/4oes4dUWniKCpXd9HW462x3vl7mDrEPqKHwTpf2ehRX8ZMMFSRZUR47QXpMdE14WQ64HNIMpiKFVSE=
X-Received: by 2002:a1c:2646:: with SMTP id m67mr8832227wmm.137.1596725171925;
 Thu, 06 Aug 2020 07:46:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200805110052.2655487-1-daniel@0x0f.com> <20200805110052.2655487-2-daniel@0x0f.com>
 <CAL_JsqK5YWe71HU+bSMG2uNZOgFN85x4zatuiS-fkUYKXHDs-w@mail.gmail.com>
In-Reply-To: <CAL_JsqK5YWe71HU+bSMG2uNZOgFN85x4zatuiS-fkUYKXHDs-w@mail.gmail.com>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Thu, 6 Aug 2020 23:46:16 +0900
Message-ID: <CAFr9PXn_RSwWoaWEmW5m1pBVgo5c41KfEy0db-cgt0+v_sv5Ww@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt: bindings: interrupt-controller: Add binding
 description for msc313-intc
To:     Rob Herring <robh+dt@kernel.org>
Cc:     "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Rob,

On Thu, 6 Aug 2020 at 23:15, Rob Herring <robh+dt@kernel.org> wrote:

> Why are you sending another version? You ignored the errors and my
> questions on the RFC.

Sorry I didn't think I got any responses RFC but after searching it looks
like the email from your bot and your question about the two custom
properties went into a folder I wasn't looking at.

Based on Marc's feedback (that there should be an static irqchip
struct for each variation)
I'm going to drop the custom properties and make the metadata they had
part of the driver. They were basically there to try to make the
driver universal.

Again sorry for my mishap.

Daniel
