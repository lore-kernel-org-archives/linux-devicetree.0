From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 1/3] mfd: allow mfd_cell association with device tree node
Date: Wed, 28 Sep 2011 13:31:55 +0100
Message-ID: <20110928123154.GG3279@opensource.wolfsonmicro.com>
References: <20110921131637.GF4374@opensource.wolfsonmicro.com>
 <CAMLZHHTJaOddSj00g0-WpFQu6pUTqizKjKaQF9hLrhceEMhY1Q@mail.gmail.com>
 <20110927150555.GF20588@ponder.secretlab.ca>
 <CAMLZHHQU-eMAtvBQJj6+WrMjkWWA+ET=z5NdQCEgXxh=m10d3Q@mail.gmail.com>
 <20110927181420.GQ4289@opensource.wolfsonmicro.com>
 <CAMLZHHSuoeAJ-AC9daxb83+EANV=YGK-aiYpQ_j2wFiyQa5ytw@mail.gmail.com>
 <20110927182636.GR4289@opensource.wolfsonmicro.com>
 <CAMLZHHR0rMZct2E91X8k+Lhv_y-pY_5+vshZw6dj194o9vSCJQ@mail.gmail.com>
 <20110927183832.GS4289@opensource.wolfsonmicro.com>
 <CAMLZHHRvr-diYGwZ2Kg647Ht7NNb8LEku0pCW8EujRuUeOW5yQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMLZHHRvr-diYGwZ2Kg647Ht7NNb8LEku0pCW8EujRuUeOW5yQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Drake <dsd@laptop.org>
Cc: Grant Likely <grant.likely@secretlab.ca>, sameo@linux.intel.com, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, dilinger@queued.net
List-Id: devicetree@vger.kernel.org

On Wed, Sep 28, 2011 at 10:07:43AM +0100, Daniel Drake wrote:
> On Tue, Sep 27, 2011 at 7:38 PM, Mark Brown

> > You're modifying global data which should really be const and is sh=
ared
> > between multiple devices in place. =A0Probably you'll not notice an=
y
> > practical effects, especially if you don't happen to have multiple
> > devices in the same system.

> I see. In this case, it would be impossible to have two VX855s in the
> same system, and if you did, you would have bigger problems. In this
> context what we're doing is safe.

Right, but your modification was to the MFD core so it's going to affec=
t
other devices...
