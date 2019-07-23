From: Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH 1/4] arm64: dts: ti: k3-am65-main: Add mailbox cluster
 nodes
Date: Tue, 23 Jul 2019 17:10:16 -0500
Message-ID: <20190723221016.ozelg3zhiygt4oia@kahuna>
References: <20190722202024.14867-1-s-anna@ti.com>
 <20190722202024.14867-2-s-anna@ti.com>
 <20190723113540.xvhsrlbf66lr5aaq@kahuna>
 <664f4a6f-697d-3463-bfd9-1423ad95bf62@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <664f4a6f-697d-3463-bfd9-1423ad95bf62@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Suman Anna <s-anna@ti.com>
Cc: Tero Kristo <t-kristo@ti.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 12:50-20190723, Suman Anna wrote:
> For the OMAP mailboxes, we do not want to enable just the cluster. A
> cluster without any enabled sub-mailboxes or interrupts will fail the probe.
> 
> There are 12 clusters but we won't be enabling all clusters for the MPU
> core running Linux. There are some clusters that are dedicated to
> RTOS-to-RTOS IPC which we don't want to even probe on Linux. This patch
> adds all the clusters, and the next patch enables only the clusters used
> by Linux that have the proper sub-mailboxes and interrupts. Please see
> the NOTE above for the reason why not all the 4 interrupts from each
> cluster are added here.

Please follow the example of uart and disable in the board file. Please
see existing code when posting new nodes.

-- 
Regards,
Nishanth Menon
