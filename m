From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [RFCv2 6/9] dt-bindings: phy: meson-g12a-usb2-phy: convert to yaml
Date: Tue, 6 Aug 2019 21:21:32 +0200
Message-ID: <CAFBinCCqpSkzNUNz5pbct1G6TEsLF3AHLH=kqqXgwY2wzPCawA@mail.gmail.com>
References: <20190805120320.32282-1-narmstrong@baylibre.com>
 <20190805120320.32282-7-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190805120320.32282-7-narmstrong@baylibre.com>
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
Cc: kishon@ti.com, linux-amlogic@lists.infradead.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 5, 2019 at 2:05 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Now that we have the DT validation in place, let's convert the device tree
> bindings for the Amlogic G12A USB2 PHY over to a YAML schemas.
>
> While the original phy bindings specifies phy-supply as required,
> the examples and implementations makes it optional, thus phy-supply
> is not in the required list of attributes.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
