From: Steve Twiss <stwiss.opensource@diasemi.com>
Subject: RE: [RFC] regulator: da9052/53: da9052-i2c.txt binding document
 changes
Date: Thu, 28 Jul 2016 08:26:14 +0000
Message-ID: <6ED8E3B22081A4459DAC7699F3695FB70173DC58E1@SW-EX-MBX02.diasemi.com>
References: <6ED8E3B22081A4459DAC7699F3695FB70173DAC199@SW-EX-MBX02.diasemi.com>
 <6ED8E3B22081A4459DAC7699F3695FB70173DB39F6@NB-EX-MBX02.diasemi.com>
 <20160727182417.GW11806@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160727182417.GW11806@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, DEVICTREE <devicetree@vger.kernel.org>, LINUXKERNEL <linux-kernel@vger.kernel.org>, "Ying-Chun Liu (PaulLiu" <paul.liu@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Shawn Guo <shawn.guo@linaro.org>, Support Opensource <Support.Opensource@diasemi.com>
List-Id: devicetree@vger.kernel.org

On 27 July 2016 19:24, Mark Brown wrote:

> On Mon, Jul 25, 2016 at 11:31:27AM +0000, Steve Twiss wrote:
> 
> > There are already several device tree files using a naming scheme different to that found
> > in the binding text document. Since those have been used for real already, I will just follow
> > those existing DT file naming conventions instead.
> 
> The other thing you can try to do here is have a -v2 binding with the
> corrected names that's easier for people to follow though it does make
> the implementation more complex and may not be worth it.

Yes, I think it would be overly complicated to have a -v2 compatible option in this case.
