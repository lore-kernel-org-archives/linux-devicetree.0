From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] dt-bindings: arm: amlogic: Add SoC information
 bindings
Date: Mon, 3 Apr 2017 11:34:48 -0500
Message-ID: <20170403163448.e7uuhhebqlaf33bl@rob-hp-laptop>
References: <1490950079-10145-1-git-send-email-narmstrong@baylibre.com>
 <1490950079-10145-3-git-send-email-narmstrong@baylibre.com>
 <CAK8P3a199j=7mb=CMgROvaOCVU8=kYda9wkvG3O4rtqweSyC0g@mail.gmail.com>
 <4ab7d4ee-e805-69f1-b76b-b827b46285bd@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4ab7d4ee-e805-69f1-b76b-b827b46285bd-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 31, 2017 at 04:10:30PM +0200, Neil Armstrong wrote:
> On 03/31/2017 03:44 PM, Arnd Bergmann wrote:
> > On Fri, Mar 31, 2017 at 10:47 AM, Neil Armstrong
> > <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> wrote:
> >> Add bindings for the SoC information register of the Amlogic SoCs.
> >>
> >> Signed-off-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> >> ---
> >>  Documentation/devicetree/bindings/arm/amlogic.txt | 20 ++++++++++++++++++++
> >>  1 file changed, 20 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/arm/amlogic.txt b/Documentation/devicetree/bindings/arm/amlogic.txt
> >> index bfd5b55..b850985 100644
> >> --- a/Documentation/devicetree/bindings/arm/amlogic.txt
> >> +++ b/Documentation/devicetree/bindings/arm/amlogic.txt
> >> @@ -52,3 +52,23 @@ Board compatible values:
> >>    - "amlogic,q201" (Meson gxm s912)
> >>    - "nexbox,a95x" (Meson gxbb or Meson gxl s905x)
> >>    - "nexbox,a1" (Meson gxm s912)
> >> +
> >> +Amlogic Meson GX SoCs Information
> >> +----------------------------------
> >> +
> >> +The Meson SoCs have a Product Register that allows to retrieve SoC type,
> >> +package and revision information. If present, a device node for this register
> >> +should be added.
> >> +
> >> +Required properties:
> >> +  - compatible: For Meson GX SoCs, must be "amlogic,meson-gx-socinfo".
> >> +  - reg: Base address and length of the register block.
> >> +
> >> +Examples
> >> +--------
> >> +
> >> +       chipid@220 {
> >> +               compatible = "amlogic,meson-gx-socinfo";
> >> +               reg = <0x0 0x00220 0x0 0x4>;
> >> +       };
> >> +
> > 
> > The register location would hint that this is in the middle of some block of
> > random registers, i.e. a syscon or some unrelated device.
> > 
> > Are you sure that "socinfo" is the actual name of the IP block and that
> > it only has a single 32-bit register?
> > 
> >      Arnd
> > 
> 
> Hi Arnd,
> 
> I'm sorry I did not find any relevant registers in the docs or source code describing
> it in a specific block of registers, and no close enough register definitions either.
> They may be used by the secure firmware I imagine.
> 
> For the register name, Amlogic refers it to "cpu_version" in their code, but it really
> gives some details on the whole SoC and package, and socinfo seems better.

A register at address 0x220 seems a bit strange (unless there's ranges 
you're not showing), but ROM code at this address would be fairly 
typical. And putting version information into the ROM is also common.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
