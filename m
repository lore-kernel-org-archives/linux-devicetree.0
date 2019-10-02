From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: watchdog: Convert Samsung SoC
 watchdog bindings to json-schema
Date: Wed, 2 Oct 2019 09:48:28 +0200
Message-ID: <20191002074828.GA6221@pi3>
References: <20190920162124.7036-1-krzk@kernel.org>
 <20191001222109.GA26050@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20191001222109.GA26050@bogus>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 01, 2019 at 05:21:09PM -0500, Rob Herring wrote:
> On Fri, Sep 20, 2019 at 06:21:22PM +0200, Krzysztof Kozlowski wrote:
> > Convert Samsung S3C/S5P/Exynos watchdog bindings to DT schema format
> > using json-schema.
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > 
> > ---
> > 
> > Changes since v1:
> > 1. Indent example with four spaces (more readable),
> > 2. Remove unneeded timeout-sec description and include generic bindings.
> > ---
> >  .../bindings/watchdog/samsung-wdt.txt         | 35 ----------
> >  .../bindings/watchdog/samsung-wdt.yaml        | 65 +++++++++++++++++++
> >  2 files changed, 65 insertions(+), 35 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/watchdog/samsung-wdt.txt
> >  create mode 100644 Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Hi Rob,

The generic watchdog YAML/DT schema is already in v5.4-rc1 so this can
go either trough you, or through watchdog tree.

Best regards,
Krzysztof
