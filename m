Return-Path: <SRS0=21hy=4I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4711AC5ACC4
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Feb 2020 02:30:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 099EF24656
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Feb 2020 02:30:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Hp///StS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727695AbgBTCaw (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 19 Feb 2020 21:30:52 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:45922 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727211AbgBTCaw (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 19 Feb 2020 21:30:52 -0500
Received: by mail-pf1-f195.google.com with SMTP id 2so1103839pfg.12
        for <devicetree@vger.kernel.org>; Wed, 19 Feb 2020 18:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=2xhrwQviTomzj/0fU6jHXjC8RaazAr+9nr9rIvva37U=;
        b=Hp///StSFNDmabhiBJZofs78699fSOAHSNe6zLrXA7M2hyLOxa3a0Ygi6HVn5lETmu
         /HoY2FjCYrlBjYcn9uvUP+uC43wI9zgb67Hknh2mVyjfTr5GGw3llqw8UNeOQhQhOMKS
         3//sWtboNU2F5iAQLTkzRMmiRTvJ3k/F9YU3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=2xhrwQviTomzj/0fU6jHXjC8RaazAr+9nr9rIvva37U=;
        b=Vjmu0UbHf/r0Q+M2w+YVqHoM4URFtkVKSZ/ivzxipB6zpzMrff9HFM7Y2gQvg+6Xhx
         2lpQN/LQ5iebtopnmwdS1P0Ia1EHCzz2B4RpO/4w2Kh0r13yb/t+IZ0KsHONMR7tZzzO
         IkjLmGoq9rxgsbKHSSfF9UznvJxDpckYpnCJoD0L4rim2Ew49s9ewLPjCQI7hpSqJPqs
         +VG5kKFXiROwapWutgaHKr+W2ObMnPfF1ZFqJL9SMbt4/7IWYBmsTkCLQ4HMA7HNIXPZ
         D4E7i4uzv+rlxGOQ0qsxo7XTvseCqB36xwczOZ3oxrj31zYyhkqUpJgvxDI6FA1/+gyQ
         q+xA==
X-Gm-Message-State: APjAAAWYbOof3jYuEqnUaizscqiSbrO23000WByCmUhKYvxSBi9WAYHp
        myU5lby7jG2S9CRtt4myNi0DwQ==
X-Google-Smtp-Source: APXvYqyqR/j5YTlyk7mPPllz5VnOKlmRZem93IGnshNp2h/Zrxs8wbPD10c413ZLvO8K7rxkd709fg==
X-Received: by 2002:a63:e218:: with SMTP id q24mr4515412pgh.244.1582165851831;
        Wed, 19 Feb 2020 18:30:51 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id b186sm389624pgc.46.2020.02.19.18.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 18:30:51 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1581932974-21654-3-git-send-email-akashast@codeaurora.org>
References: <1581932974-21654-1-git-send-email-akashast@codeaurora.org> <1581932974-21654-3-git-send-email-akashast@codeaurora.org>
Subject: Re: [PATCH 2/2] dt-bindings: spi: Add interconnect binding for QSPI
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mgautam@codeaurora.org,
        rojay@codeaurora.org, skakit@codeaurora.org,
        Akash Asthana <akashast@codeaurora.org>
To:     Akash Asthana <akashast@codeaurora.org>, agross@kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org
Date:   Wed, 19 Feb 2020 18:30:50 -0800
Message-ID: <158216585051.184098.12834695664812457422@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Akash Asthana (2020-02-17 01:49:34)
> Add documentation for the interconnect and interconnect-names
> properties for QSPI.
>=20
> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
