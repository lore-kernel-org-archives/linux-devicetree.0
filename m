From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 15/23] dt-bindings: pci: mobiveil: change gpio_slave and
 apb_csr to optional
Date: Mon, 12 Nov 2018 12:12:47 -0600
Message-ID: <5bea0eb7.1c69fb81.dd309.4a26@mx.google.com>
References: <20181106131807.29951-1-Zhiqiang.Hou@nxp.com>
 <20181106131807.29951-16-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20181106131807.29951-16-Zhiqiang.Hou@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, Xiaowei Bao <xiaowei.bao@nxp.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "l.subrahmanya@mobiveil.co.in" <l.subrahmanya@mobiveil.co.in>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Leo Li <leoyang.li@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 06, 2018 at 01:20:41PM +0000, Z.q. Hou wrote:
> From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> 
> Change the "gpio_slave" and "apb_csr" to optional, the "gpio_slave"
> is not used in current code, and "apb_csr" is not used by some
> platorms.
> 
> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> ---
>  Documentation/devicetree/bindings/pci/mobiveil-pcie.txt | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
