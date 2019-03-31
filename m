From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: clock: meson8b: drop the "ABP" clock
 definition
Date: Sun, 31 Mar 2019 01:41:01 -0500
Message-ID: <5ca06100.1c69fb81.a71f5.6cb5@mx.google.com>
References: <20190319214123.27219-1-martin.blumenstingl@googlemail.com>
 <20190319214123.27219-2-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190319214123.27219-2-martin.blumenstingl@googlemail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, narmstrong@baylibre.com, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, robh+dt@kernel.org, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
List-Id: devicetree@vger.kernel.org

On Tue, 19 Mar 2019 22:41:23 +0100, Martin Blumenstingl wrote:
> Commit 8e1dd17c8b0e3f ("dt-bindings: clock: meson8b: export the CPU post
> dividers") added a new clock ID "CLKID_ABP" which contains a typo. This
> was fixed by adding a new (typo-free) #define CLKID_APB in
> commit 40d08f774c17ad ("dt-bindings: clock: meson8b: add APB clock
> definition").
> Now that the new #define is used by the driver we can remove the old
> one (because the old one is not used anywhere).
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  include/dt-bindings/clock/meson8b-clkc.h | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
