From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH 0/3] arm: dts: zynq: Improvements to Zybo z7 board
Date: Tue, 17 Jul 2018 16:59:53 +0200
Message-ID: <6586da49-6171-b8b0-b6d7-0290b5470930@xilinx.com>
References: <20180712055049.5098-1-luaraneda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180712055049.5098-1-luaraneda@gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Luis Araneda <luaraneda@gmail.com>, Rob Herring <robh+dt@kernel.org>, Michal Simek <michal.simek@xilinx.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 12.7.2018 07:50, Luis Araneda wrote:
> This patchset corrects and improves the device-tree
> of the Zybo Z7 board
> 
> The first patch correct the RAM size
> ( supersedes https://lkml.org/lkml/2018/6/26/965 )
> 
> The second patch introduce the use of GPIO constants
> to replace a literal
> 
> Finally, the third patch adds a gpio-leds node with
> one LED
> 
> Luis Araneda (3):
>   arm: dts: zynq: Fix memory size on the Zybo Z7 board
>   arm: dts: zynq: Use gpio constants for the Zybo Z7 board
>   arm: dts: zynq: Add LEDs to the Zybo Z7 board
> 
>  arch/arm/boot/dts/zynq-zybo-z7.dts | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 

Applied all.

Thanks,
Michal
