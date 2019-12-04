Return-Path: <SRS0=zDkl=Z2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 789CAC43603
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Dec 2019 15:36:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 49A84206DF
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Dec 2019 15:36:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jukLGhV+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728436AbfLDPgc (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 4 Dec 2019 10:36:32 -0500
Received: from mail-qt1-f193.google.com ([209.85.160.193]:43829 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728367AbfLDPgc (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 4 Dec 2019 10:36:32 -0500
Received: by mail-qt1-f193.google.com with SMTP id q8so113152qtr.10
        for <devicetree@vger.kernel.org>; Wed, 04 Dec 2019 07:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YNh/gbbmWRgHkbHGfxQ5xOBFieH2xGvQqMmiNQHDLT0=;
        b=jukLGhV+8R8k8f29WiBkYubuL4CzavtAmcHjIr6vtqBVZ3bsQjy4hutLuInhLUjh9u
         8CJsCgPKD5jJeijeL+JQC6JCpIwI9MbHAeKyjBlVh006dy30WghM58/EPkGH0Be06Fid
         b/7qWEf27WZkxmQSxXxHpGv9ekHgX1KorhWzTn5obmfKfwrKxbkDjMnNNactM8o7hP4x
         eAAs8fW9J8DgYlY8tejeV7r7p9H6ZeNoQhIg8dXoBdGk3KG7K+ODsEY57kyH/TG9qrD2
         8MXPdk9zNa9sgkn5Jw5IfnoZui4bUrlRkcnWsbEncO+au9CHmgQOkTrUIWoL78+j3O/Y
         OOFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YNh/gbbmWRgHkbHGfxQ5xOBFieH2xGvQqMmiNQHDLT0=;
        b=KWXMdgnCsruergtsqsZ2KYA+Yfp+SHOu11QArlOOMAbAHb4jWP3R20SCBYI0yqTMla
         n9CEivLyHEHStV3hCi9jHgsK40i8sEJ0FNzmiGhNY1ZccqUQHmG+9nTMFXHAbkUrqSYy
         A0iBR6vgPKVC2HMx78In5YBGTp9ro0/msLBf1CQW8LyygU9Z7RPvWOGN0+INEkZoFHik
         UAYdj6qsy6isa6RU4Qdy77Iqxomr5XiHUXaaTWkT/CZID7gk8HPTh0Q4h9mpCC4j5DOi
         Nm7ko249G7ls7IO5S1jRkcqL6Xn3NzcOYNZkv66zgK9SBQ4OxWDN5o1nEFwUET/MgHx6
         BWiA==
X-Gm-Message-State: APjAAAUnDAJ7UdOLoTbyEdVEH98YGIg6S/pxfCyYXexWujmJBSQJUL3I
        Jh/s2IzYWnBTpl2H5EhWaloKrG+Ag7f/yjBLybE=
X-Google-Smtp-Source: APXvYqzUpz7kRayiI1Tw/Pfmt8JgMzT5TG0GjLQ638rS/KA5BxIubo5kP0KfMWuC/foYdyXWCMO42hh+Jpms1/xSkSI=
X-Received: by 2002:ac8:1494:: with SMTP id l20mr3241584qtj.356.1575473791024;
 Wed, 04 Dec 2019 07:36:31 -0800 (PST)
MIME-Version: 1.0
References: <20191204103940.22050-1-miquel.raynal@bootlin.com>
In-Reply-To: <20191204103940.22050-1-miquel.raynal@bootlin.com>
From:   Peter Geis <pgwipeout@gmail.com>
Date:   Wed, 4 Dec 2019 10:36:19 -0500
Message-ID: <CAMdYzYrEmTqvJ6m54EADxLDf70duCtdz3pesV3EZmt67=cbs5g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Describe PX30 caches
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Heiko Stuebner <heiko@sntech.de>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Dec 4, 2019 at 5:40 AM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> PX30 SoCs feature 4 Cortex-A35 CPUs with each of them a L1 data and
> instruction cache. Both are 32kiB wide (PX30 TRM) and made of 64-bit
> lines (ARM Cortex-A35 manual). I-cache is 2-way set associative (ARM
> Cortex-A35 manual), D-cache is 4-way set associative (ARM
> Cortex-A35manual).
>
> An L2 cache is placed after these 4 L1 caches (PX30 TRM), is 256kiB
> wide (PX30 TRM) and made of 64-bit lines (ARM Cortex-A35 manual) and
> is 8-way set associative (ARM Cortex-A35 manual).
>
> Describe all of them in the PX30 DTSI.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  arch/arm64/boot/dts/rockchip/px30.dtsi | 35 ++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts/rockchip/px30.dtsi
> index 1fd12bd09e83..0e10a224a84b 100644
> --- a/arch/arm64/boot/dts/rockchip/px30.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
> @@ -48,6 +48,13 @@
>                         cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
>                         dynamic-power-coefficient = <90>;
>                         operating-points-v2 = <&cpu0_opp_table>;
> +                       i-cache-size = <0x8000>;
> +                       i-cache-line-size = <64>;
> +                       i-cache-sets = <256>;
> +                       d-cache-size = <0x8000>;
> +                       d-cache-line-size = <64>;
> +                       d-cache-sets = <128>;
> +                       next-level-cache = <&l2>;

If the i-cache is 2-way associative and the d-cache is 4-way, wouldn't
that mean these two values are backwards?

>                 };
>
>                 cpu1: cpu@1 {
> @@ -60,6 +67,13 @@
>                         cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
>                         dynamic-power-coefficient = <90>;
>                         operating-points-v2 = <&cpu0_opp_table>;
> +                       i-cache-size = <0x8000>;
> +                       i-cache-line-size = <64>;
> +                       i-cache-sets = <256>;
> +                       d-cache-size = <0x8000>;
> +                       d-cache-line-size = <64>;
> +                       d-cache-sets = <128>;
> +                       next-level-cache = <&l2>;
>                 };
>
>                 cpu2: cpu@2 {
> @@ -72,6 +86,13 @@
>                         cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
>                         dynamic-power-coefficient = <90>;
>                         operating-points-v2 = <&cpu0_opp_table>;
> +                       i-cache-size = <0x8000>;
> +                       i-cache-line-size = <64>;
> +                       i-cache-sets = <256>;
> +                       d-cache-size = <0x8000>;
> +                       d-cache-line-size = <64>;
> +                       d-cache-sets = <128>;
> +                       next-level-cache = <&l2>;
>                 };
>
>                 cpu3: cpu@3 {
> @@ -84,6 +105,13 @@
>                         cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
>                         dynamic-power-coefficient = <90>;
>                         operating-points-v2 = <&cpu0_opp_table>;
> +                       i-cache-size = <0x8000>;
> +                       i-cache-line-size = <64>;
> +                       i-cache-sets = <256>;
> +                       d-cache-size = <0x8000>;
> +                       d-cache-line-size = <64>;
> +                       d-cache-sets = <128>;
> +                       next-level-cache = <&l2>;
>                 };
>
>                 idle-states {
> @@ -107,6 +135,13 @@
>                                 min-residency-us = <2000>;
>                         };
>                 };
> +
> +               l2: l2-cache {
> +                       compatible = "cache";
> +                       cache-size = <0x40000>;
> +                       cache-line-size = <64>;
> +                       cache-sets = <512>;
> +               };
>         };
>
>         cpu0_opp_table: cpu0-opp-table {
> --
> 2.20.1
>
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
