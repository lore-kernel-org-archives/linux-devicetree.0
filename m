From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V7 01/11] dt-bindings: xilinx-sdfec: Add SDFEC binding
Date: Tue, 11 Jun 2019 17:17:45 -0600
Message-ID: <20190611231745.GA26265@bogus>
References: <1560274185-264438-1-git-send-email-dragan.cvetic@xilinx.com>
 <1560274185-264438-2-git-send-email-dragan.cvetic@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1560274185-264438-2-git-send-email-dragan.cvetic@xilinx.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org, Dragan Cvetic <dragan.cvetic@xilinx.com>, michal.simek@xilinx.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, Derek Kiernan <derek.kiernan@xilinx.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, 11 Jun 2019 18:29:35 +0100, Dragan Cvetic wrote:
> Add the Soft Decision Forward Error Correction (SDFEC) Engine
> bindings which is available for the Zynq UltraScale+ RFSoC
> FPGA's.
> 
> Signed-off-by: Dragan Cvetic <dragan.cvetic@xilinx.com>
> Signed-off-by: Derek Kiernan <derek.kiernan@xilinx.com>
> ---
>  .../devicetree/bindings/misc/xlnx,sd-fec.txt       | 58 ++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/misc/xlnx,sd-fec.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
