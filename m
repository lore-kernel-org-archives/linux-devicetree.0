From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH 1/2] edac: sifive: Add DT documentation for SiFive L2
 cache Controller
Date: Fri, 29 Mar 2019 15:27:39 +0100
Message-ID: <20190329142739.GG21152@zn.tnic>
References: <1552382461-13051-1-git-send-email-yash.shah@sifive.com>
 <1552382461-13051-2-git-send-email-yash.shah@sifive.com>
 <20190328131657.GA9056@bogus>
 <be7246a0-2426-995d-0a24-f104c173d752@arm.com>
 <CAL_Jsq+s77J=Bwiyow2d7Q=e+z+5d64i_cL6xaYn0xdvJDb4Vg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+s77J=Bwiyow2d7Q=e+z+5d64i_cL6xaYn0xdvJDb4Vg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: James Morse <james.morse@arm.com>, Yash Shah <yash.shah@sifive.com>, linux-riscv@lists.infradead.org, linux-edac@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Albert Ou <aou@eecs.berkeley.edu>, Mauro Carvalho Chehab <mchehab@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 29, 2019 at 09:11:24AM -0500, Rob Herring wrote:
> I honestly don't understand the issue with EDAC is here.

The EDAC core supports only one driver and if you need to load more, you
need to dance around that.

Also, if those drivers need to talk amongst each other, then they need
to build something ad-hoc so that they can.

And the other architectures can very well do one driver per platform -
only ARM wants to do this special thing because DT said so. Or whatever.

> Highbank is separate drivers for L2 ECC (PL310) and DDR. Both are used
> on highbank.

That's because your L2 driver does allocate an edac_device
(edac_device_alloc_ctl_info()) and the DDR one an edac_mc
(edac_mc_add_mc_with_groups).

For example, altera_edac does edac_device_alloc_ctl_info() for each IP
block just fine. So a single driver *can* work.

> Only the DDR driver is used midway. (I think we never got around to
> how to report A15 L2 ECC errors within Linux.)
>
> In any case, it's all irrelevant to the DT binding. We don't design
> bindings around what some particular OS wants.

And just because DT dictates one driver per IP block, I'm not going to
redesign EDAC to fit that scheme. You or someone else who feels strongly
about it, is more than welcome to do so, of course. And then maintain it
too.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
