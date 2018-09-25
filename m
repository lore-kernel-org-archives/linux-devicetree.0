From: Rob Herring <robh@kernel.org>
Subject: Re: [RFC PATCH 11/40] dt-bindings: PCI: keystone: Add bindings to get
 device control module
Date: Tue, 25 Sep 2018 04:25:00 -0700
Message-ID: <5baa1b0c.1c69fb81.efde0.46e9@mx.google.com>
References: <20180921102155.22839-1-kishon@ti.com>
 <20180921102155.22839-12-kishon@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180921102155.22839-12-kishon@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>, Joao Pinto <Joao.Pinto@synopsys.com>, devicetree@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>, Santosh Shilimkar <ssantosh@kernel.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>, Tero Kristo <t-kristo@ti.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Murali Karicheri <m-karicheri2@ti.com>, Gustavo.Pimentel@synopsys.com, Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, 21 Sep 2018 15:51:26 +0530, Kishon Vijay Abraham I wrote:
> Add bindings to get device control module which has the device id and
> vendor id to be configured in the keystone PCIe controller.
> 
> Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
> ---
>  Documentation/devicetree/bindings/pci/pci-keystone.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
