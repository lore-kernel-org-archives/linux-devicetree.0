From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] edac: sifive: Add DT documentation for SiFive L2
 cache Controller
Date: Wed, 3 Apr 2019 20:04:08 -0500
Message-ID: <CAL_Jsq+NMapJqM4N_kpeojvrS_W19vPLfMzdiENy6FjcOiqoDA@mail.gmail.com>
References: <1552382461-13051-1-git-send-email-yash.shah@sifive.com>
 <1552382461-13051-2-git-send-email-yash.shah@sifive.com> <20190328131657.GA9056@bogus>
 <be7246a0-2426-995d-0a24-f104c173d752@arm.com> <CAL_Jsq+s77J=Bwiyow2d7Q=e+z+5d64i_cL6xaYn0xdvJDb4Vg@mail.gmail.com>
 <20190329142739.GG21152@zn.tnic> <CAL_JsqLQ1XvQq7L=xA5Z8Y0Xa4Bmp0t2pgxn+hLF+tD=_L7Mvg@mail.gmail.com>
 <20190329202416.GI21152@zn.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190329202416.GI21152@zn.tnic>
Sender: linux-kernel-owner@vger.kernel.org
To: Borislav Petkov <bp@alien8.de>
Cc: James Morse <james.morse@arm.com>, Yash Shah <yash.shah@sifive.com>, linux-riscv@lists.infradead.org, linux-edac@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Albert Ou <aou@eecs.berkeley.edu>, Mauro Carvalho Chehab <mchehab@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 29, 2019 at 3:24 PM Borislav Petkov <bp@alien8.de> wrote:
>
> On Fri, Mar 29, 2019 at 02:41:05PM -0500, Rob Herring wrote:
> > DT dictates aligning with what the h/w looks like which has little to
> > do with OS driver design.
>
> Ok, then, where does this goal for doing a driver or compilation unit
> per IP block come from?
>
> Because everytime an ARM EDAC driver pops up, we are having the same
> discussion.
>
> > I never said you should change EDAC and I outlined how things should
> > be handled if it is one driver.
>
> Ok, we will add that to the EDAC driver design document we're currently
> working on.
>
> > DT and OS subsystems are independent things. I can't tell you how to
> > design the subsystem and you can't dictate DT design (based on EDAC
> > design).
>
> I don't think I've ever intentionally or unintentionally dictated DT
> design - all I've opposed to is having multiple EDAC drivers on ARM.

No, but folks just extend 1 driver to mean 1 DT node because that's
easy and certainly the more common case.

Rob
