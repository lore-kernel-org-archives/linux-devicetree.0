Return-Path: <SRS0=ov7W=5P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8896DC2D0E9
	for <linux-devicetree@archiver.kernel.org>; Mon, 30 Mar 2020 09:08:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3BAC5206CC
	for <linux-devicetree@archiver.kernel.org>; Mon, 30 Mar 2020 09:08:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dt32BAoH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729768AbgC3JIJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 30 Mar 2020 05:08:09 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:45904 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729583AbgC3JIJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 30 Mar 2020 05:08:09 -0400
Received: by mail-ed1-f65.google.com with SMTP id u59so19708918edc.12
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2020 02:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JBfZUA3Ue04SNaNjIZbI9Q9GTKiTiLsqF41qopeumkI=;
        b=dt32BAoHu9GoJYKoESUHVeABNyH6w2lRqp4VaFNbRqhLaC6j9w9egbO4jl4XaZEIx+
         8zcfAVXuYsi0EM0VrT4p2tfAnXNrRRK2FvCByoRDjyG9NmUScF0FPmjXZfE5IDFZen1+
         zvbHyUcNeuM+3LtmfPvMWFI+psRdwt4e7d/Hp+H+BwjWMX5iDTkckQzHD6HaQzineZn/
         dhBCM5nDXXR97TXcuuraV3uV5gcaJCbTWmw3h2ob/7z7BWFtZFyMBn5x5gmCnd272G50
         bUazJJrRwv/9rbSLa98jrRM1UyRqGtw/stwXwGWWsUSln9sff7FAJSnye1gsir9W9zfL
         NTPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JBfZUA3Ue04SNaNjIZbI9Q9GTKiTiLsqF41qopeumkI=;
        b=SXMtn1axZvej9YgNOBCLNJZIhVGPZh+yuIPeMtjPB2YJY2CB8qxZE0Fiz93wbl7hCB
         ixm2Rq6FQ5gCpRFA+65O7KikLEyJPCdnIRjQMkDxVRhthGEmsnWe3xOpEYl1IRh2n/qg
         JtPiesoMP+dn4plHBiuCu6OdSm6O2PzaNLEsTTJS3acTj7fGy/3Z7lJE5xaujaBOQL/L
         dmfdI3BdJY3YizditT6CYMo7nAhDRYzBSssUkTXI6aV7MyVoRZV3y7DOobTb3jnhMGLa
         JjvCV8HWK8DNeWuohRQG8/I+LLzYbf9ivT+wIhQyTI5rEUNg73nPZIFirNh7HrBnYHaK
         2X6A==
X-Gm-Message-State: ANhLgQ0tPB5QtQ02AgTHLQOVzY/FsZpX2qy/+LRr0gai8JMKF+UD5cwP
        P+4WQVN1XdFHXJVgH5XezqYvRiqNsOHijYAk0lHbXA==
X-Google-Smtp-Source: ADFU+vvI5+4zWFwNRaiSUVTSAykaV3rTKvG6GrKxC8T0xaJwOzpUM715vIIVfPuIzsUyjRQDmL1jVdM1D7tN6CGWUfU=
X-Received: by 2002:a17:906:3410:: with SMTP id c16mr10254113ejb.304.1585559287665;
 Mon, 30 Mar 2020 02:08:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200318054442.3066726-1-bjorn.andersson@linaro.org>
In-Reply-To: <20200318054442.3066726-1-bjorn.andersson@linaro.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Mon, 30 Mar 2020 11:11:33 +0200
Message-ID: <CAMZdPi_psRiy1FG338N1=9F+o4b=0ANLdc3UiCTB=UoMS=CH=A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: msm8996: Reduce vdd_apc voltage
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 18 Mar 2020 at 06:46, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> Some msm8996 based devices are unstable when run with VDD_APC of 1.23V,
> which is listed as the maximum voltage in "Turbo" mode. Given that the
> CPU cluster is not run in "Turbo" mode, reduce this to 0.98V - the
> maximum voltage for nominal operation.
>
> Fixes: 7a2a2231ef22 ("arm64: dts: apq8096-db820c: Fix VDD core voltage")
> Cc: Loic Poulain <loic.poulain@linaro.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Don't see any problem with that change, tested with and without
cpufreq (db820c).

Tested-by: Loic Poulain <loic.poulain@linaro.org>
