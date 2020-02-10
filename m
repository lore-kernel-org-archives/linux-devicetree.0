Return-Path: <SRS0=E/bd=36=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98530C35254
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Feb 2020 19:41:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5FBC02085B
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Feb 2020 19:41:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="e9afxVCB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727433AbgBJTlS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 10 Feb 2020 14:41:18 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:43875 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727056AbgBJTlS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 10 Feb 2020 14:41:18 -0500
Received: by mail-pg1-f194.google.com with SMTP id u131so4429374pgc.10
        for <devicetree@vger.kernel.org>; Mon, 10 Feb 2020 11:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=7ivqNM+XNnF2NduI9XPvPsjcawkQDDIuJxxbUTZS70I=;
        b=e9afxVCBltANlhIP0TTphK41BACkirOo7MmnkUOHrwI8/ONL4gUNJW+/jlutjgIyTM
         m9iTPLTxC1GUGwK7rlEsp/ZfgE+POtAnN0+2wd/9XPHTH9R5VZ+NRsKBCVx9lYgoGZn9
         sZmgX4+usRBPoE8eCS2k/9rH0l4pzMF+f4BL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=7ivqNM+XNnF2NduI9XPvPsjcawkQDDIuJxxbUTZS70I=;
        b=Wa4FvagKRtZ9SdcXqDSc+d9wWQOIzWC64NeloYkrWNQNbgYqSC5BEgTzzVBRvHt8Mb
         YbjtswROdGKenVX6C6uR1W19V97hxcPTaJBtuB8PA/SLNE6XjYGNm/xzIGOZ1Hgc86EE
         Z+Mu6MVsHa//VQAyaaWHAAjD0e73HGOal96yTQF9sZeehU9NRwZkguAg2IoLhgjjQAlo
         YJjgzjf8Q33V65DfX9Zj5m1KoBIZHnYKt/1WB8iy7T43X68+bo0pRkfu6aCNbbH908bm
         YjEME7IIaXzK/BJNJ5WQw3fmGY8CFuTmJmvbT7uVMFBqaz2TVNqtwJ3ui6YFsWg8Os3+
         J3pw==
X-Gm-Message-State: APjAAAX1f4dFSWuS7O/FqQ4etAi/4CX8HD/0ATpcOJN4eBIfSzAkk9BM
        WxozydPjMhTHVZ3gJM43tMHYvA==
X-Google-Smtp-Source: APXvYqyL3xU2GxC0ppxiK1j1x5dqjfCDDqBmdVXIr+06LB0Gb7x6nvbyw6kgjLFqdzL7dOSmuxanxA==
X-Received: by 2002:a62:e91a:: with SMTP id j26mr2645081pfh.189.1581363677533;
        Mon, 10 Feb 2020 11:41:17 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id 199sm1276209pfv.81.2020.02.10.11.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 11:41:17 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1581081650-22228-1-git-send-email-sbhanu@codeaurora.org>
References: <1581081650-22228-1-git-send-email-sbhanu@codeaurora.org>
Subject: Re: [PATCH V2] mmc: sdhci-msm: Update system suspend/resume callbacks of sdhci-msm platform driver.
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     asutoshd@codeaurora.org, stummala@codeaurora.org,
        sayalil@codeaurora.org, cang@codeaurora.org,
        rampraka@codeaurora.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org,
        Shaik Sajida Bhanu <sbhanu@codeaurora.org>
To:     Shaik Sajida Bhanu <sbhanu@codeaurora.org>,
        adrian.hunter@intel.com, mka@chromium.org, robh+dt@kernel.org,
        ulf.hansson@linaro.org
Date:   Mon, 10 Feb 2020 11:41:16 -0800
Message-ID: <158136367603.121156.1867941302835915258@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Shaik Sajida Bhanu (2020-02-07 05:20:50)
> The existing suspend/resume callbacks of sdhci-msm driver are just
> gating/un-gating the clocks. During suspend cycle more can be done
> like disabling controller, interrupts and card detection.
>=20
> So updating the system pm callbacks for performing these extra
> actions besides controlling the clocks.
>=20
> Signed-off-by: Shaik Sajida Bhanu <sbhanu@codeaurora.org>
>=20
> Changes since V1:
>         Addressed review comments

Please don't write this. Instead, describe what's actually different so
the reader doesn't have to go figure out what the review comments were.

> ---
>  drivers/mmc/host/sdhci-msm.c | 50 ++++++++++++++++++++++++++++++++++++++=
++++--
>  1 file changed, 48 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index c3a160c..e30c8a3 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -2159,9 +2159,55 @@ static __maybe_unused int sdhci_msm_runtime_resume=
(struct device *dev)
>         return 0;
>  }
> =20
> +static int sdhci_msm_suspend(struct device *dev)
> +{
> +       struct sdhci_host *host =3D dev_get_drvdata(dev);
> +       struct sdhci_pltfm_host *pltfm_host =3D sdhci_priv(host);
> +       struct sdhci_msm_host *msm_host =3D sdhci_pltfm_priv(pltfm_host);
> +       int ret;
> +
> +       if (host->mmc->caps2 & MMC_CAP2_CQE) {
> +               ret =3D cqhci_suspend(host->mmc);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       ret =3D sdhci_suspend_host(host);
> +       if (ret)
> +               return ret;
> +       /* Disable pwr-irq since SDHC would be inactive */
> +       disable_irq(msm_host->pwr_irq);

Why do we need to do this? If it's inactive then the irq won't be raised
by the inactive hardware. Given that we're going to suspend the device,
the irq won't matter unless it's marked for wakeup. Please remove this
irq enable/disable logic, or explain why it's really needed.

> +
> +       return pm_runtime_force_suspend(dev);
> +}
> +
