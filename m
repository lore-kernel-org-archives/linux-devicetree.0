From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 0/3] of: dts: enable memory@0 quirk for PPC32 only
Date: Wed, 23 Apr 2014 14:17:20 +0100
Message-ID: <20140423131720.8C978C408D2@trevor.secretlab.ca>
References: <1397756521-29387-1-git-send-email-leif.lindholm@linaro.org>
	<CAL_JsqL8B2ZY7ACXKX3J8VN5ukjKWuycgfDZpp4kYzBxg6BLmQ@mail.gmail.com>
	<20140418124821.GE5904@bivouac.eciton.net>
	<CAL_JsqKdFyhHfkcC1E9QuKjQTrXwoELYG+CFTpgf2-jqDvxGmA@mail.gmail.com>
	<20140422130829.CA29DC4042C@trevor.secretlab.ca>
	<20140422140526.GK5904@bivouac.eciton.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140422140526.GK5904@bivouac.eciton.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Leif Lindholm <leif.lindholm@linaro.org>
Cc: Rob Herring <robherring2@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linaro Patches <patches@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Tue, 22 Apr 2014 15:05:26 +0100, Leif Lindholm <leif.lindholm@linaro.org> wrote:
> On Tue, Apr 22, 2014 at 02:08:29PM +0100, Grant Likely wrote:
> > > I would prefer to see a "WARN_ON(!IS_ENABLED(CONFIG_PPC32));" added here.
> > 
> > I completely agree.
> 
> OK. So do we keep this around on unaffected architectures in perpetuity?
> 
> Or can there be some cut-off date when the majority of DT-enabled
> platforms can stop including this workaround which permits new incorrect
> DTs to be implemented so long as they are incorrect in this particular
> way?

I'd be fine with a patch that can enable the workaround selectively for
specific machines. Some people will still hit breakage, but we can fix
that by adding their machine to the quirk list.

g.
