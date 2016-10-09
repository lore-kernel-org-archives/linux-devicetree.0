From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/3] Documentation: dt-bindings: update the
 meson-usb2-phy example
Date: Sat, 8 Oct 2016 20:28:25 -0500
Message-ID: <20161009012825.GC18158@rob-hp-laptop>
References: <20160904213152.25837-1-martin.blumenstingl@googlemail.com>
 <20161001121900.1168-1-martin.blumenstingl@googlemail.com>
 <20161001121900.1168-2-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20161001121900.1168-2-martin.blumenstingl@googlemail.com>
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

On Sat, Oct 01, 2016 at 02:18:58PM +0200, Martin Blumenstingl wrote:
> Update the example so the node name uses a dash (instead of an
> underscore) as per convention.
> Additionally it updates the example register offset to a real example
> (the old value was taken from a draft where there was an additional PHY
> bus).
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  Documentation/devicetree/bindings/phy/meson-usb2-phy.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
