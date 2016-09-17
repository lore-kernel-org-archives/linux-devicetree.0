From: Peter Chen <hzpeterchen@gmail.com>
Subject: Re: [RFC/PATCH] usb: misc: Add a driver for TC7USB40MU
Date: Sat, 17 Sep 2016 08:20:55 +0800
Message-ID: <20160917002055.GA10392@b29397-desktop>
References: <20160914014246.31847-1-stephen.boyd@linaro.org>
 <20160914033200.GE30760@b29397-desktop>
 <147383270635.1464.10706917860873291816@sboyd-linaro>
 <20160914080321.GA21674@b29397-desktop>
 <147384270449.13546.495288874027868435@sboyd-linaro>
 <20160915090158.GB6919@b29397-desktop>
 <147398859894.4997.6486248242638696855@sboyd-linaro>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <147398859894.4997.6486248242638696855@sboyd-linaro>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <stephen.boyd@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, robh+dt@kernel.org, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 15, 2016 at 06:16:38PM -0700, Stephen Boyd wrote:
> 
> > For #3, it is not the
> > use case for this design. #3 is usually used for the single port which
> > needs to support switching role on the fly without disconnection.
> > So, you may only need to consider #2, you can't use extcon-usb-gpio.c
> > directly since you need to set one gpio to mux the dp/dm, Baolu Lu had
> > USB MUX patch set before which may satisfy your requirement. [1]
> 
> Ok. Did the usb mux patches go anywhere? It seemed to get tangled up in
> DRD framework and I haven't been following along. I'll look into these
> patches more.

DRD framework is denied by Felipe due to only one user can be benefit
from it (chipidea OTG), I don't know the further status of USB MUX,
maybe you can ask for it.

-- 

Best Regards,
Peter Chen
