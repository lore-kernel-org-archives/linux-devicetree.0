Return-Path: <SRS0=8MPa=5Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 903DBC2D0EA
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 09:58:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6414020787
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 09:58:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="idsfVbcS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728071AbgDHJ60 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Apr 2020 05:58:26 -0400
Received: from mail-ua1-f68.google.com ([209.85.222.68]:46999 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725932AbgDHJ60 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Apr 2020 05:58:26 -0400
Received: by mail-ua1-f68.google.com with SMTP id y17so2429123uap.13
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2020 02:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/KSnT58fVHI1rOGU8uuODx+6ELq/Ks+s8czTqOysk1Y=;
        b=idsfVbcSavH8tGrA4MfiXmKww0CsIpBTJUqXsUvwHvQVz0+HoeKj6cPN2ieKqe2gQc
         dwooqy54GGu61bQmOIEkPFGPkpQ3dmQmZ0BHwF20yfQ3UoNi1Hj7K3nZncRQEdgkGco/
         pgrJeUmnkP5bwlStZbSluZs82+feHEDiEQJNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/KSnT58fVHI1rOGU8uuODx+6ELq/Ks+s8czTqOysk1Y=;
        b=CRE1KVypG5b88xUq1BcBA5G1NcLbipMlFoh9mTEYQW+AoXn6n6twImFMHkIIS+3mO0
         JB5ismPkpWhq7Y8ORGN53PDVznZQPqynKl1tXxVkiZB0PH+XGbyLjoRkEEly6wfdWEi6
         6YEJPMLG1C/vroZOs38QEIl5ay5ljlYYe58QdQdLNBDgf0sDCAB9zec5wwNRA4ixOhyt
         fygxtyfH55M8seR7+r4/HJzcCBog3odtGJVhfbdwxBVj3sI8fV8fEdhDoq9BoS9+0uo3
         5i+VfwBVHy9RTI+qUW2GiPwJ42FlgabSiFki5aB8TYnhVysXMMZIJwiWWhdguKycLOa6
         WiqA==
X-Gm-Message-State: AGi0PuZcjIye47uWkIeaO+MV4GpatEHza6Ojh0ezfh4pJLdm3d31RXjK
        jxoSGSqubFOIzaIVyCU4XT16DOJS0KhCCpxBe2iuPg==
X-Google-Smtp-Source: APiQypINgJUBTWurvd0z/FyqSrVEEyqzKKMfEgLm9GQm6RsQwA7GMWLXsLhoKGa12Tt2GpHRkBpQN4mRrXzRk+HFw9w=
X-Received: by 2002:ab0:158b:: with SMTP id i11mr4975462uae.123.1586339905116;
 Wed, 08 Apr 2020 02:58:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200306085513.76024-1-ikjn@chromium.org> <20200312192023.GA19701@bogus>
In-Reply-To: <20200312192023.GA19701@bogus>
From:   Ikjoon Jang <ikjn@chromium.org>
Date:   Wed, 8 Apr 2020 17:58:14 +0800
Message-ID: <CAATdQgBFMbLLwkntKu6dgU1S0DAxx9yTffh0ERac6CM90-G0bA@mail.gmail.com>
Subject: Re: [PATCH v7] dt-bindings: mfd: Convert ChromeOS EC bindings to json-schema
To:     Rob Herring <robh@kernel.org>, Lee Jones <lee.jones@linaro.org>
Cc:     devicetree@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Nicolas Boitchat <drinkcat@chromium.org>,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Mar 13, 2020 at 3:20 AM Rob Herring <robh@kernel.org> wrote:
>
> On Fri,  6 Mar 2020 16:55:13 +0800, Ikjoon Jang wrote:
> > Convert the ChromeOS EC bindings to json-schema.
> >
> > Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> > Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> > ---
> >  .../devicetree/bindings/mfd/cros-ec.txt       |  76 -----------
> >  .../bindings/mfd/google,cros-ec.yaml          | 129 ++++++++++++++++++
> >  2 files changed, 129 insertions(+), 76 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/mfd/cros-ec.txt
> >  create mode 100644 Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> >
>
> Reviewed-by: Rob Herring <robh@kernel.org>

This patch should go through Lee Jones tree?
