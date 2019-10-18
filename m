Return-Path: <SRS0=cZLa=YL=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA3F1CA9EA0
	for <linux-devicetree@archiver.kernel.org>; Fri, 18 Oct 2019 18:39:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A6AF121925
	for <linux-devicetree@archiver.kernel.org>; Fri, 18 Oct 2019 18:39:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o/AVbTpu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505669AbfJRSjd (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 18 Oct 2019 14:39:33 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:33065 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502793AbfJRSjc (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 18 Oct 2019 14:39:32 -0400
Received: by mail-oi1-f195.google.com with SMTP id a15so6078160oic.0
        for <devicetree@vger.kernel.org>; Fri, 18 Oct 2019 11:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ehXsduEufI5Z+LBu/3xJfIT3IHAbo4RBsjs4lfnOsVk=;
        b=o/AVbTpufUwVlLw2IH/kyrPmX5xyRp44PPCK3+dvQqhbPzdxFfvfgvRB824YVwCV0b
         mHqfyg6EpZaITHapp0pRDP2YbEiJYwY0ogseEBdeB508tsHikcI+3IU9/gwOyYLdFeZJ
         ZbUxVMHy/OfJqH5PJ5xLmgv1zZXoykz9Po7XmLQb38fzB/GL5hehWemXS9xrd6SDM7CQ
         Q6PjTvwvLbbIl3HV57RNVYg7yCrIN6cLFa3oI4z8jEAZrX9JkRhkeU1Nyckec2RDdohC
         oTcePShT2dSO6AZn7lKOwlXD/Hxbl63zjBDfrabfW33D13eqDuR+PLGHRlyL5s4xbSe6
         kFLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ehXsduEufI5Z+LBu/3xJfIT3IHAbo4RBsjs4lfnOsVk=;
        b=tgmKN3kX1FY5Cq+jmVP6b29UElPBBytDahhbY/hJ3wPahaPenPhW8sdTZPsKPng6dp
         Dp2LTh/pkRWCsOuLexGYHuc3WSYL8XaaF+VXtViCCq8MpsNSKYGST2TVmf5GIZHttSKV
         BO967em78mYQXcIT+z16I/UhqaJ191vlzaLFvnsQkeyCKHuKfNwS4g1CpwtwBXR5W41l
         gC6Jtlqe9LQuQptjPVGXNd+AmYL2WJrvB4silGOmouQ9kkLPUEcQ7ifyKAK9VvGUpdu6
         d3ycrid3u+QZhxzkXXsfz5vvZaPtJZ6f8ZwJ4LAdRVLK5eAEIzrkfulKt6fmE1xMRNQq
         rO2Q==
X-Gm-Message-State: APjAAAXTHorV4BWeZGV6ucdlZVoRGGe6HbGLZhlmMBAuJCqETEIrejDO
        mPVKcLjiLWYznNKM98+XU8nTEzf6Poe9ugu2oP2KSw==
X-Google-Smtp-Source: APXvYqxcAVv4IVYlFSWySPq8REWSKrEYBWbH7O/dQ1RvjD6j98hFsYaeP0zxpJA7Pbnh2oTn4bFCnA5uGkjCuSXZ2nQ=
X-Received: by 2002:aca:1a18:: with SMTP id a24mr9341535oia.145.1571423971400;
 Fri, 18 Oct 2019 11:39:31 -0700 (PDT)
MIME-Version: 1.0
References: <20191017213539.00-tzungbi@google.com> <20191017213539.07.I5388b69a7a9c551078fed216a77440cee6dedf49@changeid>
 <20191018172220.GC4828@sirena.co.uk>
In-Reply-To: <20191018172220.GC4828@sirena.co.uk>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Sat, 19 Oct 2019 02:39:20 +0800
Message-ID: <CA+Px+wXCjaP1uktHLffRCe2C1P_D21f2+A=HDdhutoGv-BVzZQ@mail.gmail.com>
Subject: Re: [PATCH v4 07/10] ASoC: cros_ec_codec: support WoV
To:     Mark Brown <broonie@kernel.org>
Cc:     ALSA development <alsa-devel@alsa-project.org>, robh+dt@kernel.org,
        devicetree@vger.kernel.org,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Benson Leung <bleung@google.com>,
        Gwendal Grignou <gwendal@google.com>,
        Nicolas Boichat <drinkcat@google.com>,
        Jimmy Cheng-Yi Chiang <cychiang@google.com>,
        Dylan Reid <dgreid@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sat, Oct 19, 2019 at 1:22 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Oct 17, 2019 at 10:00:12PM +0800, Tzung-Bi Shih wrote:
> > 1. Get EC codec's capabilities.
> > 2. Get and set SHM address if any.
> > 3. Transmit language model to EC codec if needed.
> > 4. Start to read audio data from EC codec if receives host event.
>
> This breaks the build:
>
> ld: sound/soc/codecs/cros_ec_codec.o: in function `calculate_sha256.isra.15':
> cros_ec_codec.c:(.text+0x119d): undefined reference to `crypto_alloc_shash'
> ld: cros_ec_codec.c:(.text+0x11c1): undefined reference to `crypto_shash_digest'
> ld: cros_ec_codec.c:(.text+0x11df): undefined reference to `crypto_destroy_tfm'
> make: *** [Makefile:1094: vmlinux] Error 1

Thanks so much for pointing this out.  Yeah, I forgot to select
CRYPTO_SHA256 in Kconfig.

Looks like there is a blind point in my local build tests
(allyesconfig, allnoconfig, allmodconfig).  The config in the build
fail case could be "CROS_EC_CODEC=y" and "CRYPTO_*=n".

Could you tell me how you get the .config (to enhance my local build
tests next time)?  I tried randconfig several times but it seems not
easy to hit the case (i.e. CROS_EC_CODEC=y but CRYPTO_*=n).
