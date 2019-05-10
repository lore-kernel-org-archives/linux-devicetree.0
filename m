From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] arm64: add support for rng-seed
Date: Fri, 10 May 2019 10:51:33 -0500
Message-ID: <CAL_JsqLHGobOQg-j=8e=ivCBWh6f+xy43zTzdXBQ-U86AOg-6w@mail.gmail.com>
References: <20190507045433.542-1-hsinyi@chromium.org> <CAL_Jsq+rGeFKAPVmPvv_Z+G=BppKUK-tEUphBajZVxFtbRBJvQ@mail.gmail.com>
 <CAJMQK-i-0RgdQEniqaKubdjF-dpd1JOCWy7DOPDfN33EqgL5iA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJMQK-i-0RgdQEniqaKubdjF-dpd1JOCWy7DOPDfN33EqgL5iA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Frank Rowand <frowand.list@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@linux.ibm.com>, Michal Hocko <mhocko@suse.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, James Morse <james.morse@arm.com>, Andrew Murray <andrew.murray@arm.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>, Architecture Mailman List <boot-architecture@lists.linaro.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 9, 2019 at 11:27 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> On Wed, May 8, 2019 at 3:47 AM Rob Herring <robh+dt@kernel.org> wrote:
>
> > >  Documentation/devicetree/bindings/chosen.txt | 14 +++++++++
> >
> > Actually, this file has been converted to json-schema and lives
> > here[1]. I need to remove this one (or leave it with a reference to
> > the new one).
> >
>
> Hi Rob,
> I can't find where the new document is. Can you help point it again? Thanks.

Sorry, forgot to add that:

https://github.com/devicetree-org/dt-schema/blob/master/schemas/chosen.yaml

Rob
