From: Dinh Nguyen <dinguyen@kernel.org>
Subject: Re: [PATCH 0/2] ARM: dts: socfpga: Add support for PMU on
 Arria5/Cyclone5
Date: Wed, 8 Mar 2017 09:19:56 -0600
Message-ID: <d723d5df-a700-3781-e8a5-4e57185585f8@kernel.org>
References: <1488297132-21553-1-git-send-email-florian.vaussard@heig-vd.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1488297132-21553-1-git-send-email-florian.vaussard@heig-vd.ch>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Florian Vaussard <florian.vaussard@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Alberto Dassatti <alberto.dassatti@heig-vd.ch>, linux-kernel@vger.kernel.org, Florian Vaussard <florian.vaussard@heig-vd.ch>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org



On 02/28/2017 09:52 AM, Florian Vaussard wrote:
> Hi,
> 
> These patches add suport for ARM Performance Monitor Units on Arria5 and
> Cyclone5 SoCFPGA. This was tested on a Cyclone 5 SoC DK board.
> 
> Side note: the same change can be probably applied to Arria10 as well,
> but we do not have the hardware here to test.
> 
> Regards,
> Florian
> 
> Florian Vaussard (2):
>   ARM: dts: socfpga: Add labels for CPU nodes
>   ARM: dts: socfpga: Add support for PMU
> 
>  arch/arm/boot/dts/socfpga.dtsi | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 

Applied!

Thanks,

Dinh
