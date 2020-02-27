Return-Path: <SRS0=tkJE=4P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F2D3C3F2C4
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Feb 2020 21:53:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 44AE32469F
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Feb 2020 21:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582840418;
	bh=pE0iFAjtz0v62aQ2IQZkiSdXMpqZmipAhFJswD3P2DU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=LKyidHyQ5iw4ZXxrLSZxJKPvqaF+knBhq7AMzjHY8fEaO6oGr7MZRT/uROWnIDrYP
	 tRcAyv1r1vcT+FLNlWIGbakC2w92MH4ECORBes92VIIINrALpR98oxbZYydb+1ln2g
	 TJqqPzKprBkG/al0dvF+7rJ0muOaOy+bpgUUvi7Q=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730157AbgB0Vxh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 27 Feb 2020 16:53:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:36132 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729991AbgB0Vxh (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 27 Feb 2020 16:53:37 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0EA7B246A3;
        Thu, 27 Feb 2020 21:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582840417;
        bh=pE0iFAjtz0v62aQ2IQZkiSdXMpqZmipAhFJswD3P2DU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=iMCXKHAcjaj2YE6GGZfEH7d5VfBzv60Nev1FjVnxX8AlgttIQVPBzrnq8yPFFRFyl
         2SspFDzkR/jDztBEjjj97OsG31O2viOTanufQxhTdgZ8fslCQBJWgLJ7ehSF84krzq
         8a0ZlM1wrL7BTBoifwrZEQnOWYq9/w/WmfLQ4Des=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200227125615.4727-1-sibis@codeaurora.org>
References: <20200227125615.4727-1-sibis@codeaurora.org>
Subject: Re: [PATCH] soc: qcom: cmd-db: Fix compilation error when CMD_DB is disabled
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     georgi.djakov@linaro.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>
To:     Sibi Sankar <sibis@codeaurora.org>, agross@kernel.org,
        arnd@arndb.de, bjorn.andersson@linaro.org
Date:   Thu, 27 Feb 2020 13:53:36 -0800
Message-ID: <158284041627.4688.10612652730097090229@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Sibi Sankar (2020-02-27 04:56:15)
> If CONFIG_QCOM_COMMAND_DB=3Dn the following compilation errors will be
> seen. Fix this by including the appropriate linux headers.
>=20
> ./include/soc/qcom/cmd-db.h: In function \u2018cmd_db_read_aux_data\u2019:
> ./include/soc/qcom/cmd-db.h: error: implicit declaration of function \u20=
18ERR_PTR\u2019;
>=20
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
