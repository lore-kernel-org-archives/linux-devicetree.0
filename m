From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] ARM: dts: imx6q-apalis: mux RESET_MOCI# signal
Date: Mon, 10 Sep 2018 09:09:14 +0800
Message-ID: <20180910010913.GD21992@dragon>
References: <20180906234658.12205-1-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180906234658.12205-1-stefan@agner.ch>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stefan Agner <stefan@agner.ch>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, marcel.ziswiler@toradex.com, s.hauer@pengutronix.de, linux-kernel@vger.kernel.org, robh+dt@kernel.org, max.krummenacher@toradex.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 06, 2018 at 04:46:58PM -0700, Stefan Agner wrote:
> The pinctrl properties on the IOMUXC node get overwritten by the
> carrier board level device tree, hence the pinctrl_reset_moci
> pinctrl does not get applied.
> 
> Associate the pinctrl_reset_moci pinctrl with the PCIe node where
> we also make use of the pin as a reset GPIO.
> 
> Since the pin is muxed as a GPIO by default not muxing it explicitly
> worked fine in practise.
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>

Applied, thanks.
