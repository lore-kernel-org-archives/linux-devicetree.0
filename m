From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] ARM: dts: NSP: Add mailbox (PDC) to NSP
Date: Mon, 27 Feb 2017 17:47:20 -0600
Message-ID: <20170227234720.jaxsnxbjcbzhf7hn@rob-hp-laptop>
References: <1487796146-14690-1-git-send-email-steven.lin1@broadcom.com>
 <1487796146-14690-3-git-send-email-steven.lin1@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1487796146-14690-3-git-send-email-steven.lin1@broadcom.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Steve Lin <steven.lin1@broadcom.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, scott.branden@broadcom.com, rob.rice@broadcom.com, jassisinghbrar@gmail.com, linux@armlinux.org.uk, jon.mason@broadcom.com, ray.jui@broadcom.com, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 22, 2017 at 03:42:26PM -0500, Steve Lin wrote:
> Adds mailbox / PDC to NSP device tree.  Needs new compatibility string
> to differentiate from NS2 version.
> 
> Signed-off-by: Steve Lin <steven.lin1@broadcom.com>
> ---
>  .../devicetree/bindings/mailbox/brcm,iproc-pdc-mbox.txt          | 6 ++++--
>  arch/arm/boot/dts/bcm-nsp.dtsi                                   | 9 +++++++++
>  2 files changed, 13 insertions(+), 2 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
