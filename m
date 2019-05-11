From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH] arm64: add support for rng-seed
Date: Fri, 10 May 2019 21:28:35 -0700
Message-ID: <155754891575.14659.7326257870940088515@swboyd.mtv.corp.google.com>
References: <20190507045433.542-1-hsinyi@chromium.org> <CAL_Jsq+rGeFKAPVmPvv_Z+G=BppKUK-tEUphBajZVxFtbRBJvQ@mail.gmail.com> <CAJMQK-iVhScf0ybZ85kqP0B5_QPoYZ9PZt35jHRUh8FNHKvu7w@mail.gmail.com> <CAL_JsqJZ+mOnrLWt0Cpo_Ybr_ohxwWom1qiyV8_EFocULde7=Q@mail.gmail.com> <CAJMQK-jjzYwX3NZAKJ-8ypjcN75o-ZX4iOVD=84JecEd4qV1bA@mail.gmail.com> <CAL_JsqLnmedF5cJYH+91U2Q_WX755O8TQs6Ue9mqtEiFKcjGWQ@mail.gmail.com> <CAJMQK-hJUG855+TqX=droOjUfb-MKnU0n0FYtr_SW2KByKAW1w@mail.gmail.com> <36fab640-b98e-9781-f96f-0ed988a71077@rasmusvillemoes.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <36fab640-b98e-9781-f96f-0ed988a71077@rasmusvillemoes.dk>
Sender: linux-kernel-owner@vger.kernel.org
To: Hsin-Yi Wang <hsinyi@chromium.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Rob Herring <robh+dt@kernel.org>
Cc: "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Frank Rowand <frowand.list@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@linux.ibm.com>, Michal Hocko <mhocko@suse.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, James Morse <james.morse@arm.com>, Andrew Murray <andrew.murray@arm.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Architecture Mailman List <boot-architecture@lists.linaro.org>, Kees Cook <keescook@chromium.org>
List-Id: devicetree@vger.kernel.org

Quoting Rasmus Villemoes (2019-05-09 23:14:00)
>=20
> So, why not just have the bootloader add whatever entropy it has via the
> commandline, which already gets mixed in? That requires no kernel
> changes, and works for all architectures.
>=20
> If anything, perhaps instead of just adding gobbledygook=3Dabc123, make an
> official command line parameter (there was talk about this at some
> point), and have the kernel overwrite the value with xxx so it's not
> visible in /proc/cmdline.
>=20

Why is using the commandline desired? Just for ease of implementation
and cross-architecture support because we already mix in the
commandline?=20

The kernel commandline is limited in size so we would waste around
64-bytes of the buffer to get a random chunk of data from the bootloader
into the kernel instead of allowing more parameters. Or if we wanted a
large chunk of random bytes then we would start running into the length
limit. Given that EFI based systems already have a way to inject more
randomness into the kernel's RNG very early by means of an RNG seed EFI
protocol it looks irrelevant to want to be cross-architecture in this
way because EFI platforms wouldn't use it.=20

If DT based systems can all get support for this in the generic DT code
then we're able to make things work on both EFI and DT platforms with a
little extra __init code while keeping things away from the commandline.
That sounds like a win to me because the commandline is limited in size
and meant to pass things like parameters and flags to the kernel, not
raw data like seeds and binary gook.
