From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] arm64: dts: rename ns2.txt to brcm,ns2.txt
Date: Mon, 10 Oct 2016 16:44:43 -0500
Message-ID: <20161010214443.GA17115@rob-hp-laptop>
References: <1475959684-18085-1-git-send-email-scott.branden@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1475959684-18085-1-git-send-email-scott.branden@broadcom.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Scott Branden <scott.branden@broadcom.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sat, Oct 08, 2016 at 01:48:04PM -0700, Scott Branden wrote:
> Rename ns2.txt to brcm,ns2.txt to match naming convention followed
> by rest of Broadcom binding documentation.
> 
> Signed-off-by: Scott Branden <scott.branden@broadcom.com>
> ---
>  Documentation/devicetree/bindings/arm/bcm/{ns2.txt => brcm,ns2.txt} | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename Documentation/devicetree/bindings/arm/bcm/{ns2.txt => brcm,ns2.txt} (100%)

Acked-by: Rob Herring <robh@kernel.org>

> 
> diff --git a/Documentation/devicetree/bindings/arm/bcm/ns2.txt b/Documentation/devicetree/bindings/arm/bcm/brcm,ns2.txt
> similarity index 100%
> rename from Documentation/devicetree/bindings/arm/bcm/ns2.txt
> rename to Documentation/devicetree/bindings/arm/bcm/brcm,ns2.txt
> -- 
> 2.5.0
> 
