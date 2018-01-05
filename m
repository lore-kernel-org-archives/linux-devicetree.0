From: Jiaying Liang <jliang@xilinx.com>
Subject: RE: [PATCH v3 2/2] dt-bindings: mailbox: Add Xilinx IPI Mailbox
Date: Fri, 5 Jan 2018 22:15:02 +0000
Message-ID: <BY1PR0201MB0885D19DEBB9AAF572DEE9A7B01C0@BY1PR0201MB0885.namprd02.prod.outlook.com>
References: <1515109891-17133-1-git-send-email-jliang@xilinx.com>
 <1515109891-17133-3-git-send-email-jliang@xilinx.com>
 <20180105153146.lgxlhfsql5tq2kn5@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180105153146.lgxlhfsql5tq2kn5@rob-hp-laptop>
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
To: Rob Herring <robh@kernel.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>, "michal.simek@xilinx.com" <michal.simek@xilinx.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Rob Herring [mailto:robh@kernel.org]
> Sent: Friday, January 05, 2018 7:32 AM
> To: Jiaying Liang <jliang@xilinx.com>
> Cc: jassisinghbrar@gmail.com; michal.simek@xilinx.com;
> mark.rutland@arm.com; linux-arm-kernel@lists.infradead.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; Jiaying Liang
> <jliang@xilinx.com>
> Subject: Re: [PATCH v3 2/2] dt-bindings: mailbox: Add Xilinx IPI Mailbox
> 
> On Thu, Jan 04, 2018 at 03:51:31PM -0800, Wendy Liang wrote:
> > Xilinx ZynqMP IPI(Inter Processor Interrupt) is a hardware block in
> > ZynqMP SoC used for the communication between various processor
> > systems.
> >
> > Signed-off-by: Wendy Liang <jliang@xilinx.com>
> > ---
> >  .../bindings/mailbox/xlnx,zynqmp-ipi-mailbox.txt   | 104
> +++++++++++++++++++++
> >  1 file changed, 104 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.txt
> 
> Please add acks and reviewed-by's when posting new versions.
[Wendy] Thanks, will add this in the next version.
