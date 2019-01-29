From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v3 0/3] Add reset driver support for ZynqMP
Date: Tue, 29 Jan 2019 14:10:02 +0100
Message-ID: <a33b5188-e926-7c02-8a91-b4c6ab81ad7c@xilinx.com>
References: <20190125074654.10950-1-nava.manne@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190125074654.10950-1-nava.manne@xilinx.com>
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
To: Nava kishore Manne <nava.manne@xilinx.com>, p.zabel@pengutronix.de, robh+dt@kernel.org, mark.rutland@arm.com, michal.simek@xilinx.com, rajanv@xilinx.com, jollys@xilinx.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, chinnikishore369@gmail.com
List-Id: devicetree@vger.kernel.org

On 25. 01. 19 8:46, Nava kishore Manne wrote:
> Nava kishore Manne (3):
>   firmware: xilinx: Add reset API's
>   dt-bindings: reset: Add bindings for ZynqMP reset driver
>   reset: reset-zynqmp: Adding support for Xilinx zynqmp reset
>     controller.
> 
>  .../bindings/reset/xlnx,zynqmp-reset.txt      |  52 +++++++
>  drivers/firmware/xilinx/zynqmp.c              |  40 ++++++
>  drivers/reset/Makefile                        |   1 +
>  drivers/reset/reset-zynqmp.c                  | 114 +++++++++++++++
>  .../dt-bindings/reset/xlnx-zynqmp-resets.h    | 130 +++++++++++++++++
>  include/linux/firmware/xlnx-zynqmp.h          | 136 ++++++++++++++++++
>  6 files changed, 473 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/xlnx,zynqmp-reset.txt
>  create mode 100644 drivers/reset/reset-zynqmp.c
>  create mode 100644 include/dt-bindings/reset/xlnx-zynqmp-resets.h
> 

Applied all to
https://github.com/Xilinx/linux-xlnx/commits/zynqmp/soc

Thanks,
Michal
