Return-Path: <SRS0=9zIi=6I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5046C54FCB
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Apr 2020 13:28:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9D1A020656
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Apr 2020 13:28:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726872AbgDXN2s (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 24 Apr 2020 09:28:48 -0400
Received: from 9.mo179.mail-out.ovh.net ([46.105.76.148]:35539 "EHLO
        9.mo179.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726301AbgDXN2s (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 24 Apr 2020 09:28:48 -0400
Received: from player761.ha.ovh.net (unknown [10.108.35.158])
        by mo179.mail-out.ovh.net (Postfix) with ESMTP id 74CBE16165C
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2020 15:22:53 +0200 (CEST)
Received: from etezian.org (213-243-141-64.bb.dnainternet.fi [213.243.141.64])
        (Authenticated sender: andi@etezian.org)
        by player761.ha.ovh.net (Postfix) with ESMTPSA id 14D3C11BAF160;
        Fri, 24 Apr 2020 13:22:44 +0000 (UTC)
Date:   Fri, 24 Apr 2020 16:22:43 +0300
From:   Andi Shyti <andi@etezian.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Andi Shyti <andi@etezian.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] Input: mms114 - add extra compatible for mms345l
Message-ID: <20200424132243.GH460760@jack.zhora.eu>
References: <20200423102431.2715-1-stephan@gerhold.net>
 <20200424092937.GB460760@jack.zhora.eu>
 <20200424113446.GA205913@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200424113446.GA205913@gerhold.net>
X-Ovh-Tracer-Id: 16730028191111955181
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrhedugdehlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehnughiucfuhhihthhiuceorghnughisegvthgviihirghnrdhorhhgqeenucfkpheptddrtddrtddrtddpvddufedrvdegfedrudeguddrieegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeeiuddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegrnhguihesvghtvgiiihgrnhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Stephan,

On Fri, Apr 24, 2020 at 01:34:46PM +0200, Stephan Gerhold wrote:
> On Fri, Apr 24, 2020 at 12:29:37PM +0300, Andi Shyti wrote:
> > Hi guys,
> > 
> > >  	}, {
> > >  		.compatible = "melfas,mms152",
> > >  		.data = (void *)TYPE_MMS152,
> > > +	}, {
> > > +		.compatible = "melfas,mms345l",
> > > +		.data = (void *)TYPE_MMS345L,
> > >  	},
> > 
> > it's been some times I haven't been doing this, but is the order
> > of the patches correct? shouldn't the binding be updated first?
> > 
> 
> Yes. I had it correct in my original patch, but apparently swapped the
> order accidentally for this one. I will do it correct again next time :)

then with that change:

Reviewed-by: Andi Shyti <andi@etezian.org>

Thanks,
Andi
