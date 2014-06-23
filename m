From: Dinh Nguyen <dinguyen@altera.com>
Subject: Re: [PATCH 0/2] ARM: socfpga: Update socfpga_defconfig and
 socfpga.dtsi
Date: Mon, 23 Jun 2014 13:46:40 -0500
Message-ID: <1403549200.9081.1.camel@linux-builds1>
References: <1403483462-21082-1-git-send-email-vbridgers2013@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1403483462-21082-1-git-send-email-vbridgers2013@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vince Bridgers <vbridgers2013@gmail.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, tthayer@altera.com, linux@arm.linux.org.uk, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, robh+dt@kernel.org, atull@altera.com, galak@codeaurora.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sun, 2014-06-22 at 19:31 -0500, Vince Bridgers wrote:
> This patch series updates the the socfpga_defconfig with a number of options,
> and updates the socfpga device tree with a field required for the reset
> controller driver. 
> 
> Vince Bridgers (2):
>   ARM: socfpga: Update socfpga_defconfig
>   ARM: socfpga: Add missing #reset-cells to socfpga device tree
> 
>  arch/arm/boot/dts/socfpga.dtsi     |    1 +
>  arch/arm/configs/socfpga_defconfig |   35 +++++++++++++++++++++++++++++++++++
>  2 files changed, 36 insertions(+)
> 

I've applied both patches to:

git.rocketboards.org/linux-socfpga-next.git for-next.

Thanks,
Dinh
