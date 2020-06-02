Return-Path: <SRS0=mVKz=7P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C026DC433DF
	for <linux-devicetree@archiver.kernel.org>; Tue,  2 Jun 2020 20:06:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 98A6F20734
	for <linux-devicetree@archiver.kernel.org>; Tue,  2 Jun 2020 20:06:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ilWBNL6s"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726580AbgFBUGa (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 2 Jun 2020 16:06:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbgFBUG3 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 2 Jun 2020 16:06:29 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45159C08C5C0
        for <devicetree@vger.kernel.org>; Tue,  2 Jun 2020 13:06:29 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id n24so14049889ejd.0
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2020 13:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:cc;
        bh=2cvL0+Yd9yN39Q4W3Qqy3Rcpep61FLY3/TIOy09PrYQ=;
        b=ilWBNL6s/oqv/pCLSUhL8IL831D81QGaeiNVKp0LalmXfcBuxutdTlF0Cc5SKaDDl6
         tdO/hoPcG61TPtpylyPK3kBVMD/f1XfPjgfZr9ZO0wxs55mwF7xFscZ+9Pkz0m9MCRpS
         0TqpEQ7+odCILe4DjqorpWyhIhJnKNV2GaeF4kuk0OBrB+2Silo7pL0hJvQ1pa74Go90
         3TtFVFoJc7dGV3BLpr/raidOS4rfGoICmxCxgotaMjst7psccsp0blAyVko+xGS66rCM
         TU4gK+zRCT6bbyG9kC9nO3loifidqpus0Angr7i6i1D8h8h47bA8WUiCM5RuJyfQ4wI/
         f3aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:cc;
        bh=2cvL0+Yd9yN39Q4W3Qqy3Rcpep61FLY3/TIOy09PrYQ=;
        b=lijehi0HZvsg/bIliLs5hYaBjsbIkqnHtm6b/RLFi/WZ31zql8F7XtCphkQGdBZbtR
         9WVzFu4srmLgioiZkzn20DxcSqgsLAYhxkFu/Kq5eyMcM3W+kVqQshUj0m/R8wWpfoy9
         ZASZbjwbFoMMyer18WcVjJEDO/RGq+rqxbQnkIzmryyr4baZhaZ5wkvbH7Fb+VOlNR7x
         o8IHk8wYi09Grf2etv7xTAEWtwj+5zX3qEJ5ZMGPIVOtNxjE71r7BmPT01drkiBJ6NKD
         j5/ngu0ecnJC7ozUJ+vVnSf69z0puVPrsrtanwvl6KI6Ic2bVTV9LNFKI4MzFBO+0tZV
         yIww==
X-Gm-Message-State: AOAM530kQbsh+MMswQ1MUUZs8SZf06d0F5KXeifwuclmWBtvxB/Qrnls
        cj9oVrWMPC1w6WbOuq6TpabndfyuV9C4q5jSmqM=
X-Received: by 2002:a17:906:ae85:: with SMTP id md5mt16518434ejb.213.1591128388033;
 Tue, 02 Jun 2020 13:06:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200602200407.320908-1-konradybcio@gmail.com>
In-Reply-To: <20200602200407.320908-1-konradybcio@gmail.com>
From:   Konrad Dybcio <konradybcio@gmail.com>
Date:   Tue, 2 Jun 2020 22:05:52 +0200
Message-ID: <CAMS8qEUOYuLfWTm4y9a2ZPJ2KyRs287jfkka0XntSWXyeZhgtQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] soc: qcom: smd-rpm: Add msm8994 compatible
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
To:     unlisted-recipients:; (no To-header on input)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Interestingly enough, this compatible has been used in lg-bullhead DTS
for a long long time, even though it has never existed upstream.
