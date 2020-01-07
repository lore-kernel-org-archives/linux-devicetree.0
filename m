Return-Path: <SRS0=83Av=24=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13A73C282DD
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jan 2020 19:52:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D9913206DB
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jan 2020 19:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578426746;
	bh=2Rt8QBkwsT8hqHrj/Cy8k8w71wAL2Fyl80RFLWrMlDQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=U98/TQ9MNU6RJ9qrt5DohKXjgtbcsnFbUH9f2gtKXXf2XrJSSDk3cigCOuOeBy+Se
	 zavi9pL/TyWV7DT9vbx9qAVR13ZBnmBoqKQuxkdq9Z8+xe7SaedoxQ8ot6Z1G45N4u
	 gbxDfGMCkUz/aciNSFq0Zp90VAe477erypezsGcg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728369AbgAGTw0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 7 Jan 2020 14:52:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:37358 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728358AbgAGTw0 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 7 Jan 2020 14:52:26 -0500
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D6E56206DB
        for <devicetree@vger.kernel.org>; Tue,  7 Jan 2020 19:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578426746;
        bh=2Rt8QBkwsT8hqHrj/Cy8k8w71wAL2Fyl80RFLWrMlDQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=qbe4WB003BufWRMI4iq8w+Eqbb0/XzH/5VFJ4sUA2f6I46f+wJWlRs3m7PPnNmscu
         iYpIRQVE9zDpIqymWuqn6KX0x/H6fdTLf+TYLvytFj6CaKIzihHrrfFT32dIO+OCOz
         RGAwSYy24SQCRTSY9kHlwjzxSCGJQ9isHIqa05iA=
Received: by mail-qk1-f172.google.com with SMTP id x1so475938qkl.12
        for <devicetree@vger.kernel.org>; Tue, 07 Jan 2020 11:52:25 -0800 (PST)
X-Gm-Message-State: APjAAAUL9Dor2T8R6Z3YcxXj3GRkgubsoyZYgHJIJDfNYHW3Lmbn2auE
        +/hzMCbuqvuYtwgnEJ3KPCE4Xxu5kKKCnHxhDQ==
X-Google-Smtp-Source: APXvYqydWfBVAnZIKKmVTsP2BSuvkrTyEB6Wnb6j0Ux07qk+ik6JM+AXfglu7IoQ0c/w36bS6FRPyi67+RTkoOkatM0=
X-Received: by 2002:a05:620a:135b:: with SMTP id c27mr904157qkl.119.1578426745034;
 Tue, 07 Jan 2020 11:52:25 -0800 (PST)
MIME-Version: 1.0
References: <20200102101712.5085-1-sam@ravnborg.org> <20200102101712.5085-2-sam@ravnborg.org>
In-Reply-To: <20200102101712.5085-2-sam@ravnborg.org>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 7 Jan 2020 13:52:13 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLdbS5W0xZq_TfLmWh8J6+t1arvzov85rtj3UXuK0QRaQ@mail.gmail.com>
Message-ID: <CAL_JsqLdbS5W0xZq_TfLmWh8J6+t1arvzov85rtj3UXuK0QRaQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: one binding file for all simple panels
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Yannick Fertre <yannick.fertre@st.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Jan 2, 2020 at 4:17 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> There is an increasing number of new simple panels.
> Common for many of these simple panels are that they have one
> mandatory power-supply and some of them have backlight and / or
> an enable gpio.
>
> The binding file to describe these panels adds overhead
> that really do not add value.
> The binding are known and there is nothing gained from a
> dedicated binding file nor for any dedicated example.
>
> The following patch introduces a single panel-simple.yaml
> and converts two ampire bindings over to the new file.
>
> The conversion - if applied will have following effects:
>
> - The maintainer for the individual file will change
>     There is no need for many different maintainers for a simple binding.
>     We have the same situation with the panel-simple driver in the kernel.
>
> - The license will change to (GPL-2.0-only OR BSD-2-Clause)
>     There is usually only a single line copied from the original
>     file, a line that is often copied from a datasheet.
>     This license change should be acceptable considered what little
>     is copied.
>     If the license change is not OK we can use a dedicated binding
>     file in these cases.
>
> This is a follow-up on Rob's big patch converting a lot of panel bindings
> to individual files:
>
> "dt-bindings: display: Convert a bunch of panels to DT schema"
> https://patchwork.ozlabs.org/patch/1197683/
>
> The objectives with one file for the relevant simple panels are:
> - Make it simpler to add bindings for simple panels
> - Keep the number of bindings file lower and thus easier to find a
>   relevant file to copy from when adding new panels.
> - Keep the binding documentation for simple panels more consistent
> - Make it simpler to add support for new panels
>
> v2:
>   - spelling fixes (imirkin via irc, Rob)
>   - updated description (Rob)
>   - list properires in alphabetical order
>   - added power-supply to example (Rob)
>   - updated title
>   - reworded changelog a little
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Yannick Fertre <yannick.fertre@st.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: devicetree@vger.kernel.org
> ---
>  .../panel/ampire,am-480272h3tmqw-t01h.yaml    | 42 -------------
>  .../panel/ampire,am800480r3tmqwa1h.txt        |  7 ---
>  .../bindings/display/panel/panel-simple.yaml  | 59 +++++++++++++++++++
>  3 files changed, 59 insertions(+), 49 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/ampire,am-480272h3tmqw-t01h.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/ampire,am800480r3tmqwa1h.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-simple.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
