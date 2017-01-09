From: Santosh Shilimkar <santosh.shilimkar@oracle.com>
Subject: Re: [PATCH 0/5] Reset Controller Nodes for TI Keystone platforms
Date: Mon, 9 Jan 2017 12:08:01 -0800
Message-ID: <efd6ca8e-8c5d-0e24-1cb9-ba412cec1fce@oracle.com>
References: <20170109194358.27271-1-s-anna@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170109194358.27271-1-s-anna@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Suman Anna <s-anna@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>
Cc: devicetree@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Andrew Davis <afd@ti.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 1/9/2017 11:43 AM, Suman Anna wrote:
> Hi Santosh,
>
> This patch adds the reset controller nodes and the corresponding
> reset data for TI Keystone 66AK2H, 66AK2L and 66AK2E SoCs. These
> resets are for the DSPs on these SoCs, and are the last dependencies
> before the keystone remoteproc driver can be added.
>
> All these SoCs will use the ti-syscon-reset driver which is already
> part of mainline kernel. The bindings for the same can be found in
> Documentation/devicetree/bindings/reset/ti-syscon-reset.txt file.
> Note that the other Keystone 66AK2G SoC will use a different TI-SCI
> based reset driver, so will be submitted separately once the TI-SCI
> dependencies make it into mainline.
>
> Patches are based on top of 4.10-rc1 plus the MSM-RAM DT node series
> that you have already picked up. Patch 1 enable the Reset Framework
> for Keystone platforms, and remaining patches add the required DT
> nodes.
>
Ok. I will let this series be on list for a week or so for any
comments. After that will pick this up and push it out to next.

Regards,
Santosh
