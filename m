From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] arm: dts: zynq: Add Digilent Zybo Z7 board
Date: Mon, 5 Mar 2018 18:00:17 -0600
Message-ID: <20180306000017.y444gu3aie2f3c2k@rob-hp-laptop>
References: <20180228022552.9088-1-nobuhiro.iwamatsu@cybertrust.co.jp>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180228022552.9088-1-nobuhiro.iwamatsu@cybertrust.co.jp>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Nobuhiro Iwamatsu <nobuhiro.iwamatsu@cybertrust.co.jp>
Cc: devicetree@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 28, 2018 at 11:25:52AM +0900, Nobuhiro Iwamatsu wrote:
> This add a DTS for the Digilent Zybo Z7 board.
> This board is the successor board of Zybo, these are almost the same except
> for ps-clk-frequency specifications.
> 
> Signed-off-by: Nobuhiro Iwamatsu <nobuhiro.iwamatsu@cybertrust.co.jp>
> ---
>  v2:
>    - Fix SPDX format
>    - Rebase linux-xlnx/tree/zynq/dt
>    - Add digilent,zynq-zybo-z7 compatible string
>    - Fix memory node.
> 
>  Documentation/devicetree/bindings/arm/xilinx.txt |  3 ++
>  arch/arm/boot/dts/Makefile                       |  3 +-
>  arch/arm/boot/dts/zynq-zybo-z7.dts               | 58 ++++++++++++++++++++++++
>  3 files changed, 63 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/zynq-zybo-z7.dts

Reviewed-by: Rob Herring <robh@kernel.org>
