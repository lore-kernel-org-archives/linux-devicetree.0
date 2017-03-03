From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V2 1/4] dt-bindings: display:
 megachips-stdpxxxx-ge-b850v3-fw
Date: Fri, 3 Mar 2017 00:21:22 -0600
Message-ID: <20170303062122.qa2jwrfwh6kqp77m@rob-hp-laptop>
References: <cover.1488287639.git.peter.senna@collabora.com>
 <85c405428279c1c8e062d825112db800342a98ca.1488287639.git.peter.senna@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <85c405428279c1c8e062d825112db800342a98ca.1488287639.git.peter.senna@collabora.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Peter Senna Tschudin <peter.senna@collabora.com>
Cc: mark.rutland@arm.com, heiko@sntech.de, airlied@linux.ie, daniel.vetter@ffwll.ch, peter.senna@gmail.com, dri-devel@lists.freedesktop.org, tiwai@suse.com, thierry.reding@gmail.com, laurent.pinchart@ideasonboard.com, ykk@rock-chips.com, jslaby@suse.cz, martyn.welch@collabora.co.uk, architt@codeaurora.org, mchehab@osg.samsung.com, linux@armlinux.org.uk, javier@dowhile0.org, treding@nvidia.com, Rask Ingemann Lambertsen <ccc94453@vip.cybercity.dk>, linux@roeck-us.net, martin.donnelly@ge.com, devicetree@vger.kernel.org, p.zabel@pengutronix.de, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, eballetbo@gmail.com, Fabio Estevam <fabio.estevam@nxp.com>, rmk+kernel@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, kernel@pengutronix.de, galak@codeaurora.org, enric.balletbo@collabora.com, akpm@linux-foundation.org, shaw
List-Id: devicetree@vger.kernel.org

On Tue, Feb 28, 2017 at 03:28:10PM +0100, Peter Senna Tschudin wrote:
> Devicetree binding documentation for the second video output
> of the GE B850v3:
>    STDP4028-ge-b850v3-fw bridges (LVDS-DP)
>    STDP2690-ge-b850v3-fw bridges (DP-DP++)
> 
> Added entry for MegaChips at:
>  Documentation/devicetree/bindings/vendor-prefixes.txt
> 
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Martyn Welch <martyn.welch@collabora.co.uk>
> Cc: Martin Donnelly <martin.donnelly@ge.com>
> Cc: Javier Martinez Canillas <javier@dowhile0.org>
> Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Fabio Estevam <fabio.estevam@nxp.com>
> Signed-off-by: Peter Senna Tschudin <peter.senna@collabora.com>
> ---
> Changes from V1:
>  - New subject
>  - Moved binding documentation from bindings/video/ to bindings/display/bridge/
>  - Reworded to describe hardware instead of the driver
>  - Reformated the bindings to have one set of required properties per device
>  - Updated reg description
>  - Defined number of ports and what they are for
> 
>  .../bridge/megachips-stdpxxxx-ge-b850v3-fw.txt     | 94 ++++++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.txt        |  1 +
>  2 files changed, 95 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt

Acked-by: Rob Herring <robh@kernel.org>
