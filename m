From: "santosh.shilimkar@oracle.com" <santosh.shilimkar@oracle.com>
Subject: Re: [PATCH 0/6] 66AK2G: Add DT nodes for few peripherals
Date: Sat, 2 Dec 2017 20:01:40 -0800
Message-ID: <9a1a50a9-d77e-44fb-be47-32fb8d4735f2@oracle.com>
References: <20171123075154.3938-1-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20171123075154.3938-1-vigneshr@ti.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vignesh R <vigneshr@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 11/22/17 11:51 PM, Vignesh R wrote:
> This patch series adds DT nodes for bunch of peripherials on 66AK2G EVM and
> 66AK2G ICE boards.
> 
> Tested on 66AK2G EVM and ICE boards
> 
> 
> Vignesh R (6):
>    ARM: dts: keystone-k2g: Add QSPI DT entry
>    ARM: dts: keystone-k2g-evm: Fix botched up merge
>    ARM: dts: keystone-k2g: Move ti,non-removable property to board dts
>    ARM: dts: keystone-k2g-evm: Add QSPI DT node.
>    ARM: dts: keystone-k2g-ice: Add DT nodes for few peripherals
>    ARM: configs: keystone_defconfig: Enable few peripheral drivers
> 
Series applied. Please submit the follow up patch for
multi-v7 config.

Regards,
Santosh
