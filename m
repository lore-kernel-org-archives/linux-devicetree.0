Return-Path: <SRS0=QS5O=WN=vger.kernel.org=devicetree-owner@kernel.org>
Received: from muru.com ([72.249.23.125]:58110 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725267AbfHQHFF (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sat, 17 Aug 2019 03:05:05 -0400
Date: Sat, 17 Aug 2019 00:05:01 -0700
From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 0/6] Configure sgx interconnect data for some omap
 variants
Message-ID: <20190817070501.GK52127@atomide.com>
References: <20190814131408.57162-1-tony@atomide.com>
 <CAHCN7x+p5+XoRHJP--mZ0QcP0FzpYK+pRj7d8Y-js6a8z=p_7A@mail.gmail.com>
 <20190815040248.GF52127@atomide.com>
 <20190815041502.GG52127@atomide.com>
 <CAHCN7xLNmTkvX9cKdRTu6xLvX+G-kkN6CbwXU0z+mdqscB3fvQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHCN7xLNmTkvX9cKdRTu6xLvX+G-kkN6CbwXU0z+mdqscB3fvQ@mail.gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: Adam Ford <aford173@gmail.com>
Cc: Linux-OMAP <linux-omap@vger.kernel.org>, =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>, devicetree <devicetree@vger.kernel.org>, "H. Nikolaus Schaller" <hns@goldelico.com>, Filip =?utf-8?Q?Matijevi=C4=87?= <filip.matijevic.pz@gmail.com>, Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>, Merlijn Wajer <merlijn@wizzup.org>, Michael Turquette <mturquette@baylibre.com>, =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>, Philipp Rossak <embed3d@gmail.com>, Stephen Boyd <sboyd@kernel.org>, Tero Kristo <t-kristo@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, linux-clk <linux-clk@vger.kernel.org>, moaz korena <moaz@korena.xyz>, "Andrew F. Davis" <afd@ti.com>
List-ID: <devicetree@vger.kernel.org>

* Adam Ford <aford173@gmail.com> [190815 13:06]:
> On Wed, Aug 14, 2019 at 11:15 PM Tony Lindgren <tony@atomide.com> wrote:
> > Looks like omap34xx OCP registers are not readable unlike on omap36xx.
> > We use SGX revision register instead of the OCP revision register for
> > 34xx and do not configure any SYSCONFIG register unlike for 36xx.
> 
> Do you want/need me to test the OMAP3530?  I can run the same tests I
> did for the DM3730.

Sure if you can dod that easily.

Regards,

Tony
