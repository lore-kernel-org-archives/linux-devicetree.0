Return-Path: <SRS0=QtGe=7R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE15DC433DF
	for <linux-devicetree@archiver.kernel.org>; Thu,  4 Jun 2020 04:40:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BBCBF2074B
	for <linux-devicetree@archiver.kernel.org>; Thu,  4 Jun 2020 04:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1591245648;
	bh=13tLzVtmrPoCVWrBPWoOY0F4+WIdkvFKkcoN1yl+MH0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=IKsbXByam+BdvltIaxZ6d7gvIDgA88lE2zV8sg3Fl8OMe1JvDySKbQrRq7RA6mKHp
	 x8cvQ8s57I0vjiNrVTyNSJRrzOFlMym5jBUs1om+h3JW3w5y9DUaJACY0J8ldcFdJ8
	 U1BRpvdnPGgNm6x1cf6U/PzKrstaWnctmNnSJICA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727001AbgFDEks (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 4 Jun 2020 00:40:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:46176 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725497AbgFDEks (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 4 Jun 2020 00:40:48 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ACF4A2072E;
        Thu,  4 Jun 2020 04:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591245647;
        bh=13tLzVtmrPoCVWrBPWoOY0F4+WIdkvFKkcoN1yl+MH0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=frhnRWAKp2lW4rQNOfVFrP4rn96xX6cZ26uWHBlxtGm3C90HY2rneICf/wUkhBuMM
         eZAuEIKKvg2ZG3GZ2GWWot6/CeZQHmF97Bfqmh3z2X6dQjaV7QklQFXIURVesn6QUm
         sRpytvTHD6Vb65AnaVPe0rkOnrqmaaT1JESSYmXI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1591234387-15059-1-git-send-email-Anson.Huang@nxp.com>
References: <1591234387-15059-1-git-send-email-Anson.Huang@nxp.com>
Subject: Re: [PATCH V2] dt-bindings: clock: Convert imx7ulp clock to json-schema
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Linux-imx@nxp.com
To:     Anson Huang <Anson.Huang@nxp.com>, aisheng.dong@nxp.com,
        devicetree@vger.kernel.org, festevam@gmail.com,
        kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        mturquette@baylibre.com, robh+dt@kernel.org,
        s.hauer@pengutronix.de, shawnguo@kernel.org
Date:   Wed, 03 Jun 2020 21:40:47 -0700
Message-ID: <159124564701.69627.4748922307258479623@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Anson Huang (2020-06-03 18:33:07)
> Convert the i.MX7ULP clock binding to DT schema format using json-schema,
> the original binding doc is actually for two clock modules(SCG and PCC),
> so split it to two binding docs, and the MPLL(mipi PLL) is NOT supposed
> to be in clock module, so remove it from binding doc as well.
>=20
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
