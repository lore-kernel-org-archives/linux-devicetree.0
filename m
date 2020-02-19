Return-Path: <SRS0=2Ix+=4H=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA648C34047
	for <linux-devicetree@archiver.kernel.org>; Wed, 19 Feb 2020 15:04:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8DE792465D
	for <linux-devicetree@archiver.kernel.org>; Wed, 19 Feb 2020 15:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582124659;
	bh=aQz+oMVhP59pKCZfJYEh352KcY8oJwDTkUymrkIxseM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=AgwQPmkC0Y7NXNccb/ULLpIK51Bp8nrzAujzVTIwXaFclS2j15VKQCso4MyPGTUJE
	 HkfGtN/+5x1rUv00FrW4mdRHcNRP7KBvLKCK9up+KGSYSELXFbbqkAZcJEmsiV1XI5
	 kqgCo2LlnD1wrk8KikjDJOWlVjh+4Cip+tS+NMhU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726663AbgBSPET (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 19 Feb 2020 10:04:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:59940 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726652AbgBSPES (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 19 Feb 2020 10:04:18 -0500
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 148E8208C4;
        Wed, 19 Feb 2020 15:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582124658;
        bh=aQz+oMVhP59pKCZfJYEh352KcY8oJwDTkUymrkIxseM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=XtKVEJx/AeacHMxTbLdnqQ7/GkRg3DpfDWXzbX/xj2gS93Z7Qm88Ebr0CgmW/o6dT
         3QNuprDQh+wEoe5tNlsQmKnEs328cmDZr85hdUHbi1Y43hvOKrFKoXYHMWyQBtxQmh
         ypl3Fyc188GC2ig7FYWKYRMemVBEVO9xULpA+3uY=
Received: by mail-qk1-f173.google.com with SMTP id j8so348244qka.11;
        Wed, 19 Feb 2020 07:04:18 -0800 (PST)
X-Gm-Message-State: APjAAAWn0BvZf3IAKmMVHHjmZSg+F/ZOJOGYgObANQTLGYVzya+dKboG
        zsMRmFH+o9CRp7Gsij7wj2jtKJS5hRTngcFcjw==
X-Google-Smtp-Source: APXvYqzcchk/L5V4mDMKhenl4+M4iGEasL3H2WrAmp8nMQ4Ghi5sHELqsZj+RZiswZs/6V042u3atBZ4/sIrjz3et+o=
X-Received: by 2002:a37:5347:: with SMTP id h68mr23305765qkb.393.1582124657261;
 Wed, 19 Feb 2020 07:04:17 -0800 (PST)
MIME-Version: 1.0
References: <20200114123821.2649367-1-thierry.reding@gmail.com> <CAL_JsqKJUdhjWx5z_-kedNNm4mD6oSGizqEQ57vxtGbMFySbbQ@mail.gmail.com>
In-Reply-To: <CAL_JsqKJUdhjWx5z_-kedNNm4mD6oSGizqEQ57vxtGbMFySbbQ@mail.gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 19 Feb 2020 09:04:06 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL5NzRcr6G-f0soGjb9p=+aJmU6xXEMQCLG7n0GSaxH1w@mail.gmail.com>
Message-ID: <CAL_JsqL5NzRcr6G-f0soGjb9p=+aJmU6xXEMQCLG7n0GSaxH1w@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: memory-controller: Update example for
 Tegra124 EMC
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Jan 14, 2020 at 12:32 PM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Tue, Jan 14, 2020 at 6:38 AM Thierry Reding <thierry.reding@gmail.com> wrote:
> >
> > From: Thierry Reding <treding@nvidia.com>
> >
> > The example in the Tegra124 EMC device tree binding looks like an old
> > version that doesn't contain all the required fields. Update it with a
> > version from the current DTS files to fix the make dt_binding_check
> > target.
> >
> > Reported-by: Rob Herring <robh+dt@kernel.org>
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  .../nvidia,tegra124-emc.yaml                  | 19 +++++++++++--------
> >  1 file changed, 11 insertions(+), 8 deletions(-)
>
> Acked-by: Rob Herring <robh@kernel.org>
>
> Thanks for fixing quickly.

Or not. I assumed you were going to send this via arm-soc given that's
where the problem was, but given it still hasn't appeared anywhere and
it's in master now I'll apply it.

Rob
