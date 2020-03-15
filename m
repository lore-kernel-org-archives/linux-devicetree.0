Return-Path: <SRS0=kXhk=5A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1867C10DCE
	for <linux-devicetree@archiver.kernel.org>; Sun, 15 Mar 2020 05:23:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A814620722
	for <linux-devicetree@archiver.kernel.org>; Sun, 15 Mar 2020 05:23:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rT4Fsdqj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726936AbgCOFXo (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 15 Mar 2020 01:23:44 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:34615 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727503AbgCOFXm (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 15 Mar 2020 01:23:42 -0400
Received: by mail-pg1-f196.google.com with SMTP id t3so7588404pgn.1
        for <devicetree@vger.kernel.org>; Sat, 14 Mar 2020 22:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wR8nFRPEBNLxmIrRh2XX942TMuucAJ5R0/7i6Fo9p5k=;
        b=rT4FsdqjKQBVFo3+uu3fzLfB762MuezwSN1LOBD3ukiXZTdXlSwwQK0uPYMfrGKpBw
         HStP0LAwyHUgCf+9x10UYRCF9UJunuqcsp28aLez8GE2hFDyi0ofXM8Dr154ZCspaaDE
         VtH1KqHCF1ohopOvbBe7ipKJhL7UEUPpzwYNws75GT7CW6MhGKCWLuE60W0BotyCDLvo
         r4veXdZGi+c7XAXXCQaraojq3143FgIV7X78c33GlZQNlXCKwXQtmByc8TvqoSmTlHRH
         Cgon8IVWrL7L1XDgxXdvlKuzPupzlbR94v3hnlq4+LXltc9bPmrXUZb2Ky4pFUwuc1FI
         26Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wR8nFRPEBNLxmIrRh2XX942TMuucAJ5R0/7i6Fo9p5k=;
        b=NZLFpjDuyyjLVGQTpAtTg8xeiGedMj0cmK5JcOo/8xlZj/BisukUq3G5syecw2X3+K
         v0+Fs0mTdT3WfyIjRFGucGZn2mw9SSCEdsoylaxYOlRa55v4uxbqKGsFGmzX0vHrW7rP
         pPpi9BVgSht9yUDz94iHlA5KbV2Hvckr054lgH6pSI89zNkRrMrH8GgRizndOCEZ9HnZ
         qzwzn+xkevZkYe+q49rCxOnxtzfhO1ivhRvnp85Qa62EJpo5zo3logPZqTekNV67QQrr
         db4cVnz1ZAHZTCtaVJ/LVm66TOD66VlNAFl1RThiiViAw0OrSN989mzSgksKeGO/Tso7
         BbUQ==
X-Gm-Message-State: ANhLgQ0dmHVDeeajm+4w2S4CmFVNLqXmuUXKwzz319G36H2z3JyCr5N/
        ukec0JROVaLnNu0UK0yjRXYU+Q==
X-Google-Smtp-Source: ADFU+vs5W6pKhDasxst/A96FZNjz5ZlLsLbn4MZHDngTRdMpMnXsBjfTrhf9HXmupeey+hIoU1207w==
X-Received: by 2002:a63:514f:: with SMTP id r15mr20218986pgl.432.1584249822088;
        Sat, 14 Mar 2020 22:23:42 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id s12sm33303143pgi.38.2020.03.14.22.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2020 22:23:41 -0700 (PDT)
Date:   Sat, 14 Mar 2020 22:23:39 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] arm64: dts: qcom: sdm845: add audio support
Message-ID: <20200315052339.GH1098305@builder>
References: <20200312143024.11059-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200312143024.11059-1-srinivas.kandagatla@linaro.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu 12 Mar 07:30 PDT 2020, Srinivas Kandagatla wrote:

> This patchset adds analog audio support for sdm845 based boards.
> 
> 
> Changes since v1:
> 	- various trival cleanups done as suggested by Bjorn
> 	- added compressed audio dai for db845c
> 

Thanks Srini!

I fixed up the sort order per Vinod's feedback and applied these, with
Vinod's acks.

Regards,
Bjorn

> Srinivas Kandagatla (5):
>   arm64: dts: qcom: sdm845: add slimbus nodes
>   arm64: dts: qcom: sdm845: add apr nodes
>   arm64: dts: qcom: c630: Enable audio support
>   arm64: dts: qcom: sdm845: add pinctrl nodes for quat i2s
>   arm64: dts: qcom: db845c: add analog audio support
> 
>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts    | 159 ++++++++++
>  arch/arm64/boot/dts/qcom/sdm845.dtsi          | 281 ++++++++++++++++++
>  .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 113 +++++++
>  3 files changed, 553 insertions(+)
> 
> -- 
> 2.21.0
> 
