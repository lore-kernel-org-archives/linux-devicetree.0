From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 0/2] arm64: dts: r8a77965: salvator-x(s): Enable s2ram
 and PMIC
Date: Tue, 27 Feb 2018 09:09:10 +0100
Message-ID: <20180227080910.oevdck7upggudxks@verge.net.au>
References: <1519659743-27027-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1519659743-27027-1-git-send-email-geert+renesas@glider.be>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 26, 2018 at 04:42:21PM +0100, Geert Uytterhoeven wrote:
> 	Hi Simon, Magnus,
> 
> This patch populates the placeholders in the R-Car M3-N DTS file for the
> IIC Bus Interface for DVFS (IIC for DVFS) and Interrupt Controller for
> External Devices (INTC-EX) device nodes.
> 
> After applying the first patch, you can start using s2ram (PSCI
> suspend), like on other Salvator-X(S) boards
> (https://elinux.org/R-Car/Boards/Salvator-XS#PSCI_System_Suspend).
> 
> The second patch enables dependencies for the BD9571MWV PMIC device,
> which is described in salvator-common.dtsi. Note that operation still
> depends on "[PATCH] pinctrl: sh-pfc: r8a77965: Add support for INTC-EX
> IRQ pins".
> 
> Thanks!

Thanks, applied.
