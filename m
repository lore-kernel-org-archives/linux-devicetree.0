From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/4] arm64: arch_timer: Add device tree binding for
 hisilicon-161601 erratum
Date: Mon, 31 Oct 2016 00:10:39 -0500
Message-ID: <20161031051039.vkuykdc4sgrh6scz@rob-hp-laptop>
References: <1477553651-13428-1-git-send-email-dingtianhong@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1477553651-13428-1-git-send-email-dingtianhong@huawei.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ding Tianhong <dingtianhong@huawei.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, marc.zyngier@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, stuart.yoder@nxp.com, linuxarm@huawei.com, oss@buserror.net, shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Oct 27, 2016 at 03:34:08PM +0800, Ding Tianhong wrote:
> This erratum describes a bug in logic outside the core, so MIDR can't be
> used to identify its presence, and reading an SoC-specific revision
> register from common arch timer code would be awkward.  So, describe it
> in the device tree.
> 
> v2: Use the new erratum name and update the description.
> 
> Signed-off-by: Ding Tianhong <dingtianhong@huawei.com>
> ---
>  Documentation/devicetree/bindings/arm/arch_timer.txt | 8 ++++++++
>  1 file changed, 8 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
