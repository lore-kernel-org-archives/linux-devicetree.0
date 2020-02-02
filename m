Return-Path: <SRS0=/AfF=3W=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75D8AC3524B
	for <linux-devicetree@archiver.kernel.org>; Sun,  2 Feb 2020 04:42:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4C243206E6
	for <linux-devicetree@archiver.kernel.org>; Sun,  2 Feb 2020 04:42:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="W5dSLRFI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726912AbgBBEl4 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 1 Feb 2020 23:41:56 -0500
Received: from mail-pf1-f170.google.com ([209.85.210.170]:37416 "EHLO
        mail-pf1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726794AbgBBEl4 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 1 Feb 2020 23:41:56 -0500
Received: by mail-pf1-f170.google.com with SMTP id p14so5681251pfn.4
        for <devicetree@vger.kernel.org>; Sat, 01 Feb 2020 20:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:subject:to:cc:user-agent:date;
        bh=H12+mHAIL3bb+dr51PEHEZZsNDqvfJx+5YVGqZOlIqM=;
        b=W5dSLRFIZDasi2ZLWn6GgNC7sX8MGtmEFZNWKCJEsFT6QnVU5QO/HMBRn3UmnFMwah
         0c0UqKk4IJA0yKpbuKsWSPeBYdmgJVIL5EqGxl4qjIuEM1YkvfyR+5+scSlJvdK6HSUZ
         SYc4puNrwGTpUmg8BQtNAfjxntKMuVlTW8H5E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:subject:to:cc
         :user-agent:date;
        bh=H12+mHAIL3bb+dr51PEHEZZsNDqvfJx+5YVGqZOlIqM=;
        b=OKVlLrncAIElj9Ik7XGDuV/P9M9CYLf9GUbZ7dHtZ+oXEfwFmc2YbukmgSy0MehvGB
         42Xu09sgrCbXzdRmJaLXwPq0sPf0OkXvpsa2UtDCHk1dmSRlz0sZMMWSAxtoLvU+eXnE
         8O3KFH6S6NRphcFhkou22J+Eou9D3EYL247rI6AAP3kxELdGf+Efv83a4IGtONm3L7Ls
         qaxDHTD9tjyPXutf6RQmt4dQqg+y4UsDrlIJHycvJRo7rE7sKEy0kckXcPWlweHdtTsx
         ns/pwqbmyOcPwB4boe7OFR5/RPA6o11v3b6XuglTNjgFBBknu8elUH/HhYrRQXeFXfpL
         jTUA==
X-Gm-Message-State: APjAAAX59NRGt/Cd9Qo02+sEFM8mUIkxRnvdKbIoMeoIJvVYXAxzrDf4
        hqxH/ib78sqZSXETTroYo9DBbw==
X-Google-Smtp-Source: APXvYqxWj4RW/5Bk7AHjnHF/W7VHqk96YwJGSAMNrtEvaEZ6lz2Ds+BjrwBXQxmcbz0eS8CS+qsqjg==
X-Received: by 2002:aa7:96b6:: with SMTP id g22mr5878006pfk.206.1580618515603;
        Sat, 01 Feb 2020 20:41:55 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id q21sm15215761pff.105.2020.02.01.20.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2020 20:41:55 -0800 (PST)
Message-ID: <5e365313.1c69fb81.5bf81.9c29@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <2edca4b54ee6b33493e0427c17de983d3ce3012f.1580570160.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1580570160.git.saiprakash.ranjan@codeaurora.org> <2edca4b54ee6b33493e0427c17de983d3ce3012f.1580570160.git.saiprakash.ranjan@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCHv2 1/2] dt-bindings: watchdog: Convert QCOM watchdog timer bindings to YAML
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        devicetree@vger.kernel.org
Cc:     Douglas Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Sat, 01 Feb 2020 20:41:54 -0800
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Sai Prakash Ranjan (2020-02-01 07:29:48)
> Convert QCOM watchdog timer bindings to DT schema format using
> json-schema.
>=20
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

