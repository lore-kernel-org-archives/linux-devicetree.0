From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 0/5] Add initial Bitmain BM1880 SoC/Board support
Date: Sat, 26 Jan 2019 20:47:33 +0530
Message-ID: <20190126151733.GA15434@Mani-XPS-13-9360>
References: <20190126041041.13173-1-manivannan.sadhasivam@linaro.org>
 <20190126150320.GB20679@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190126150320.GB20679@lunn.ch>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: devicetree@vger.kernel.org, arnd@arndb.de, linux-kernel@vger.kernel.org, amit.kucheria@linaro.org, darren.tsao@bitmain.com, robh+dt@kernel.org, haitao.suo@bitmain.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Andrew,

On Sat, Jan 26, 2019 at 04:03:20PM +0100, Andrew Lunn wrote:
> On Sat, Jan 26, 2019 at 09:40:36AM +0530, Manivannan Sadhasivam wrote:
> > Hello,
> > 
> > This patchset adds initial support for Bitmain BM1880 SoC and Sophon
> > Edge board. BM1880 SoC consists of a Dual Core ARM Cortex A53 Application
> > processor subsystem, a single core RISC-V subsystem and a Tensor
> > Processor subsystem.
> 
> Hi Manivannan
> 
> Interesting combination of CPUs. 
> 
> > This patchset adds support for only ARM Cortex A53 Application
> > processor subsystem with UART, which enables the board to boot into
> > initramfs with 2 CPUs.
> 
> Looking forward, what sharing do you expect at the device tree level?
> 
> Looking at 
> 
> https://sophon-file.bitmain.com.cn/sophon-prod/drive/18/11/06/19/BM1880%20product%20brief%20V0.04_Chinese%20versionV0.06.pdf
> 
> it appears all the devices can be shared between the CPUs. So do you
> plan to have a shared .dtsi file somewhere? 
> 
> Is ARCH_BITMAIN going to be both ARM64 and RISC-V?
> 

We don't have any plan to add support for RISC-V subsystem. Moreover,
from the SoC product brief it look like the RISC-V core is a MCU grade
core, so I doubt whether we can run linux on it! It might be a candidate
for RTOS.

For now, ARCH_BITMAIN is going to have only ARM64 support.

Thanks,
Mani

>    Thanks
> 	Andrew
