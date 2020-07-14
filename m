Return-Path: <SRS0=HudI=AZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B541DC433E3
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jul 2020 09:19:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8F1E021D7B
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jul 2020 09:19:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UBKNvLHR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725952AbgGNJTJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Jul 2020 05:19:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725833AbgGNJTI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Jul 2020 05:19:08 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99E19C061755;
        Tue, 14 Jul 2020 02:19:08 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id f12so20760927eja.9;
        Tue, 14 Jul 2020 02:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6sYoADF+xHSS6gVhBGQyeKBftAyt8Lv88o36toQwdQc=;
        b=UBKNvLHRxlNtMpRes6h1l/Zj0HIUNZBtTa1nAXT180zbr56BhQVBGirrddyYd6ChcB
         LjDPvTtn2y8olXDIE5ZzNLicA5Eg5GUdsln0nMBWwyykuuMb4yjGw3ads85bvWPjlPSV
         iyznx1LqCz9h0KJsnKcCre4zldMTfhMqgN6fe1dyvN8VZnWE8odXbXQvz7o96Juf+5QN
         4b1362ktkyc9f23acBAZdIJgvnr3o60rCeaHVDnZGhAQ9nVINZBWKWy8MqbjVs1IuUD1
         OX2BkBYLp77NOzF9xASbPco8cN+eX0BhnPy67PddvRv/FYbgzmy5YXsYgpFbPC0QgALy
         nPfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6sYoADF+xHSS6gVhBGQyeKBftAyt8Lv88o36toQwdQc=;
        b=t0THg5ZprON0Z99bVQ+BoLNXR6F0amZgR4LZ8Rl09HYnubLZBgo6eoVisnaQbidsaH
         x/hxiF989ZlKHpgsNlVEpmJS20BavvwKA4p3aq1JQewDliYC1Lrt/vnuLwziqzsFvFK8
         wAmpWIb3xHXslj9exN7QDoFFKXOSWJjv27S+qJG7B87IcUSWMYa9Umls/tO/4DpFwpDi
         jzw8yC94XkhhqJDr0neaulk1UQl9euHiTZtwZ7BppSuLKAhmf/s5qcz/an0epo6PRB7K
         Kc6hjYxOZMLclviR7/sJnS/dBVd5qNPMY+dSASxozSvLoV5mqbrssgGd+FvTxx5+33B1
         kL+A==
X-Gm-Message-State: AOAM533BmuBBxuMlVPat3k/TjN4AHd70DCjkGTFD7aKNVyq7V/TB9I2G
        +kVdqntHfr4fOly6AWaGbco=
X-Google-Smtp-Source: ABdhPJx2I+e+YFG2G1Ke6Z5GHrt8zzY7DUb9JziweGF8j9tCD0HfRkoLQg3hYjhDDGqeZgDtHUD9YA==
X-Received: by 2002:a17:906:5657:: with SMTP id v23mr3767204ejr.196.1594718347405;
        Tue, 14 Jul 2020 02:19:07 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id p14sm14151699edr.23.2020.07.14.02.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 02:19:05 -0700 (PDT)
Date:   Tue, 14 Jul 2020 11:19:04 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: tegra: Populate VBUS for USB3 on Jetson TX2
Message-ID: <20200714091904.GE141356@ulmo>
References: <20200712102506.23686-1-jonathanh@nvidia.com>
 <20200712102506.23686-4-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="AsxXAMtlQ5JHofzM"
Content-Disposition: inline
In-Reply-To: <20200712102506.23686-4-jonathanh@nvidia.com>
User-Agent: Mutt/1.14.4 (2020-06-18)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--AsxXAMtlQ5JHofzM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 12, 2020 at 11:25:06AM +0100, Jon Hunter wrote:
> The VBUS for USB3 connector on the Jetson TX2 is connected to the
> vdd_usb1 supply and although this is populated for the USB2 port
> on the USB3 connector it is not populated for the USB3 port and
> causes the following warning to be seen on boot ...
>=20
>  usb3-0: supply vbus not found, using dummy regulator
>=20
> Fix this by also adding the VBUS supply to the USB3 port.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Thierry

--AsxXAMtlQ5JHofzM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl8NeIgACgkQ3SOs138+
s6HO2Q//S1t82eIqMY8wElaMo6K1sX8e87Y8KZeSxeZJ/xlX60QK4bLCBCxe1ZVJ
ZSlbS9+qta/I5n3JAv1RFUwQWXRqGB9Vyfjwif54RJaFZN0uwLz2q6uHHda8DhTo
p6YxTREj1lRR2eQiYVI6WTG9orXDaxhUlvCMKcvwNiAf4wkViJaX3/vCk3+vFpEi
/1TF19Us4bQvRcAxAnRpziqA9QFcz+zki9965dtRO830rQZBhlHr61i7hGI8RnwK
IvfKu22iq6Pqtmke/uVOs697GDwNST72DuEX5DZY+KA1X1MH77mmSzhXBkXGYVxI
GnrEnjw/KuuHKAbV6uA4ScKHlklmFjhQF+X7IKjaI9+3M4bAHMFUJBwvWY4wfDRi
5guHPjl3XxMR3/oqrtUcWKSS3IXRpNxfq6m8fzp3mTuRsoNgIBB9fkknM2bnGCN9
QQzs8enkuKq5qE+741CETQMx8+GxmD33VCU5GjjahBK5GGcsvwSaV5TwjC9dP+Pt
9g9lAYWELGE61BvwxwuvxPsgpGIr0Ll2M1WgW0mV2TqmSnkKVn6lujtd6KRt5Q/O
aK0S21yKFD5gyd+LVB10Bu6U6fGSwG3PNRa0F7RWk3NFTQ7r2jmf1AS0x/suz/eI
nAA2nOep8CwkxrbObLgD2KHtAsJzxu7BAxDe//bwnpNr39k2qLs=
=kgGu
-----END PGP SIGNATURE-----

--AsxXAMtlQ5JHofzM--
