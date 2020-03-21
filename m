Return-Path: <SRS0=1bdf=5G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53097C43333
	for <linux-devicetree@archiver.kernel.org>; Sat, 21 Mar 2020 01:25:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1787220752
	for <linux-devicetree@archiver.kernel.org>; Sat, 21 Mar 2020 01:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584753902;
	bh=5YHGDWKXcxMs3WiVI+ZdL/cNmSi1iXG0YAyAcs54hVw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=Af/bx7MMr06y31wE9YUs68JpZjQUEbQtE7zFUxzKFiqZs3LOo+GPFzmryBwhF1Kou
	 xL2Hx6K1hnLvAr+c3JwlUl3VFsUipDzEtSI7qxmBRA7Qe3pic/c/KneLJgdbk1msqG
	 3SKHopzSLZ/ajPTzKAm23jxtCCSFrhq7/HpdyHgo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727973AbgCUBZB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 20 Mar 2020 21:25:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:46006 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726773AbgCUBZA (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 20 Mar 2020 21:25:00 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 04BE820757;
        Sat, 21 Mar 2020 01:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584753900;
        bh=5YHGDWKXcxMs3WiVI+ZdL/cNmSi1iXG0YAyAcs54hVw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=WL+CPDRcthtrNthiPWAVJlr/e264I4mfTpgQ0IAKqT4gwsJ/wj9RZq7H0HsKKG/pX
         2IrfNOPbaDJm9gn8ShTdGovIVYIQ4F9x/imXmqRjUE9DIy7+nUKnB6BS/wXjrixzGB
         MHSZkb0NsAHz+i4x10j/42nrYTPRPPe4SGdfP4qQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200309194254.29009-9-lkundrak@v3.sk>
References: <20200309194254.29009-1-lkundrak@v3.sk> <20200309194254.29009-9-lkundrak@v3.sk>
Subject: Re: [PATCH v2 08/17] dt-bindings: marvell,mmp2: Add clock ids for MMP3 PLLs
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Lubomir Rintel <lkundrak@v3.sk>, Rob Herring <robh@kernel.org>
To:     Lubomir Rintel <lkundrak@v3.sk>
Date:   Fri, 20 Mar 2020 18:24:59 -0700
Message-ID: <158475389929.125146.15303542756865379794@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Lubomir Rintel (2020-03-09 12:42:45)
> MMP3 variant provides some more clocks. Add respective IDs.
>=20
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> Acked-by: Rob Herring <robh@kernel.org>
>=20
> ---

Applied to clk-next
