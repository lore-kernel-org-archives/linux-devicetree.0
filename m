Return-Path: <SRS0=S3xR=6R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B529C28CBC
	for <linux-devicetree@archiver.kernel.org>; Sun,  3 May 2020 16:27:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 26F99208DB
	for <linux-devicetree@archiver.kernel.org>; Sun,  3 May 2020 16:27:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LBqVSlnn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728779AbgECQ1t (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 3 May 2020 12:27:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728002AbgECQ1t (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 3 May 2020 12:27:49 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38471C061A0E;
        Sun,  3 May 2020 09:27:49 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id z2so9827898iol.11;
        Sun, 03 May 2020 09:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=UoKLp3wsAvQ0PDfwYM+iK5Rm0NvZZzksFoZxqClZ7Gs=;
        b=LBqVSlnnvSnRBe1nGEqTAjxc5k4BlYe2Y5gzkMQt6w70dHqNI0vWDXmCZic37L5Kes
         Zy1P84+HbLzIw8jDAJG9w3pqhl2qnBDRH4Jv863lIJwxfhblLcYwywAizT9wuQYQg1X0
         iLG5WSMtp1L5aYLHoy+KwuLky4vgFIouadC6FzkkXxpZv2icCYvVB4i8OVg/Pxswjwft
         OJJfcigxBeEB8A0K7SjFBbuH58CqneOsVOy2MzftjQLDvoy5eQW5boWB8wokV9NmP8Op
         t8canenCl6ek9cytDmkQCmBLRnlkIXtOzSKjKxReIrI8kYKVqajCJbBy2p3NYRc+Z9CJ
         Z6gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=UoKLp3wsAvQ0PDfwYM+iK5Rm0NvZZzksFoZxqClZ7Gs=;
        b=Jov5C8LpuiRkNh7sMswG7b+XF/Rgx96pLtq/kqWDdhXjIrYyxgS2ObDGaBUmFWuDR7
         zQFNVE7iqAzTjyb1r4NMC/t1TwTQnA2JKJI4ooTQ5T29rYCNVVzlyRL2IKJgFbB7AOpW
         p0GgtF7QQhH9FXgz3XzQcuSs3WhtNYk20nu+9CcXyZI6PVhKnA2FTxZVo0zdR1yCiBTE
         v6VHoFTa54hviflUptcvxN2GwY3Oi7s4h9y52DaFWNc8HzopdkXM746MhhZZKoTGY8pO
         RbTMkq4AYobo2Xn7Qksr1bwQiTFT4Xp6y77vS6bH9eaj3i056WkItJ9N+J73oPnvajue
         xlfw==
X-Gm-Message-State: AGi0PuYYD/DUJa+ujs/LUWWDPkk4MVCIpxvqgmDSV8+Y9qqBWn8bxqRN
        3p1dDpwHG7zs0yFRni4YpLrmE+LTK1x9s8I8Rwf3BRyP
X-Google-Smtp-Source: APiQypLSIcNWbCCkLkVaz+55TiVJRH/hBbWm5Oo3CUyH4or7pbYDL3NXZHaeKzi5Jg10/1WbDzKxu7WqJO+aXGnvePE=
X-Received: by 2002:a05:6638:103c:: with SMTP id n28mr11191622jan.114.1588523268303;
 Sun, 03 May 2020 09:27:48 -0700 (PDT)
MIME-Version: 1.0
From:   CVS <cvs268@gmail.com>
Date:   Sun, 3 May 2020 21:57:06 +0530
Message-ID: <CAK-9PRD97nc8JpQ+zov1hAXnzr7u8rBW0NE82Qbg=AeHsUw-2w@mail.gmail.com>
Subject: RFC - DTV (Device Tree Visualiser)
To:     devicetree-spec@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hello Everyone,

I often need to review/edit large number of dts(i) files,
in complex include and override hierarchies.
(eg. A single dts file that includes  >70 dtsi files, over 10 levels,
resulting in a device-tree with >5000 lines)

To manage such complexity,
i have written a tool - Device Tree Visualiser (DTV).

Here is annotated screenshot of the "alpha" version of DTV with the
features working so far.
https://drive.google.com/file/d/1VrIueTIQ-m4MRtVTuIWjv2RzzTE_rzGp/view

Note: In the screenshot i have opened a single random DTS file from a
public MSM Android kernel.
https://android.googlesource.com/kernel/msm.git/+/refs/heads/android-msm-coral-4.14-android10/arch/arm64/boot/dts/qcom/sm8150-mtp-overlay.dts

- DTV aims to provide a unified device-tree view,
  with the best of both worlds - decompiled DTB and source DTSI files.

- DTV is written in python3 + Qt5

- DTV uses the source annotation feature available in recent versions of dtc.
  https://www.spinics.net/lists/devicetree-compiler/msg01864.html

- I am currently working on extending DTV to
    - display and hyperlink, the relevant dt-bindings and documentation.
    - support users to easily specify (and run) complex validation logic.
      eg. 2 camera-modules must not share an i2c bus if either is
configured above a certain resolution.

If such a DTV tool seems worthwhile,
i would like to publish/maintain it publicly.
Maybe under https://github.com/devicetree-org/

Currently, i am looking for feedback on this tool / framework.
Let me know any thoughts on this...

regards
CVS
