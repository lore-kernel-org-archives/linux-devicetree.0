Return-Path: <SRS0=iTj2=B4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D230C433E4
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Aug 2020 07:51:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C9F852067C
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Aug 2020 07:51:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gIeO4zbt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbgHRHvq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 18 Aug 2020 03:51:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726391AbgHRHvp (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 18 Aug 2020 03:51:45 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B6A1C061389
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2020 00:51:45 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id g8so15374802wmk.3
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2020 00:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=2hez8cMOHm4MHzr6nKQb7EhEiKFqllAfu4DLeZkHauM=;
        b=gIeO4zbtImu6zQZr18l+65t4Ccann9erqT18Erx9tFwDBwRM2wX9XJGk8gtrhA5Uyq
         TnU/TrxGj+A2bT0yvAtlgMR5d6qdeFpk/JhzPxH22I3IKEO3GRBS5P+c/2yHRFoA/U58
         rpuky+ij8r/M2WEV2Zahi+eY6bRhO2HMcCYQI4t56IyxM0/yYElHqeXG0pVRa/f9dRFa
         2UdrGJTSw3U4KbDAwtrS47Vz9p7HZ4pSdDEfVg8f9pDM4Vz0evb3ZPweXfNuzlj7s5Qb
         7cQhtwiQ1KaSB214sjB3yMVke86b0s7b0UW+IojE/6AEA4pciwvn4RivqoG9CerXmDL1
         n7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=2hez8cMOHm4MHzr6nKQb7EhEiKFqllAfu4DLeZkHauM=;
        b=rcIirNQs1nYn4KK1m6lof8kf3IsIY7JR96B2eA9r9zDb4eigCxSz3FHm7cjSuSjibc
         jXSnwi+b6JfbWcLhFJOvYsJqUo9EIyQxpFTanroOkYMwW/nI7966i+WsB1c1h5sCs1ZK
         nK3Dd9S+JJ1CLrXCWj4x4qKFOrOliaTEpXKgVqE8b6EW2p4zKOogs9Sj/DWQGEmnCP60
         yQkrNlwNX7gbRo5wxw1jT20cqLUtnws90pFdyAVLuXjSF+u93CTP40DBYh4I2CQAX/NP
         PvHm0SbBaPLH92r+PT92knTtmtqMPPOmymuZVlKZp5Uwc1KmY6bBYu2EeiHhxSBpgay7
         faXA==
X-Gm-Message-State: AOAM531f0JnPiz/Jh/B2WpgcEASc80tfjskIjxMUxRni3DtkQKGI6X+r
        MTqEGRiBFTQiNRIxQOFWu44=
X-Google-Smtp-Source: ABdhPJxWkppe7p4ENX4OrSeu+TJITQSE7fitTOnZmX8ICazVcUENCsw4cSRJoxRUXl1aHa5XMmsI6g==
X-Received: by 2002:a05:600c:2189:: with SMTP id e9mr19126215wme.171.1597737102234;
        Tue, 18 Aug 2020 00:51:42 -0700 (PDT)
Received: from [172.16.20.20] ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id p6sm31305349wmg.0.2020.08.18.00.51.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Aug 2020 00:51:41 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.15\))
Subject: Re: [PATCH v2 2/3] arm64: dts: meson-g12b-odroid-n2: Disable virtual
 RTC driver
From:   Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <1jzh6se6te.fsf@starbuckisacylon.baylibre.com>
Date:   Tue, 18 Aug 2020 11:51:38 +0400
Cc:     Anand Moon <linux.amoon@gmail.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <6B583170-3479-4DFB-B81A-431B5982C8D6@gmail.com>
References: <20200817102122.434-1-linux.amoon@gmail.com>
 <20200817102122.434-3-linux.amoon@gmail.com>
 <1jzh6se6te.fsf@starbuckisacylon.baylibre.com>
To:     Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: Apple Mail (2.3445.104.15)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



> On 18 Aug 2020, at 11:45 am, Jerome Brunet <jbrunet@baylibre.com> =
wrote:
>=20
>=20
> On Mon 17 Aug 2020 at 12:21, Anand Moon <linux.amoon@gmail.com> wrote:
>=20
>> Disable virtual RTC node on Odroid N2,
>> since RTC PCF8563 support rtc wakeup.
>>=20
>> [    7.171149] meson-vrtc ff8000a8.rtc: registered as rtc0
>> [    7.182875] meson-vrtc ff8000a8.rtc: setting system clock to =
1970-01-01T00:00:07 UTC (7)
>>=20
>=20
> Maybe I'm missing something but why should disable this ?
> Can't the 2 RTCs co-exist ?

aliases {
	serial0 =3D &uart_AO;
	ethernet0 =3D &ethmac;
	rtc1 =3D &vrtc;
};

^ adding this alias moves vrtc to /dev/rtc1 allowing the on-board rtc to
assume /dev/rtc0 which scripts/users and HOWTO guides assume to be a
real clock device. Tested and working fine with my own experiments with
enabling rtc on a bunch of G12B/SM1 boards.

Christian=
