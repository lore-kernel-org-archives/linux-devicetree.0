From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: Convert Samsung SoC watchdog
 bindings to json-schema
Date: Fri, 20 Sep 2019 18:15:21 +0200
Message-ID: <20190920161521.GA6004@kozik-lap>
References: <20190907144541.16949-1-krzk@kernel.org>
 <20190912170145.GA17889@bogus>
 <CAJKOXPfsUw-+yRc=GF+t=1pE7D3dF_wpRUwZpmfLnRbDyEmKeQ@mail.gmail.com>
 <CAL_JsqLtQ4yYJJiUcBrje+6SKiaXTmF-Cej_=ykeWKO+9ytM4Q@mail.gmail.com>
 <CAL_JsqJcE4+3gxoBAeKH1w=4+QFEaR9axqgBqLb=eW8jJqT1YQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqJcE4+3gxoBAeKH1w=4+QFEaR9axqgBqLb=eW8jJqT1YQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Mark Rutland <mark.rutland@arm.com>, LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 20, 2019 at 10:52:56AM -0500, Rob Herring wrote:
> On Fri, Sep 20, 2019 at 10:46 AM Rob Herring <robh@kernel.org> wrote:
> >
> > On Wed, Sep 18, 2019 at 6:26 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > >
> > > On Fri, 13 Sep 2019 at 16:36, Rob Herring <robh@kernel.org> wrote:
> > > >
> > > > On Sat, Sep 07, 2019 at 04:45:40PM +0200, Krzysztof Kozlowski wrote:
> > > > > Convert Samsung S3C/S5P/Exynos watchdog bindings to DT schema format
> > > > > using json-schema.
> > > > >
> > > > > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > > > > ---
> > > > >  .../bindings/watchdog/samsung-wdt.txt         | 35 ----------
> > > > >  .../bindings/watchdog/samsung-wdt.yaml        | 69 +++++++++++++++++++
> > > > >  2 files changed, 69 insertions(+), 35 deletions(-)
> > > > >  delete mode 100644 Documentation/devicetree/bindings/watchdog/samsung-wdt.txt
> > > > >  create mode 100644 Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> > > >
> > > >
> > > > > diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> > > > > new file mode 100644
> > > > > index 000000000000..39f1ca3bc4db
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> > > > > @@ -0,0 +1,69 @@
> > > > > +# SPDX-License-Identifier: GPL-2.0
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/watchdog/samsung-wdt.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: Samsung SoC Watchdog Timer Controller
> > > > > +
> > > > > +maintainers:
> > > > > +  - Krzysztof Kozlowski <krzk@kernel.org>
> > > > > +
> > > > > +description: |+
> > > > > +  The Samsung's Watchdog controller is used for resuming system operation
> > > > > +  after a preset amount of time during which the WDT reset event has not
> > > > > +  occurred.
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    enum:
> > > > > +      - samsung,s3c2410-wdt                   # for S3C2410
> > > > > +      - samsung,s3c6410-wdt                   # for S3C6410, S5PV210 and Exynos4
> > > > > +      - samsung,exynos5250-wdt                # for Exynos5250
> > > > > +      - samsung,exynos5420-wdt                # for Exynos5420
> > > > > +      - samsung,exynos7-wdt                   # for Exynos7
> > > > > +
> > > > > +  reg:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  interrupts:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  samsung,syscon-phandle:
> > > > > +    $ref: '/schemas/types.yaml#/definitions/phandle'
> > > > > +    description:
> > > > > +      Phandle to the PMU system controller node (in case of Exynos5250
> > > > > +      and Exynos5420).
> > > > > +
> > > > > +  timeout-sec:
> > > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > > +    description:
> > > > > +      Watchdog timeout in seconds.
> > > >
> > > > We need a common schema for this and the node name.
> > >
> > > Common schema in dt-schema or in Linux kernel bindings? If the latter,
> > > I can add it.
> >
> > In the kernel is fine.
> 
> Actually, Maxime has already done one.

I see. I'll use them then.


Best regards,
Krzysztof
