From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: rtc: new binding for Amlogic VRTC
Date: Thu, 22 Aug 2019 23:11:34 +0200
Message-ID: <20190822211134.GA27031@piout.net>
References: <20190812232850.8016-1-khilman@kernel.org>
 <20190812232850.8016-2-khilman@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190812232850.8016-2-khilman@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kevin Hilman <khilman@kernel.org>
Cc: linux-rtc@vger.kernel.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
List-Id: devicetree@vger.kernel.org

On 12/08/2019 16:28:49-0700, Kevin Hilman wrote:
> From: Kevin Hilman <khilman@baylibre.com>
> 
> Add binding fo the new VRTC driver for Amlogic SoCs.  The 64-bit
> family of SoCs only has an RTC managed by firmware, and this VRTC
> driver provides the simple, one-register firmware interface.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
> ---
>  .../bindings/rtc/rtc-meson-vrtc.txt           | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/rtc-meson-vrtc.txt
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
