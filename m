From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: watchdog: Convert Samsung SoC
 watchdog bindings to json-schema
Date: Wed, 2 Oct 2019 09:29:56 -0500
Message-ID: <CAL_Jsq+KG-7G-VF_hjgugvAP+CrNb+fxy1yca6SC6G3M_WGYiQ@mail.gmail.com>
References: <20190920162124.7036-1-krzk@kernel.org> <20191001222109.GA26050@bogus>
 <20191002074828.GA6221@pi3>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191002074828.GA6221@pi3>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@baylibre.com>, LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>, devicetree@vger.kernel.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linux-amlogic@lists.infradead.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 2, 2019 at 2:48 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Tue, Oct 01, 2019 at 05:21:09PM -0500, Rob Herring wrote:
> > On Fri, Sep 20, 2019 at 06:21:22PM +0200, Krzysztof Kozlowski wrote:
> > > Convert Samsung S3C/S5P/Exynos watchdog bindings to DT schema format
> > > using json-schema.
> > >
> > > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > >
> > > ---
> > >
> > > Changes since v1:
> > > 1. Indent example with four spaces (more readable),
> > > 2. Remove unneeded timeout-sec description and include generic bindings.
> > > ---
> > >  .../bindings/watchdog/samsung-wdt.txt         | 35 ----------
> > >  .../bindings/watchdog/samsung-wdt.yaml        | 65 +++++++++++++++++++
> > >  2 files changed, 65 insertions(+), 35 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/watchdog/samsung-wdt.txt
> > >  create mode 100644 Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> >
> > Reviewed-by: Rob Herring <robh@kernel.org>
>
> Hi Rob,
>
> The generic watchdog YAML/DT schema is already in v5.4-rc1 so this can
> go either trough you, or through watchdog tree.

Okay, I've applied the series.

Rob
