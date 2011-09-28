From: Daniel Drake <dsd@laptop.org>
Subject: Re: [PATCH 1/3] mfd: allow mfd_cell association with device tree node
Date: Wed, 28 Sep 2011 10:07:43 +0100
Message-ID: <CAMLZHHRvr-diYGwZ2Kg647Ht7NNb8LEku0pCW8EujRuUeOW5yQ@mail.gmail.com>
References: <20110921124936.GA25620@sirena.org.uk>
	<CAMLZHHQZnajC4e12MjaK3W8WcAB2ZB+6L=5kS5BBFZF=+YWicQ@mail.gmail.com>
	<20110921131637.GF4374@opensource.wolfsonmicro.com>
	<CAMLZHHTJaOddSj00g0-WpFQu6pUTqizKjKaQF9hLrhceEMhY1Q@mail.gmail.com>
	<20110927150555.GF20588@ponder.secretlab.ca>
	<CAMLZHHQU-eMAtvBQJj6+WrMjkWWA+ET=z5NdQCEgXxh=m10d3Q@mail.gmail.com>
	<20110927181420.GQ4289@opensource.wolfsonmicro.com>
	<CAMLZHHSuoeAJ-AC9daxb83+EANV=YGK-aiYpQ_j2wFiyQa5ytw@mail.gmail.com>
	<20110927182636.GR4289@opensource.wolfsonmicro.com>
	<CAMLZHHR0rMZct2E91X8k+Lhv_y-pY_5+vshZw6dj194o9vSCJQ@mail.gmail.com>
	<20110927183832.GS4289@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110927183832.GS4289@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, sameo@linux.intel.com, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, dilinger@queued.net
List-Id: devicetree@vger.kernel.org

On Tue, Sep 27, 2011 at 7:38 PM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> You're modifying global data which should really be const and is shar=
ed
> between multiple devices in place. =A0Probably you'll not notice any
> practical effects, especially if you don't happen to have multiple
> devices in the same system.

I see. In this case, it would be impossible to have two VX855s in the
same system, and if you did, you would have bigger problems. In this
context what we're doing is safe.

Thanks,
Daniel
