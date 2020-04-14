Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38012C38A29
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 15:16:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 10C162076B
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 15:16:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iozrSE+O"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407058AbgDNPFt (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 11:05:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406988AbgDNPFU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Apr 2020 11:05:20 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CD40C061A0C;
        Tue, 14 Apr 2020 08:05:20 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id h26so3313364wrb.7;
        Tue, 14 Apr 2020 08:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=GRU+kcgoobFtz4hoc9alUDOZ5JZB4eIWqC87J2PCXRk=;
        b=iozrSE+ODjo7phmX5XfdlosqNbo3t0TMdHpJDlWfJjQxD2Be7dmyGsm7HEJ6G8eywm
         PmFTKHyhBUEbIY5HJdcE15H4TP5fottCSv3hxGVeLOnSe16rwy/HSbKHNBRUi/OomcMz
         FBDzQC+XGB7EmSd9xYEoOz5agEmD3EnjI3bkJToa+FaYB+yMQ7cFPBncjRIhhd+XxYRK
         nrPNWSzXfJPuW5FtyYjIH94QRZKewR/7LFug3ZxX4wRne1OkwKj6x6dm4I1zyuj4J+is
         LXupCb2NXql0fFVUnWwXlteqAoLQ1uyICAqX/o2VfgWau7PVCynypm8Uwwla/2ztowYu
         ggHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GRU+kcgoobFtz4hoc9alUDOZ5JZB4eIWqC87J2PCXRk=;
        b=SsNIaL7CnrZ2uviQ3CvygYgmsb6ibI05excrhFu1lTvS/nYD77luz1b3D5KHPSj6d0
         yt5H1KpuP+LtRU8xooq0/99Zq19UDAmhKNBECLsebrtZrFcHAS2ggWjOqdmVJ6xThN5V
         zL2MukpoAwaZAoqDMGV3mhfSvnWyaxom6r/1+Gy2rtBi+HzwO+3gmyZkfsOIweksPe+B
         aubG3+mbk7cUy75tf79/tjCz8JklH5OcRga2aYsadb7Ey/rokYJa3ruN5ao6rfKO02wT
         aZY2SwSC+0nLcIp6nFH+16oQUklzOI0zYQjAewDTqExDDsjHtAspWMJuZ4XVxHCHJYf1
         VKBQ==
X-Gm-Message-State: AGi0PuZjFCQapImpSDBNRxqdSzhBYYK+IhR/YLEtSQQv9ZqmGesbp81u
        DYZCKB08dVTcw9CYxIYpJZA=
X-Google-Smtp-Source: APiQypJRZriRxHLKGFufZX51wCytt4lINIlsGHllnqqM/+6Wbga72x1sO/I+opanZVnZSJ1d8zqA6A==
X-Received: by 2002:a05:6000:1287:: with SMTP id f7mr8495019wrx.345.1586876718789;
        Tue, 14 Apr 2020 08:05:18 -0700 (PDT)
Received: from localhost (pD9E51D62.dip0.t-ipconnect.de. [217.229.29.98])
        by smtp.gmail.com with ESMTPSA id g74sm19229868wme.44.2020.04.14.08.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 08:05:17 -0700 (PDT)
Date:   Tue, 14 Apr 2020 17:05:16 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 09/14] memory: tegra: Add EMC scaling support code for
 Tegra210
Message-ID: <20200414150516.GL3593749@ulmo>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-10-thierry.reding@gmail.com>
 <3e518dfa-cb3d-e2ce-a9b8-5e143e02fc61@gmail.com>
 <6976796c-6972-328e-3e9f-60c1737cf0e2@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Ms5iOKSBOB9YS8zC"
Content-Disposition: inline
In-Reply-To: <6976796c-6972-328e-3e9f-60c1737cf0e2@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--Ms5iOKSBOB9YS8zC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 11, 2020 at 11:39:08PM +0300, Dmitry Osipenko wrote:
> > ...
> >> +#define TRIM_REG(chan, rank, reg, byte)					\
> >> +	(((EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ## rank ## _ ## reg ##	\
> >> +	   _OB_DDLL_LONG_DQ_RANK ## rank ## _BYTE ## byte ## _MASK &	\
> >> +	   next->trim_regs[EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ##		\
> >> +				 rank ## _ ## reg ## _INDEX]) >>	\
> >> +	  EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ## rank ## _ ## reg ##	\
> >> +	  _OB_DDLL_LONG_DQ_RANK ## rank ## _BYTE ## byte ## _SHIFT)	\
> >> +	 +								\
> >> +	 (((EMC_DATA_BRLSHFT_ ## rank ## _RANK ## rank ## _BYTE ##	\
> >> +	    byte ## _DATA_BRLSHFT_MASK &				\
> >> +	    next->trim_perch_regs[EMC ## chan ##			\
> >> +			      _EMC_DATA_BRLSHFT_ ## rank ## _INDEX]) >>	\
> >> +	   EMC_DATA_BRLSHFT_ ## rank ## _RANK ## rank ## _BYTE ##	\
> >> +	   byte ## _DATA_BRLSHFT_SHIFT) * 64))
> >> +
> >> +#define CALC_TEMP(rank, reg, byte1, byte2, n)				\
> >> +	(((new[n] << EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ## rank ## _ ##	\
> >> +	   reg ## _OB_DDLL_LONG_DQ_RANK ## rank ## _BYTE ## byte1 ## _SHIFT)=
 & \
> >> +	  EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ## rank ## _ ## reg ##	\
> >> +	  _OB_DDLL_LONG_DQ_RANK ## rank ## _BYTE ## byte1 ## _MASK)	\
> >> +	 |								\
> >> +	 ((new[n + 1] << EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ## rank ## _ ##\
> >> +	   reg ## _OB_DDLL_LONG_DQ_RANK ## rank ## _BYTE ## byte2 ## _SHIFT)=
 & \
> >> +	  EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ## rank ## _ ## reg ##	\
> >> +	  _OB_DDLL_LONG_DQ_RANK ## rank ## _BYTE ## byte2 ## _MASK))
>=20
> What about replacing those barely readable concatenated macros with a
> raw values?
>=20
> Like:
>=20
> TRIM_REG(brlshft_idx, ob_ddll_long_dq_rank_mask, ...)

That's just going to move the complexity from the macros to the
callsites, isn't it?

I suppose I could spend a few cycles trying to make this a little more
readable, but to be frank, the complexity in this driver is already so
high that this doesn't really make much of a difference, in my opinion.

Thierry

--Ms5iOKSBOB9YS8zC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6V0SwACgkQ3SOs138+
s6Ef9w//fxlmCh7FtrH73REQqtD+jRwwLCO5WMC+EHjBY4EUR5lv5mZnrA0uIaBc
FNV4X8OExlN0dMsbYdRTp9CJO7Q8IPggLgaGJQOrR55cT+K8EUXhUPuRPyt83PNY
2x5zUNxRJzxmVqH8OUrknejB/2bedly4MvLNz2rDo9orQVzGRCW05kl9sQmLTl+k
ieyYqweSPPRMw/tgomH2tAz5SaQqnXvv6OK/7JD0Ic9eFBjm2R526wNThK5Tmmzm
jpKuyQv6tksZ5QqLouZHvJIBxN54gF55p57v5SY1LFoj+8Aas1GtdbO9ioKvM86L
OveTWkfYxQUHMDITXcpvnCP3UJOWygeuqxb1azRphChylfgtcppQN/od2ms0AJ0t
femDyT/oDOUbNtwau0hUpckUD3Iag0IkBxu5RKa0aOzQwtxqy0uAL1Oi6qbmYJnN
gzy0PfSnDJqUsIuVxt+S1fKZwnMsCFeGvvqe8IH04drmxLbg1z3OqbCJeBV3xNyg
mK1tsOoFIBnr8nf7ZHODgp5etjxFofaSHV5Ox8oFhNutC+hpmLi5/rQ90P5Jxu/L
3qUkOEGo+MzCMXiUEgJmKjWFLdTxlAQxH3Kq8KnjaedTBgU9NVKvJr97aTWMo/NI
hq9dUvpBJcU01rW0hwcuoeEFOO0ntQo4RzH9ugOBZLQ/Wx1/24A=
=ktP9
-----END PGP SIGNATURE-----

--Ms5iOKSBOB9YS8zC--
