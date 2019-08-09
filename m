From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 7/9] dt-bindings: phy: meson-g12a-usb3-pcie-phy: convert
 to yaml
Date: Fri, 9 Aug 2019 21:55:16 +0200
Message-ID: <CAFBinCC7UGG014D6xt97SZ-WjR=rTLvag7F+DXG6byxaOEFHJg@mail.gmail.com>
References: <20190808085139.21438-1-narmstrong@baylibre.com>
 <20190808085139.21438-8-narmstrong@baylibre.com>
 <CAFBinCBnVdTxWgqmnrPo-5uZ5gxy7p68w0PUa=_42fYxhVrDXQ@mail.gmail.com>
 <2e6ade0e-175c-e77c-e767-28f4bbfbe575@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <2e6ade0e-175c-e77c-e767-28f4bbfbe575@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, kishon@ti.com, robh+dt@kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 9, 2019 at 9:00 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Hi,
>
> On 08/08/2019 21:50, Martin Blumenstingl wrote:
> > On Thu, Aug 8, 2019 at 10:54 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
> >>
> >> Now that we have the DT validation in place, let's convert the device tree
> >> bindings for the Amlogic G12A USB3 + PCIE Combo PHY over to a YAML schemas.
> >>
> >> While the original phy bindings specifies phy-supply as required,
> >> the examples and implementations makes it optional, thus phy-supply
> >> is not present in the properties and required lists.
> > nit-pick: the original bindings didn't mention the phy-supply property at all
> > I'm not sure if you have to re-send it, maybe this can be fixed up
> > while applying?
>
> It didn't, but the phy.txt made it mandatory, but was optional in all examples
> and implementation, thus rob asked me to precise it in the commit log.
sorry, I missed that
my Reviewed-by still stands - thanks for pointing it out (again)
