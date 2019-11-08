Return-Path: <SRS0=K2IH=ZA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CCCFFC6197
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 22:18:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 33DBA2178F
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 22:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573251524;
	bh=bU0RhP9Tukd8FTkIpTyvwRylYHLK6VBrDRHXYBub8Qw=;
	h=In-Reply-To:References:From:To:Cc:Subject:Date:List-ID:From;
	b=mllCU8S/PVVk/CwPXbGHa1QR10OBjAJFI7EINVJrnexudTQuPz3OUEGhsV1fPIu3C
	 2sN9BngQwZiL1cVHD+JkvC95HG9JY9OE3g8iDv9J0+/1szr2rd6s2WjXut3MqHiRgU
	 wXwXE/gcw1vJmt5HvFl5gcAca1lZa+he1CdqD7PQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730899AbfKHWSn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 8 Nov 2019 17:18:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:44850 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726095AbfKHWSn (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 8 Nov 2019 17:18:43 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2600820865;
        Fri,  8 Nov 2019 22:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573251523;
        bh=bU0RhP9Tukd8FTkIpTyvwRylYHLK6VBrDRHXYBub8Qw=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=ICcz5oBd6zOczoUqYAF5neJv9a+5ta0ghkw6r/JMbSBqdnolduccPls8wQueyWaIa
         YLDFBJo8Fr25pGpnk7tW8ZLvfuHp9lk2WpQ+becusbZOBgovoXjTHSmcD5LAtx/yLi
         0AsVd391R37syp3OPYwAs8e8q4F1SdpFLdx5BKOA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <2819678.zAmqMVPImI@ada>
References: <20190823100315.2148-1-ada@thorsis.com> <20190911174948.sblu4qn44sfh3cyy@pengutronix.de> <20190916201316.ED7EB20665@mail.kernel.org> <2819678.zAmqMVPImI@ada>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Alexander Dahl <ada@thorsis.com>, linux-clk@vger.kernel.org
Cc:     u.kleine-koenig@pengutronix.de,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH v2] dt-bindings: clk: Make example a bit clearer
User-Agent: alot/0.8.1
Date:   Fri, 08 Nov 2019 14:18:42 -0800
Message-Id: <20191108221843.2600820865@mail.kernel.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Alexander Dahl (2019-10-10 07:16:00)
>=20
> > If anything, I would clarify the description of
> > the example by indicating what parts of the example we're talking about
> > when explaining, i.e.
> >=20
> >       In this example the <&pll 2> clock is set as parent of the
> >       <&clkcon 0> clock because the first clock specifier in the
> >       assigned-clocks property is <&clkcon 0> and that matches the
> >       first clock specifier in the assigned-clock-parents property.
> >       Similarly the <&pll 2> clock is assigned a frequency value of
> >       460800 Hz because the second frequency in the
> >       assigned-clock-rates property is 460800 Hz and that matches the
> >       second clock specifier in the assigned-clocks property <&pll 2>.
>=20
> I could go with that and send a v3 with the obfuscation from above (I'd l=
ike=20
> to keep that) and this paragraph of yours?
>=20

Sure. Please resend.

