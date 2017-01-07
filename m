From: "santosh.shilimkar@oracle.com" <santosh.shilimkar@oracle.com>
Subject: Re: [PATCH v2 0/9] Use mmio-sram driver for Keystone MSMC RAM
Date: Sat, 7 Jan 2017 12:36:28 -0800
Message-ID: <73a1577d-5e92-399c-8d93-59aa4cf7e3c3@oracle.com>
References: <20170106215733.41637-1-s-anna@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170106215733.41637-1-s-anna@ti.com>
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
Cc: devicetree@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Vitaly Andrianov <vitalya@ti.com>, linux-kernel@vger.kernel.org, Tero Kristo <t-kristo@ti.com>, Rob Herring <robh+dt@kernel.org>, Murali Karicheri <m-karicheri2@ti.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 1/6/17 1:57 PM, Suman Anna wrote:
> Hi,
>
> The Keystone 2 family of SoCs have an on-chip RAM called the
> Multicore Shared Memory (MSM) RAM. This RAM is accessible through
> the Multicore Shared Memory Controller (MSMC). This series represents
> these on-chip RAMs as sram nodes so that the memory allocations
> can be managed by the in-kernel mmio-sram driver.
>
> This is v2 of the previous series [1], and now includes 4 additional
> patches that reserve the portions of the MSMC RAM used by the
> Keystone Boot Monitor. The first 5 patches are essentially the same
> as in v1, with minor commit description updates for using the proper
> SoC names, but no code changes.
>
> Patches baselined on 4.10-rc1.
>
Applied. Should start showing up next soon. thanks !!

Regards,
Santosh
