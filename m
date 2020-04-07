Return-Path: <SRS0=WBDS=5X=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE7A8C2D0EC
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Apr 2020 23:08:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A464120719
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Apr 2020 23:08:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbgDGXIp (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 7 Apr 2020 19:08:45 -0400
Received: from 9.mo179.mail-out.ovh.net ([46.105.76.148]:48049 "EHLO
        9.mo179.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726380AbgDGXIp (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 7 Apr 2020 19:08:45 -0400
X-Greylist: delayed 4610 seconds by postgrey-1.27 at vger.kernel.org; Tue, 07 Apr 2020 19:08:44 EDT
Received: from player692.ha.ovh.net (unknown [10.110.171.117])
        by mo179.mail-out.ovh.net (Postfix) with ESMTP id 601E8162B98
        for <devicetree@vger.kernel.org>; Tue,  7 Apr 2020 23:51:53 +0200 (CEST)
Received: from etezian.org (213-243-141-64.bb.dnainternet.fi [213.243.141.64])
        (Authenticated sender: andi@etezian.org)
        by player692.ha.ovh.net (Postfix) with ESMTPSA id CADFA1114F23A;
        Tue,  7 Apr 2020 21:51:44 +0000 (UTC)
Date:   Wed, 8 Apr 2020 00:51:43 +0300
From:   Andi Shyti <andi@etezian.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andi Shyti <andi@etezian.org>, linux-input@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: mms114: document melfas,mms345l
 binding
Message-ID: <20200407215143.GD207210@jack.zhora.eu>
References: <20200405170904.61512-1-stephan@gerhold.net>
 <20200405170904.61512-2-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200405170904.61512-2-stephan@gerhold.net>
X-Ovh-Tracer-Id: 17724197810407588589
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrudeigddtvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehnughiucfuhhihthhiuceorghnughisegvthgviihirghnrdhorhhgqeenucfkpheptddrtddrtddrtddpvddufedrvdegfedrudeguddrieegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrieelvddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegrnhguihesvghtvgiiihgrnhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Stephan,

On Sun, Apr 05, 2020 at 07:09:04PM +0200, Stephan Gerhold wrote:
> The mms114 driver now supports MMS345L; document the
> melfas,mms345l binding that is used for it.
> 
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Andi Shyti <andi@etezian.org>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>

just one nitpick, the signing should be sorted in chronological
order, I see that you reverted it.

You first signed it as the author, then I reviewed it and the Rob
acked it, so that it should be:

  Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
  Reviewed-by: Andi Shyti <andi@etezian.org>
  Acked-by: Rob Herring <robh@kernel.org>

you reversed it.

Other than that, I'm sorry I couldn't help you but I haven't
received answers from Samsung about getting the prototypes.
However I don't see reason for not applying the patch.

Andi
