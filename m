From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCHv2 1/5] Documentation: dt: edac: Fix Stratix10 IRQ bindings
Date: Wed, 13 Mar 2019 14:23:53 -0500
Message-ID: <CAL_JsqKnwYXSsP5B_uAaRoCEEV7Cb7f8XFPSC2z_hfSj7Rgqyg@mail.gmail.com>
References: <1551288445-22335-1-git-send-email-thor.thayer@linux.intel.com>
 <1551288445-22335-2-git-send-email-thor.thayer@linux.intel.com>
 <20190312160057.GA31306@bogus> <8b18501b-e120-97f2-f6b5-4771dc0f613f@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8b18501b-e120-97f2-f6b5-4771dc0f613f@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thor.thayer@linux.intel.com
Cc: Borislav Petkov <bp@alien8.de>, Dinh Nguyen <dinguyen@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, devicetree@vger.kernel.org, linux-edac@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 12, 2019 at 2:13 PM Thor Thayer <thor.thayer@linux.intel.com> wrote:
>
> Hi Rob,
>
> On 3/12/19 11:00 AM, Rob Herring wrote:
> > On Wed, Feb 27, 2019 at 11:27:21AM -0600, thor.thayer@linux.intel.com wrote:
> >> From: Thor Thayer <thor.thayer@linux.intel.com>
> >>
> >> Fix Stratix10 ECC bindings to specify only the single
> >> bit error. On Stratix10 double bit errors are handled
> >> as SErrors instead of interrupts.
> >> Indicate the differences between the ARM64 and ARM32
> >> EDAC architecture in the bindings.
> >>
> >> Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
> >> ---
> >> v2 No change
> >> ---
> >>   .../devicetree/bindings/edac/socfpga-eccmgr.txt    | 23 +++++++++++++++-------
> >>   1 file changed, 16 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/edac/socfpga-eccmgr.txt b/Documentation/devicetree/bindings/edac/socfpga-eccmgr.txt
> >> index 5626560a6cfd..a0ac50e15912 100644
> >> --- a/Documentation/devicetree/bindings/edac/socfpga-eccmgr.txt
> >> +++ b/Documentation/devicetree/bindings/edac/socfpga-eccmgr.txt
> >> @@ -236,33 +236,42 @@ Stratix10 SoCFPGA ECC Manager
> >>   The Stratix10 SoC ECC Manager handles the IRQs for each peripheral
> >>   in a shared register similar to the Arria10. However, ECC requires
> >>   access to registers that can only be read from Secure Monitor with
> >> -SMC calls. Therefore the device tree is slightly different.
> >> +SMC calls. Therefore the device tree is slightly different. Note that
> >> +only 1 interrupt is sent because the double bit errors are treated as
> >> +SErrors instead of IRQ.
> >>
> >>   Required Properties:
> >>   - compatible : Should be "altr,socfpga-s10-ecc-manager"
> >> -- interrupts : Should be single bit error interrupt, then double bit error
> >> -    interrupt.
> >> +- altr,sysgr-syscon : phandle to Stratix10 System Manager Block
> >> +                  containing the ECC manager registers.
> >
> > Seems this was already in use, but why not just make this node a child
> > of the System Manager Block and remove this phandle?
> >
> Yes, this was already in use but I'm trying to fix that oversight with
> this patch.
>
> The System Manager is a collection of registers used by different
> peripherals including EMAC and ECC.

The EMAC has its own registers too, right? But the ECC does not it seems.

> I view ECC Manager as a separate entity as is the Ethernet MAC which is
> why I have it separate. Using the phandle also follows the convention
> established with the Arria10 ECC Manager.

I guess this ship has sailed, so:

Acked-by: Rob Herring <robh@kernel.org>
