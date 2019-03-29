From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] edac: sifive: Add DT documentation for SiFive L2
 cache Controller
Date: Fri, 29 Mar 2019 09:11:24 -0500
Message-ID: <CAL_Jsq+s77J=Bwiyow2d7Q=e+z+5d64i_cL6xaYn0xdvJDb4Vg@mail.gmail.com>
References: <1552382461-13051-1-git-send-email-yash.shah@sifive.com>
 <1552382461-13051-2-git-send-email-yash.shah@sifive.com> <20190328131657.GA9056@bogus>
 <be7246a0-2426-995d-0a24-f104c173d752@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <be7246a0-2426-995d-0a24-f104c173d752@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: James Morse <james.morse@arm.com>
Cc: Yash Shah <yash.shah@sifive.com>, linux-riscv@lists.infradead.org, linux-edac@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Albert Ou <aou@eecs.berkeley.edu>, Borislav Petkov <bp@alien8.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 28, 2019 at 1:47 PM James Morse <james.morse@arm.com> wrote:
>
> Hi Rob, Yash,
>
> On 28/03/2019 13:16, Rob Herring wrote:
> > On Tue, Mar 12, 2019 at 02:51:00PM +0530, Yash Shah wrote:
> >> DT documentation for L2 cache controller added.
>
> >> diff --git a/Documentation/devicetree/bindings/edac/sifive-edac-l2.txt b/Documentation/devicetree/bindings/edac/sifive-edac-l2.txt
> >> new file mode 100644
> >> index 0000000..abce09f
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/edac/sifive-edac-l2.txt
> >> @@ -0,0 +1,31 @@
> >> +SiFive L2 Cache EDAC driver device tree bindings
> >> +-------------------------------------------------
> >> +This driver uses the EDAC framework to report L2 cache controller ECC errors.
> >
> > Bindings are for h/w blocks, not drivers. (And Boris may want a single
> > driver, but bindings should reflect the h/w, not what Linux (currently)
> > wants.
>
> For h/w block compatibles and edac, I think all we need now is to ensure the DT contains
> the three compatible strings: platform (if there is one), soc and ip-name (if its a
> re-usable thing).
> This is so that linux can pick the biggest of the three (usually platform) to probe the
> driver from, as this lets us capture platform properties we only find out about later.

DT is not the only what to instantiate drivers. If the OS really wants
to have a single driver for multiple h/w blocks, then it needs to
instantiate a driver itself (based on the top-level compatible
probably) and then that driver can find the DT nodes it needs itself.

> The single-driver idea is because ras/edac gets done late, (its not necessary to boot
> linux on the board), and the edac core has difficulty with multiple components feeding
> into it.
>
> I don't think we need platform-specific-drivers until someone has a platform that needs
> one for this multiple-component issue. To let us do that later (and possibly your
> customer's customer to do it), we'd like to avoid probing based on the smallest
> compatible, and use the biggest instead.

I honestly don't understand the issue with EDAC is here. Highbank is
separate drivers for L2 ECC (PL310) and DDR. Both are used on
highbank. Only the DDR driver is used midway. (I think we never got
around to how to report A15 L2 ECC errors within Linux.)

In any case, it's all irrelevant to the DT binding. We don't design
bindings around what some particular OS wants.

Rob
