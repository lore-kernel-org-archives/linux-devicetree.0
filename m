From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/3] bindings: add compatible "fsl, ls1043-ucc-hdlc" to
 bindings
Date: Sat, 8 Oct 2016 20:28:18 -0500
Message-ID: <20161009012818.GA18158@rob-hp-laptop>
References: <1475034038-7217-1-git-send-email-qiang.zhao@nxp.com>
 <1475034038-7217-3-git-send-email-qiang.zhao@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1475034038-7217-3-git-send-email-qiang.zhao@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Zhao Qiang <qiang.zhao@nxp.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, catalin.marinas@arm.com, will.deacon@arm.com, xiaobo.xie@nxp.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 28, 2016 at 11:40:38AM +0800, Zhao Qiang wrote:
> Signed-off-by: Zhao Qiang <qiang.zhao@nxp.com>
> ---
>  Documentation/devicetree/bindings/soc/fsl/cpm_qe/network.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/network.txt b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/network.txt
> index 03c7416..325e3e2 100644
> --- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/network.txt
> +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/network.txt
> @@ -45,7 +45,7 @@ Example:
>  * HDLC
>  
>  Currently defined compatibles:
> -- fsl,ucc-hdlc
> +- "fsl,ucc-hdlc", "fsl,ls1043-ucc-hdlc"

What's the relationship of these 2 compatibles? Both should be specified 
for LS1043 or ...? The former only applies to certain SoCs? Rework this 
text to answer these questions.

Rob
