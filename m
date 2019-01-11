From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: power: Add ZynqMP power domain
 bindings
Date: Fri, 11 Jan 2019 14:09:39 -0600
Message-ID: <20190111200939.GA28260@bogus>
References: <1546638982-12954-1-git-send-email-jollys@xilinx.com>
 <1546638982-12954-2-git-send-email-jollys@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1546638982-12954-2-git-send-email-jollys@xilinx.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jolly Shah <jolly.shah@xilinx.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Rajan Vaja <rajan.vaja@xilinx.com>, nava.manne@xilinx.com, michal.simek@xilinx.com, linux-kernel@vger.kernel.org, Jolly Shah <jollys@xilinx.com>, rajanv@xilinx.com, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, 4 Jan 2019 13:56:19 -0800, Jolly Shah wrote:
> From: Rajan Vaja <rajan.vaja@xilinx.com>
> 
> Add documentation to describe ZynqMP power domain bindings.
> 
> Signed-off-by: Rajan Vaja <rajan.vaja@xilinx.com>
> Signed-off-by: Jolly Shah <jollys@xilinx.com>
> ---
>  .../bindings/power/xlnx,zynqmp-genpd.txt           | 34 +++++++++++++++++++
>  include/dt-bindings/power/xlnx-zynqmp-power.h      | 39 ++++++++++++++++++++++
>  2 files changed, 73 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/xlnx,zynqmp-genpd.txt
>  create mode 100644 include/dt-bindings/power/xlnx-zynqmp-power.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
