Return-Path: <SRS0=GOr1=2C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1A22C43603
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 08:06:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 84096214D8
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 08:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576137968;
	bh=HoR/BLFtmwi38GLpSsDPB8K0R+D4dcvK56fVCK0tR7s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-ID:From;
	b=XzP9n9uDN5Hp8MPnUJuzfKS7QD0qKTF79/Upmem5RLxkT3DLtMXESP4c5nqOQxFRP
	 GQx17KHGZg3vGU3ZebFFS3DC8oYxZHKeQW9mUWpjtEd08UBNLZl2LjEv87Pwrr2VEI
	 OBnw7HqMdC13tvgdQl3q6MYbtwYpskYVkg4M4F7k=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728151AbfLLIGI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 12 Dec 2019 03:06:08 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:45845 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728147AbfLLIGH (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 12 Dec 2019 03:06:07 -0500
Received: by mail-lj1-f196.google.com with SMTP id d20so1162777ljc.12;
        Thu, 12 Dec 2019 00:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=39HIJuHZ8Kr9jnNgUEG20ZXIWXqKC42ITM1S74AQ/bk=;
        b=uAJFSqU/HRXk2CC1kQ6ezwrvIfqBnZPl+AJwS8ygQnZQcNY20grUpZAGjGEoW72EEl
         AZC+0Y22X35tHHC7iW3GqPQpVkWN02fbxQQMO6zenfTYAlzbAtCMFVsAMv8mbTtN0w54
         rQFug/KOvrGE5M2+KkWVH+Y6ZE3RPZCRN3UqhDnPjaMi/LPnk525U+A1FO4MUjvyrR71
         kCVYORgiL5I2biPOsoS7uKhz8F4fO9dVS0ilrpC8U3wAM9yIcYY/0HrnlB/4zgaYjTLF
         kRoY+W+1VyWvafGVdRZy7qiIxGLK382bgr+5jLYKdcoz5HThpG49K1T/1vSVzojofVoj
         9XUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=39HIJuHZ8Kr9jnNgUEG20ZXIWXqKC42ITM1S74AQ/bk=;
        b=IHt2iLcZroJ8PrUDUxwh9Gc7s1X3Rbsf8/48kw19ez1PbCE6tO+pddaxHadhk1g92i
         3T8PsNpdfyz+QZ1NO8Vlw/CWwi+UuBwtUXdE/Z89Q/TE63cPboJXzrZ45Re690qfYLnx
         Iv/TwLSTsz7VJx0CdjVCBL++FLj+mTEU4IumSOyyHdryJbSM5bjSvwzuFYQaKsxDNgU2
         5lqcATdgUmZAeSzx/zX5EesJ/g5tvY+46OzqwdLc/J3nmWZmrxVOMQCl6SwTOCYQ4vmr
         O6OQLDvRl6Pxwn6GXf9yHMsg1AHmMLDaO+krc7qAvTNMvOKsAUGaLqHFYsY+mddXQviV
         Hljw==
X-Gm-Message-State: APjAAAWsv3KCFxCqGxvnUKAS4oQ4e89W3lGn2nlZo+3m1h2gNe1OjZUF
        33zX+qbPfnVNV/D0+KArcupQzxVPupq3mw==
X-Google-Smtp-Source: APXvYqwixWwRIYU8AcBc8/Id3rU4oUKuVgvXy/a/NwKBNmqYzefpOSVS9rpZTuumKCjAKc6s3Hr5Zw==
X-Received: by 2002:a2e:b4e7:: with SMTP id s7mr4506318ljm.58.1576137965388;
        Thu, 12 Dec 2019 00:06:05 -0800 (PST)
Received: from saruman (88-113-215-33.elisa-laajakaista.fi. [88.113.215.33])
        by smtp.gmail.com with ESMTPSA id p26sm2475840lfh.64.2019.12.12.00.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2019 00:06:02 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     John Youn <John.Youn@synopsys.com>
Subject: Re: [RFC PATCH 06/14] usb: devicetree: dwc3: Add max lane and lsm
In-Reply-To: <aa9816c1efcdd492d698b421a94f0771961f414e.1576118671.git.thinhn@synopsys.com>
References: <cover.1576118671.git.thinhn@synopsys.com> <aa9816c1efcdd492d698b421a94f0771961f414e.1576118671.git.thinhn@synopsys.com>
Date:   Thu, 12 Dec 2019 10:06:46 +0200
Message-ID: <87v9qmvug9.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:

> Add a new property to set maximum number of lanes and transfer rated
                                                                 ^^^^^
                                                                 rate?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl3x9RYACgkQzL64meEa
mQZtThAAo+OMckopLC49s+9B+5LJYr9HUklgDOWNbS5sNhH3DQOoWAC+n4SDv3CN
ml/iHID4obiOBVFaCHqAZj6DRvUBffA12Nv6K7wbaG7GQfmo/iGvpCHl1kSFqH5+
WZXDOMA5yunAxZ5p7I+8314mM188qwCtTbrhWJXdnUq8Ft1TFon1BDVUt9pnSUpx
1tWsbfS1ZT8WFEhf6vSqrnktidJufvTpZF4F0skecsF7CDLIsyxko8Q8D2+46Ya/
CvPf+oFn5DnYvTNQton9MW/TCCduv9twqP+1LaIFASbxqnHXIZetPNfQ8qIkDEDg
Km2Dp+PBtHJl9mCptXODk/onXQkMbSj0U3jsMGtbHC+tXs3zDu0FRy4/mVjCRirJ
h0tshMeXDLksM3wN33LWWaExsipqZu8zEAinCuY2RJ+zZZ3zQ2N2TJSZSzt2X/Hf
n/O/cBZbPykJYMXfrSJucOVvryPqQM4Y3sGSe49q+4HQwQ61wXFwccuTY+Nnfy1y
w8HNOCLA4ybba65Z5nceZvwwcw4+rqtk9teCAlEy6jyOUA0zcc9ksw2pUvOHsWUK
G0EUiCjaS/VCvq715SCP3qxa+Mcjw0Cu0/PyuB2QyOWDFs4z3Oin3G2g/pRT2Uk9
nA17AlxjtclHN0jTRWR20RLS1LK51KZ4UWaJXBX4hnBigC+QOEY=
=p3RT
-----END PGP SIGNATURE-----
--=-=-=--
