Return-Path: <SRS0=nYmw=A7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D72FC433E5
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jul 2020 10:02:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F0B8E21775
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jul 2020 10:01:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uEn13EOK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728151AbgGTKB4 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Jul 2020 06:01:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728044AbgGTKBz (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 20 Jul 2020 06:01:55 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62F86C0619D2
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2020 03:01:55 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id a23so7216761pfk.13
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2020 03:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=IBVdyP/pegZa7dgnXrwm5PyIQ+8xTCyFcnvPtdN5UVI=;
        b=uEn13EOKkQKFmK34APcGHbkL6i0Bc78BZn67EQvfn41Fc9a/MMheX8xL7adrdOlRhe
         hA2C2jqTAw/OZQy5HoNYNIepnDobJJplfM9mycMWrip+JIS2XLNFGzIzAkuRh7ZUhaG8
         y3q1VEXw7Cn2jnWMWlkYLFIpb7vCyn0pJ33WI7EQYk3hsxdmVtgX94P5euF9A6tqDoUy
         fwdDQqX4/TzfjC/i4+SRlySFWwVcW1jE+qt8KCTytCVjIiEMnvJzZtfSBYFKDvA8QMk1
         h9tKOxaoLTZRumfefxVu+hY8zE/HdKWaHTcyuBxVMhuwcc6fx/+CCeheDEyf3gKcMOxQ
         qvEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=IBVdyP/pegZa7dgnXrwm5PyIQ+8xTCyFcnvPtdN5UVI=;
        b=iXNxWUU2NgHzWbGL0gfPkjVUH8nx9Oi/I6lXFG8fdpPdGLcLYAiyGo2M0r0X0O6J3I
         5Mnjv1STz+6p3B2LbcO6mEZM3hC79NYe0UT6v79GUJPBS9ksq9vYA/XTk+LCRjiQVuRJ
         m/7ZjJPSnav+ulkacdKTeq2Malm59e8NzzUqtJGuW3yAD/FW703CM+HDS5BHaYSOVpIv
         OfBVNUFb+fLooR6XzqewLng1omwLmf9JKxT9AwIZ5ILADcYpQyJn5jqQcG0rCJPFebDm
         pknH6e1c5u318wKJ6tWRGK5CIHkEluKmRTL9RGgsSrP8J8aoXEoWEB4H18QzZGfy6Pwo
         Mu1A==
X-Gm-Message-State: AOAM533oXVfqQW5iDXDyj10tOjhzu/Rbi/efCGQGcP9pf09KKTWBkGti
        0jkmRc9D37lLtTR3NMkhGvsJRg==
X-Google-Smtp-Source: ABdhPJzhEikt8tP6/CpS6b+B437wPhrsq9S5Jz+w2SuVdMMdAy5NITpEubsktWnoJlAezd0lmVwv8A==
X-Received: by 2002:a62:cd89:: with SMTP id o131mr18638388pfg.195.1595239314908;
        Mon, 20 Jul 2020 03:01:54 -0700 (PDT)
Received: from localhost ([223.179.133.67])
        by smtp.gmail.com with ESMTPSA id g8sm14821824pgr.70.2020.07.20.03.01.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jul 2020 03:01:53 -0700 (PDT)
Date:   Mon, 20 Jul 2020 15:31:31 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Akhil P Oommen <akhilpo@codeaurora.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        dri-devel@freedesktop.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Matthias Kaehlcke <mka@chromium.org>,
        saravanak@google.com, Sibi Sankar <sibis@codeaurora.org>,
        Jonathan <jonathan@marek.ca>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v5 0/6] Add support for GPU DDR BW scaling
Message-ID: <20200720100131.6ux4zumbwqpa42ye@vireshk-mac-ubuntu>
References: <1594644106-22449-1-git-send-email-akhilpo@codeaurora.org>
 <CAF6AEGtAEwZbWxLb4MxaWNswvtrFbLK+N0Fez2XYr7odKZffWA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGtAEwZbWxLb4MxaWNswvtrFbLK+N0Fez2XYr7odKZffWA@mail.gmail.com>
User-Agent: NeoMutt/20170609 (1.8.3)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 15-07-20, 08:36, Rob Clark wrote:
> I can take the first two into msm-next, the 3rd will need to wait
> until dev_pm_opp_set_bw() lands

You can base that on a8351c12c6c7 in linux-next, I will make sure not to rebase
it anymore.

-- 
viresh
