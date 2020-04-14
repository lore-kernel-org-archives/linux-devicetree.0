Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06378C38A29
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 15:02:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DA56B20768
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 15:02:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gxQ2m3DR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405587AbgDNPC2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 11:02:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405562AbgDNPCX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Apr 2020 11:02:23 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9F04C061A0C;
        Tue, 14 Apr 2020 08:02:22 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id a25so14727343wrd.0;
        Tue, 14 Apr 2020 08:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ViI/byXYkNTTv5WozqHMnLuUZ5EboqYJdzyRMLlG4+I=;
        b=gxQ2m3DRGB6KjDN+/gGk/ABqsAvAFy8Q4jvwgUUVnBmQQPs22L+air6X+vbNaFjrG+
         m4BazoDB9Mb8bLYUOVCrdxHbqQ1y4dzM+Pr66Ieb/1Zo6Cp8blP2LKu60alUspymuN4K
         DsLEmtbTiR1f/OzFQAx/TLHlzhaWdB7AwFV7w3JSqpxXeAItCpkfm7mQ/16goxGzsmfe
         E3A5W7R1FJTkBvUdq2JHuj/VvWZcGiu7gmL99+jvy3TFxDmMzqdpww2yxXj2qjxCPqxv
         3XBMMFkQ6IJErv8H8BBWoxmdMJY+y2cihEFkFyLkZiQECDZvXuA4odCeXWYUMHqvywvv
         QU2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ViI/byXYkNTTv5WozqHMnLuUZ5EboqYJdzyRMLlG4+I=;
        b=PG1yPavt5QCPQ/U/Wp+FUMK1mjUpFRrYv4qhFl/5ObKvuEOpa5KzSxJzkWDeIMx8yD
         j7W1B6RdWfzH2+wpndP8JY4Yib7l9+YAN4zfVcInSPJWpsqDnvglUcixAGKk14/XYwec
         8HsW/uc3ySbJhQDYROkgL+lXPiTDNdGqRKUdp5YbQiWtxV98rw69DM0TYfHPk6HTSMPQ
         +HcjSqdaKOdXWNucBRRLR0HdvUiJeWAlQ9Tw10m59IXwEYlACs8+dgqhqmo4ctxr0CGF
         3o9n20ec4/LmTsNrCpAAuwTKVLTuAAB3EVEdz2R0gUn4yYDRof474410Jm8JWzNz3rUZ
         jeOQ==
X-Gm-Message-State: AGi0PuZKRI9AzvKL14z+reY5rKHa2XMpQwYjK0QC53HOEKdL9CFg+cIC
        AkLMdlrf2Gm3BZQ3ngNxQZ0=
X-Google-Smtp-Source: APiQypK4+NIRYHEoApUJZAfNPlDoh2Xh3fKIbelUsv2sesJnlhQa+MjZoKcEwDhkrZyCCyBsPmqPEQ==
X-Received: by 2002:adf:8149:: with SMTP id 67mr25052146wrm.60.1586876541371;
        Tue, 14 Apr 2020 08:02:21 -0700 (PDT)
Received: from localhost (pD9E51D62.dip0.t-ipconnect.de. [217.229.29.98])
        by smtp.gmail.com with ESMTPSA id y9sm18508247wmm.26.2020.04.14.08.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 08:02:20 -0700 (PDT)
Date:   Tue, 14 Apr 2020 17:02:19 +0200
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
Message-ID: <20200414150219.GK3593749@ulmo>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-10-thierry.reding@gmail.com>
 <3e518dfa-cb3d-e2ce-a9b8-5e143e02fc61@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fLj60tP2PZ34xyqD"
Content-Disposition: inline
In-Reply-To: <3e518dfa-cb3d-e2ce-a9b8-5e143e02fc61@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--fLj60tP2PZ34xyqD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2020 at 02:56:53AM +0300, Dmitry Osipenko wrote:
> 09.04.2020 20:52, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
> > +#define CLK_RST_CONTROLLER_CLK_SOURCE_EMC		0x19c
> ...
> > +#define CLK_RST_CONTROLLER_CLK_SOURCE_EMC_DLL		0x664
>=20
> I'd suggest to double check all the macros and remove everything unused,
> to not pollute the code.

I recall checking most of these, but I'll make another pass to see if I
can spot more that I can drop.

> ...
> > +#define TRIM_REG(chan, rank, reg, byte)					\
> > +	(((EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ## rank ## _ ## reg ##	\
> > +	   _OB_DDLL_LONG_DQ_RANK ## rank ## _BYTE ## byte ## _MASK &	\
> > +	   next->trim_regs[EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ##		\
> > +				 rank ## _ ## reg ## _INDEX]) >>	\
> > +	  EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ## rank ## _ ## reg ##	\
> > +	  _OB_DDLL_LONG_DQ_RANK ## rank ## _BYTE ## byte ## _SHIFT)	\
> > +	 +								\
> > +	 (((EMC_DATA_BRLSHFT_ ## rank ## _RANK ## rank ## _BYTE ##	\
> > +	    byte ## _DATA_BRLSHFT_MASK &				\
> > +	    next->trim_perch_regs[EMC ## chan ##			\
> > +			      _EMC_DATA_BRLSHFT_ ## rank ## _INDEX]) >>	\
> > +	   EMC_DATA_BRLSHFT_ ## rank ## _RANK ## rank ## _BYTE ##	\
> > +	   byte ## _DATA_BRLSHFT_SHIFT) * 64))
> > +
> > +#define CALC_TEMP(rank, reg, byte1, byte2, n)				\
> > +	(((new[n] << EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ## rank ## _ ##	\
> > +	   reg ## _OB_DDLL_LONG_DQ_RANK ## rank ## _BYTE ## byte1 ## _SHIFT) =
& \
> > +	  EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ## rank ## _ ## reg ##	\
> > +	  _OB_DDLL_LONG_DQ_RANK ## rank ## _BYTE ## byte1 ## _MASK)	\
> > +	 |								\
> > +	 ((new[n + 1] << EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ## rank ## _ ##\
> > +	   reg ## _OB_DDLL_LONG_DQ_RANK ## rank ## _BYTE ## byte2 ## _SHIFT) =
& \
> > +	  EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ## rank ## _ ## reg ##	\
> > +	  _OB_DDLL_LONG_DQ_RANK ## rank ## _BYTE ## byte2 ## _MASK))
>=20
> My eyes.. :P

Heh... yes, this is pretty bad. At least the code at the callsites is
clean.

Thierry

--fLj60tP2PZ34xyqD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6V0HsACgkQ3SOs138+
s6FXCg/7B0bMQSGWtJXVBNJfMTn8M0O+JF56fTgGvLoz+9OjrduZ3flJ5t1MVTvp
o+MoMG4zK2JjlnMcMLG5o/6hSbLU0kAKJ7BlHbwgV252liWGABe3h0xV8923aWRi
vbm8f1v9sab2U/KJGUdZxeSZ9NfrVzCzGzBlZmynLF6fKhnymS1usyKChKqwlvv2
PZAZKF4hNDizXxy1ZpmSJHoZRsZ94qSj2NuAvLxMjx0Hmv6jJ8D7AZuY/GKeCZPN
ByuGMahGXXaE8JaOzgxsfHx0TEC1hKb4Y017xgHpZzMU50ck4eqFJb/nHXBVddPH
KjYmaDzYIfSqtYRrmPVmloUBVjb9Y1EDspe+5TbQvpSwSLjNFPeM0z5dZXrZU4w0
W4bvghLzaZvgvC9thmTZur7QTcOOco3BRTIxv8hzA/2FO/oWX9p1CGbR6Ddsg/ly
SzhUu5CUKCrKdob6YRTpfT+5CN+zCzR7dt+XJ2LcR1lg0UnCCMnmyf2kJUNdkwZp
lWQQTm4pFrHNRv0a8DNN6ma4fK0yyS//7bJQVM/sGJZ8hnloT6skT8hUyfre9d9f
AzpQypnVyqMv2PTFYthPYkF6CaLHHgE/NU4yUyQHyNIBCQT4OHZZZXBlS42azM10
6/79zjdxTiIR6C0mHgIWY6kgTNiL7RiU9ctwpI9vnCrp+YzPfy0=
=SSdO
-----END PGP SIGNATURE-----

--fLj60tP2PZ34xyqD--
