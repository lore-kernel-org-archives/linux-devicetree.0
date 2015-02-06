From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCHv6 0/5] Add Altera peripheral memories to EDAC framework
Date: Fri, 6 Feb 2015 19:29:25 +0000
Message-ID: <20150206192925.GG10324@leverpostej>
References: <1420772036-3112-1-git-send-email-tthayer@opensource.altera.com>
 <54CA9DB2.4070109@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <54CA9DB2.4070109@opensource.altera.com>
Sender: linux-doc-owner@vger.kernel.org
To: Thor Thayer <tthayer@opensource.altera.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "bp@alien8.de" <bp@alien8.de>, "dougthompson@xmission.com" <dougthompson@xmission.com>, "m.chehab@samsung.com" <m.chehab@samsung.com>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "dinguyen@opensource.altera.com" <dinguyen@opensource.altera.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "tthayer.linux@gmail.com" <tthayer.linux@gmail.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 29, 2015 at 08:53:06PM +0000, Thor Thayer wrote:
> Hi Device Tree Maintainers,

Hi Thor,

Apologies for being silent for so long on this.

> On 01/08/2015 08:53 PM, tthayer@opensource.altera.com wrote:
> > From: Thor Thayer <tthayer@opensource.altera.com>
> >
> > This patch adds the L2 cache and OCRAM peripherals to the EDAC framework
> > using the EDAC device framework. The ECC is enabled early in the boot
> > process in the platform specific code.
> >
> 
> The changes in this patch series revision were mainly to address device 
> tree concerns. There were changes in other areas of the code to address 
> these changes but I believe the other maintainers are waiting to see if 
> these changes are accepted before they will review (they had approved 
> the previous patch changes).
> 
> How does the this patch series appear from a device tree perspective?

While this looks better than before (thank you for no longer treating
the PL310 registers as a syscon), I have a couple of quibbles with the
binding:

* It's not clear to me whether the L2 and OCRAM EDACs are fundamentally
  different in interface, or whether they simply happen to be monitoring
  different memories. The former would mean a common compatible string
  for both EDAC block instances, and another property to determine
  what the other end was.

* It relies on a single instance of OCRAM or L2 existing, rather than
  describing the relationship with the particular memory explicitly. In
  general it's better to be explicit -- this means it can more easily be
  generalised to multiple OCRAMs as might occur in a later SoC (in
  addition to the reasons laid out in the first point.

Thanks,
Mark.
