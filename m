From: Steve Twiss <stwiss.opensource@diasemi.com>
Subject: RE: [PATCH V1] regulator: da9210: addition of device tree support
Date: Fri, 15 Jul 2016 09:17:39 +0000
Message-ID: <6ED8E3B22081A4459DAC7699F3695FB70173DAB217@SW-EX-MBX02.diasemi.com>
References: <20160713154433.496843FAD9@swsrvapps-01.diasemi.com>
 <20160714154821.GA30372@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160714154821.GA30372@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: DEVICETREE <devicetree@vger.kernel.org>, LINUXKERNEL <linux-kernel@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Support Opensource <Support.Opensource@diasemi.com>
List-Id: devicetree@vger.kernel.org

On 14 July 2016 16:48, Mark Brown wrote:

> To: Steve Twiss
> Cc: DEVICETREE; LINUXKERNEL; Liam Girdwood; Mark Rutland; Rob Herring;
> Support Opensource
> Subject: Re: [PATCH V1] regulator: da9210: addition of device tree support
> 
> On Wed, Jul 13, 2016 at 04:41:19PM +0100, Steve Twiss wrote:
> 
> > Two files are modified, the driver source file and the binding document.
> > Updates for the regulator source file include an .of_match_table entry, node
> > match checking in the probe() function for a compatible da9210 string, and
> > a new "BUCK" regulator entry. The binding documentation changes have been
> > made to reflect these updates.
> 
> If the device only has one regulator and no other functionality I'd
> expect the properties to just be in the top level node for the device -
> no need to go fiddling around with a subnode to hold another subnode to
> hold all the properties.

Agreed.
I will revert those changes to the device tree and re-submit V2.
