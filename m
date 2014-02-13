From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 7/7] devicetree: bindings: Document PM8921/8058 PMICs
Date: Thu, 13 Feb 2014 11:06:19 +0000
Message-ID: <20140213110619.GI32508@lee--X1>
References: <1389206270-3728-1-git-send-email-sboyd@codeaurora.org>
 <1389206270-3728-8-git-send-email-sboyd@codeaurora.org>
 <20140211092937.GG32042@lee--X1>
 <20140213053813.GB14769@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140213053813.GB14769@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

> > > +- interrupts:
> > > +	Usage: required
> > > +	Value type: <prop-encoded-array>
> >=20
> > Either provide an example or a comment to see the description of
> > #interrupt-cells=20
>=20
> It is part of the example. We also state that the format is
> defined by the interrupt parent binding.

Okay, fair enough.

> > > +	Definition: specifies the interrupt that indicates a subdevice
> > > +		    has generated an interrupt (summary interrupt). The
> > > +		    format of the specifier is defined by the binding document
> > > +		    describing the node's interrupt parent.
> > > +
> > > +- #interrupt-cells:
> > > +	Usage: required
> > > +	Value type : <u32>
> > > +	Definition: must be 2. Specifies the number of cells needed to =
encode
> > > +		    an interrupt source. The 1st cell contains the interrupt
> > > +		    number. The 2nd cell is the trigger type and level flags
> > > +		    encoded as follows:
> > > +
> > > +			1 =3D low-to-high edge triggered
> > > +			2 =3D high-to-low edge triggered
> > > +			4 =3D active high level-sensitive
> > > +			8 =3D active low level-sensitive
> >=20
> > Actually I'd prefer if you used the definitions in:
> >   dt-bindings/interrupt-controller/irq.h
>=20
> These match the #defines in that file. I'd like to be explicit
> about the numbers to prevent people from thinking they have to
> use #defines and to match what other irq controllers have done
> (gic, atmel-aic, etc.)

I believe people _do_ have to use the #defines? Is there a good reason
for you not wanting to use them?

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
