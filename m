From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] ARM64: dts: meson-gxl: Add support for HwaCom AmazeTV
Date: Mon, 27 Feb 2017 16:58:42 -0600
Message-ID: <20170227225842.pkix32wpcdien3cu@rob-hp-laptop>
References: <20170222163131.14136-1-carlo@caione.org>
 <20170222163131.14136-3-carlo@caione.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170222163131.14136-3-carlo@caione.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Carlo Caione <carlo@caione.org>
Cc: devicetree@vger.kernel.org, narmstrong@baylibre.com, khilman@baylibre.com, Carlo Caione <carlo@endlessm.com>, linux-amlogic@lists.infradead.org, linux@endlessm.com, afaerber@suse.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 22, 2017 at 05:31:31PM +0100, Carlo Caione wrote:
> From: Carlo Caione <carlo@endlessm.com>
> 
> This patch adds support for the HwaCom AmazeTV set-top-box. The
> hardware configuration is really similar to the other GXL boards but
> for this hardware we need to limit the max-frequency of the eMMC to
> have it working.
> 
> Signed-off-by: Carlo Caione <carlo@endlessm.com>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.txt  |   1 +
>  arch/arm64/boot/dts/amlogic/Makefile               |   1 +
>  .../boot/dts/amlogic/meson-gxl-hwacom-amazetv.dts  | 164 +++++++++++++++++++++
>  3 files changed, 166 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-hwacom-amazetv.dts

Acked-by: Rob Herring <robh@kernel.org>
