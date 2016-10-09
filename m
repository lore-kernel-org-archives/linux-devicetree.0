From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/3] Documentation: dt-bindings: rename meson-usb2-phy
 to meson8b-usb2-phy
Date: Sat, 8 Oct 2016 20:28:37 -0500
Message-ID: <20161009012837.GD18158@rob-hp-laptop>
References: <20160904213152.25837-1-martin.blumenstingl@googlemail.com>
 <20161001121900.1168-1-martin.blumenstingl@googlemail.com>
 <20161001121900.1168-3-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20161001121900.1168-3-martin.blumenstingl@googlemail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, johnyoun@synopsys.com, khilman@baylibre.com, kishon@ti.com, carlo@caione.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sat, Oct 01, 2016 at 02:18:59PM +0200, Martin Blumenstingl wrote:
> The corresponding driver only supports the USB PHY on Meson8b and GXBB
> SoCs. Newer SoC versions are using a different USB PHY implementation,
> which will mean that a new driver is required. Thus make sure that our
> naming is specific enough so it does not conflict with upcoming drivers.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../bindings/phy/{meson-usb2-phy.txt => meson8b-usb2-phy.txt}           | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename Documentation/devicetree/bindings/phy/{meson-usb2-phy.txt => meson8b-usb2-phy.txt} (95%)

Acked-by: Rob Herring <robh@kernel.org>
