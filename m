From: Rob Herring <robh@kernel.org>
Subject: Re: [RFC PATCH 4/5] dt-bindings: soc/fsl: Update reserved memory
 binding for QBMan
Date: Mon, 3 Apr 2017 10:42:29 -0500
Message-ID: <20170403154229.mf63zeiwv5naxyrr@rob-hp-laptop>
References: <1490822037-6752-1-git-send-email-roy.pledge@nxp.com>
 <1490822037-6752-5-git-send-email-roy.pledge@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1490822037-6752-5-git-send-email-roy.pledge@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Roy Pledge <roy.pledge@nxp.com>
Cc: devicetree@vger.kernel.org, madalin.bucur@nxp.com, robin.murphy@arm.com, oss@buserror.net, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Mar 29, 2017 at 05:13:56PM -0400, Roy Pledge wrote:
> Updates the QMan and BMan device tree bindings for reserved memory
> nodes. This makes the reserved memory allocation compatiable with

s/compatiable/compatible/

> the shared-dma-pool usage.

This change is not backwards compatible. Please state that and explain 
why that is okay. If PPC needs to not change, then the old strings and 
properties should remain, but deprecated.

> 
> Signed-off-by: Roy Pledge <roy.pledge@nxp.com>
> ---
>  Documentation/devicetree/bindings/soc/fsl/bman.txt | 10 +++++-----
>  Documentation/devicetree/bindings/soc/fsl/qman.txt | 16 +++++++++-------
>  2 files changed, 14 insertions(+), 12 deletions(-)
