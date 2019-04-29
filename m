Return-Path: <robherring2@gmail.com>
Date: Mon, 29 Apr 2019 17:05:03 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: Question about compatible fallback and documentation
Message-ID: <20190429220503.GA4720@bogus>
References: <CAJiuCceeLwY+myYtUf15frSYsLKmGaUBifAOxUkNWwSjbF4oDg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJiuCceeLwY+myYtUf15frSYsLKmGaUBifAOxUkNWwSjbF4oDg@mail.gmail.com>
To: =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>
Cc: devicetree <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Sun, Apr 14, 2019 at 06:18:04PM +0200, Cl�ment P�ron wrote:
> Hi,
> 
> I have to bind an already existing IP by a vendor in a new SoC called
> "SOC3" device-tree.
> 
> In the 1st gen of "SOC1" the IP is introduced :
> soc1.dtsi :
> compatible = "vendor,ip-soc1";
> 
> Then a 2nd gen of the IP is introduced in "SOC2" with new registers.
> But the driver of the 1st gen is still working fine and no update of
> the existing driver has been introduced because not required.
> soc2.dtsi :
> compatible = "vendor,ip-soc2", "vendor,ip-soc1";
> 
> Finally in "SOC3" and regardind the user manual we think that the IP
> introduced is the same as "SOC2".
> Should the compatible in soc3.dtsi be A or B?
> A) compatible = "vendor,ip-soc2", "vendor,ip-soc1";
> or
> B) compatible = "vendor,ip-soc3", "vendor,ip-soc2", "vendor,ip-soc1";
> 
> I propose the solution B) because we don't know what could happens
> maybe the IP could need a quirks only for "SOC3". And device tree
> shouldn't move for the user only the driver.

B is correct.

Or you could list soc3 and soc2 given you do know there are additional 
features. That would require a driver update, but likely the new SoC 
requires some OS changes. Maybe someday SoC design will be disciplined 
enough that new SoCs are fully backwards compatible.

> Last question does we have to document all the compatible use in
> DTS(i) files in the Documentation ? or only the compatible used by the
> drivers ?

What is used in DTS files.

Rob
