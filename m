From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] dt-bindings: mfd: rn5t618: Document optional property
 system-power-controller
Date: Mon, 12 Aug 2019 07:25:20 +0100
Message-ID: <20190812062520.GB4594@dell>
References: <20190129135917.29521-1-j.neuschaefer@gmx.net>
 <20190201092411.GG783@dell>
 <20190808183924.GB1966@latitude>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190808183924.GB1966@latitude>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 08 Aug 2019, Jonathan Neuschäfer wrote:

> On Fri, Feb 01, 2019 at 09:24:11AM +0000, Lee Jones wrote:
> > On Tue, 29 Jan 2019, Jonathan Neuschäfer wrote:
> > 
> > > The RN5T618 family of PMICs can be used as system management
> > > controllers, in which case they handle poweroff and restart. Document
> > > this capability by referring to the corresponding generic DT binding.
> > > 
> > > Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> > > ---
> > >  Documentation/devicetree/bindings/mfd/rn5t618.txt | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > 
> > Applied, thanks.
> 
> Hi,
> 
> apparently this patch got lost somehow (I can't find it in mainline or
> -next). Should I resend it?

Yes, it appears that it did.

I've applied it again.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
