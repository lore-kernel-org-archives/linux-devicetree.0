Return-Path: <SRS0=vtql=4W=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80BF2C3F2D1
	for <linux-devicetree@archiver.kernel.org>; Thu,  5 Mar 2020 21:54:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5932421739
	for <linux-devicetree@archiver.kernel.org>; Thu,  5 Mar 2020 21:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583445277;
	bh=JbojQ6Iimsw9BhuI4/ixe0CObt3ZFYXUINHCOEVPI0Q=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=0ORGuBTe11BszAsIJ3KvCbcHWUthbmJ8No8SMa8ddbyVABYZrjUzoEE0I4pnMomfZ
	 sFE5PaigSoUf7CeOo6c8rdcVNg4BdqYSmJNcVo2zO2ei4WhmNY5N/LdxkYwlJ2MTxK
	 FgMdUMy4xAIj0tbWWG3/fDk6fiIsdXW8duxu+f/I=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726179AbgCEVyg (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 5 Mar 2020 16:54:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:45998 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726143AbgCEVyg (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 5 Mar 2020 16:54:36 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F256B20848;
        Thu,  5 Mar 2020 21:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583445276;
        bh=JbojQ6Iimsw9BhuI4/ixe0CObt3ZFYXUINHCOEVPI0Q=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=yIYtfkSdiXFSHpuXO3W7zO3r66pg0W7g6qZSgRPijLi/GS+DdqSfOZi+sqtNu4fdS
         hJgQnBrCqLMsUfAy7j1QLyvKANq6/P4WkzGJg4eTz2XZsDJNMgWe6TMWsrBv1Wdk0q
         QdjocS1dWcsFlMiHNECyTTq/nz1Br56KbMq+duhc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200303094848.23670-1-geert+renesas@glider.be>
References: <20200303094848.23670-1-geert+renesas@glider.be>
Subject: Re: [PATCH v2] dt-bindings: clock: renesas: cpg-mssr: Convert to json-schema
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Thu, 05 Mar 2020 13:54:35 -0800
Message-ID: <158344527518.25912.34270653410245340@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Geert Uytterhoeven (2020-03-03 01:48:48)
> Convert the Renesas Clock Pulse Generator / Module Standby and Software
> Reset Device Tree binding documentation to json-schema.
>=20
> Note that #reset-cells was incorrecty marked a required property for
> RZ/A2 before.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
