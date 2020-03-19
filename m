Return-Path: <SRS0=Rh3i=5E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6110C4332E
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Mar 2020 00:32:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BC4BC2076C
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Mar 2020 00:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584577929;
	bh=luwv1tWhVqWBgIzABSQPeSxHDt0MZSFdSU+ZcgevEAI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=itTRvzX8mFKzapFBsFpd3Y5jfz/WIkvWhulwLyCMcQgPB0aAuIYKn6NqqDVs9YrhI
	 pAg6Qj5ZAroY6oeuwmXHiLSQlCPD3jo8cot3VNYi3Nl/qJmsQcabQbryv0HIO0JMx9
	 PxDfruYzFA2JTbHq7l4Nk0Andnx73q94QitSKRTk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726869AbgCSAcG (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 18 Mar 2020 20:32:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:47702 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726596AbgCSAcG (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 18 Mar 2020 20:32:06 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C86952076C;
        Thu, 19 Mar 2020 00:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584577925;
        bh=luwv1tWhVqWBgIzABSQPeSxHDt0MZSFdSU+ZcgevEAI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=zfhlQBQI6Oaz0sVeNTVLRYb7NBfhPMAnKPnycY4eREt/q/C0bT0kVmfEiK++JkI6U
         GNQjC93HL3Nuq5KNve5I0MU1tj747t/uV7ytpvj5bs8KjU0c3RCAt0GzR1/DVpex7v
         DJHmmJFHe5X0s5KuY1Mbty4nqs1OUWO6O6q61RjI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200318133213.1041-1-ansuelsmth@gmail.com>
References: <20200318133213.1041-1-ansuelsmth@gmail.com>
Subject: Re: [PATCH] ARM: dts: qcom: add scm definition
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Ansuel Smith <ansuelsmth@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Andy Gross <agross@kernel.org>, Ansuel Smith <ansuelsmth@gmail.com>
Date:   Wed, 18 Mar 2020 17:32:05 -0700
Message-ID: <158457792505.152100.5245855143436847803@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Ansuel Smith (2020-03-18 06:32:14)
> Add missing scm definition for ipq806x soc

Would be good to put ipq8064 somewhere in the subject.

>=20
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
>  arch/arm/boot/dts/qcom-ipq8064.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
