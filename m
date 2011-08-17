From: Shawn Guo <shawn.guo@freescale.com>
Subject: Re: [RFC PATCH 0/2] WIP: generic OF pinmux binding
Date: Wed, 17 Aug 2011 22:38:13 +0800
Message-ID: <20110817143811.GA11097@S2100-06.ap.freescale.net>
References: <1313581648-22303-1-git-send-email-jamie@jamieiles.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1313581648-22303-1-git-send-email-jamie@jamieiles.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jamie Iles <jamie@jamieiles.com>
Cc: swarren@nvidia.com, sshtylyov@mvista.com, konkers@android.com, marek.belisko@gmail.com, devicetree-discuss@lists.ozlabs.org, grant.likely@secretlab.ca, ccross@android.com, linux@arm.linux.org.uk, linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 17, 2011 at 12:47:26PM +0100, Jamie Iles wrote:
> To avoid going too far in the wrong direction I thought I'd post what I
> have so far for a generic pinmux binding.

Unfortunately, there is not much that i.mx iomuxc can leverage, even
for mux-function.  The following is the mux configuration for one
i.mx pin/pad.  Other than a string, a integer will work much better.

MUX_MODE (bit 2-0): Select 1 of 7 iomux modes to be used for pad: EIM_DA9.
000 Select mux mode: ALT0 mux port: WEIM_DA_A[9] of instance: weim.
001 Select mux mode: ALT1 mux port: DISP1_DAT[0] of instance: ipu1.
010 Select mux mode: ALT2 mux port: CSI1_D[0] of instance: ipu2.
011 Select mux mode: ALT3 mux port: DPHY_TEST_OUT[11] of instance: mipi_core.
101 Select mux mode: ALT5 mux port: GPIO[9] of instance: gpio3.
110 Select mux mode: ALT6 mux port: HDATA[23] of instance: tpsmp.
111 Select mux mode: ALT7 mux port: BT_CFG[9] of instance: src.

> Essentially it's just
> Stephen's nvidia binding but with the nvidia specifics abstracted out so
> the common loop can be used for other platforms.  This approach works
> nicely for picoxcell too.
> 
> For more esoteric bindings, such as pull strength, these could be
> handled in the platform specific configuration function.
> 

-- 
Regards,
Shawn
