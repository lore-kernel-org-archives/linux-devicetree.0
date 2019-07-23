From: Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH v4 0/5] soc: ti: k3: Allow for exclusive and shared
 device requests
Date: Tue, 23 Jul 2019 06:42:13 -0500
Message-ID: <20190723114213.ogypuwcp3mw3vmcn@kahuna>
References: <20190722050757.29893-1-lokeshvutla@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190722050757.29893-1-lokeshvutla@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lokesh Vutla <lokeshvutla@ti.com>
Cc: Device Tree Mailing List <devicetree@vger.kernel.org>, Sekhar Nori <nsekhar@ti.com>, Tero Kristo <t-kristo@ti.com>, Rob Herring <robh+dt@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 10:37-20190722, Lokesh Vutla wrote:
> Sysfw provides an option for requesting exclusive access for a
> device using the flags MSG_FLAG_DEVICE_EXCLUSIVE. If this flag is
> not used, the device is meant to be shared across hosts. Once a device
> is requested from a host with this flag set, any request to this
> device from a different host will be nacked by sysfw.
> 
> Current tisci firmware and pm drivers always requests for device with
> exclusive permissions set. But this is not be true for certain devices
> that are expcted to be shared across different host contexts.
> So add support for getting the shared or exclusive permissions from DT
> and request firmware accordingly.
> 
> Changes since v3: https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=103447
> - Rebased on top of v5.3-rc1
> - Updated power-domain cells for j721e.
> - Mark the console uart as shared in am65x-base-board
> - Added Reviewed-by from Rob

[...]

Looks good to me.

Reviewed-by: Nishanth Menon <nm@ti.com>

-- 
Regards,
Nishanth Menon
