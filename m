Return-Path: <SRS0=BM7I=BC=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAA5EC433E1
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jul 2020 16:33:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A4ECD207BB
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jul 2020 16:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595522023;
	bh=+YoF+u7eGjYIySOWzo/Bv6pU7qJ+t88s/pAvFJA9/ms=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=GVUihjYTOwHym0K7QyGVG5v7gQxE2awAsCXadehziZ88bP1+hcObXl/YTcq+tgn3y
	 YTml8EC/UqWaOlUTDhK8+asNU85tVV0Zcvu7d7Mqv7+M8AoIyDd4EAMMIjzjuqU2v7
	 g8IXoMImPq53HENvHRjBYqFbcvB2JCSmMPuA6eh4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726761AbgGWQdn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 23 Jul 2020 12:33:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:51380 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726621AbgGWQdm (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 23 Jul 2020 12:33:42 -0400
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown [163.114.132.5])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8457C206F4;
        Thu, 23 Jul 2020 16:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595522022;
        bh=+YoF+u7eGjYIySOWzo/Bv6pU7qJ+t88s/pAvFJA9/ms=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=wv/4QU9Xy8wnDkWO20mHhRsIPDiG0WkZr545biSg3hj9g0QgugyQQvFMoYhNTMJG/
         I5N5Wr4LnwglFWAjGczfM2GkyhQP001T3bxavM8afm17dNMPcO2+Xgxkay8qa0QMj1
         Jp74RIeJyTuvKdbMcLAuD+aajqppsTKJoJY1A0GY=
Date:   Thu, 23 Jul 2020 09:33:39 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Kurt Kanzenbach <kurt@linutronix.de>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Kamil Alkhouri <kamil.alkhouri@hs-offenburg.de>,
        ilias.apalodimas@linaro.org, Vladimir Oltean <olteanv@gmail.com>
Subject: Re: [PATCH v2 0/8] Hirschmann Hellcreek DSA driver
Message-ID: <20200723093339.7f2b6e27@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20200723081714.16005-1-kurt@linutronix.de>
References: <20200723081714.16005-1-kurt@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, 23 Jul 2020 10:17:06 +0200 Kurt Kanzenbach wrote:
> Hi,
>=20
> this series adds a DSA driver for the Hirschmann Hellcreek TSN switch
> IP. Characteristics of that IP:
>=20
>  * Full duplex Ethernet interface at 100/1000 Mbps on three ports
>  * IEEE 802.1Q-compliant Ethernet Switch
>  * IEEE 802.1Qbv Time-Aware scheduling support
>  * IEEE 1588 and IEEE 802.1AS support
>=20
> That IP is used e.g. in
>=20
>  https://www.arrow.com/en/campaigns/arrow-kairos
>=20
> Due to the hardware setup the switch driver is implemented using DSA. A s=
pecial
> tagging protocol is leveraged. Furthermore, this driver supports PTP, har=
dware
> timestamping and TAPRIO offloading.
>=20
> This work is part of the AccessTSN project: https://www.accesstsn.com/
>=20
> The previous versions can be found here:
>=20
>  * https://lkml.kernel.org/netdev/20200618064029.32168-1-kurt@linutronix.=
de/
>  * https://lkml.kernel.org/netdev/20200710113611.3398-1-kurt@linutronix.d=
e/
>=20
> This series depends on:
>=20
>  * https://lkml.kernel.org/netdev/20200723074946.14253-1-kurt@linutronix.=
de/
>=20
> Changes since v1:
>=20
>  * Code simplifications (Florian Fainelli, Vladimir Oltean)
>  * Fix issues with hellcreek.yaml bindings (Florian Fainelli)
>  * Clear reserved field in ptp v2 event messages (Richard Cochran)
>  * Make use of generic ptp parsing function (Richard Cochran, Vladimir Ol=
tean)
>  * Fix Kconfig (Florian Fainelli)
>  * Add tags (Florian Fainelli, Rob Herring, Richard Cochran)=20
>=20
> I didn't change the bridge/tagging setup, as I didn't find a better way t=
o do it.

Appears not to build:

drivers/net/dsa/hirschmann/hellcreek_hwtstamp.c: In function =E2=80=98hellc=
reek_get_reserved_field=E2=80=99:
drivers/net/dsa/hirschmann/hellcreek_hwtstamp.c:177:24: error: invalid use =
of undefined type =E2=80=98const struct ptp_header=E2=80=99
  177 |  return be32_to_cpu(hdr->reserved2);
      |                        ^~
