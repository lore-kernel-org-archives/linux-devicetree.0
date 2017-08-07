From: "santosh.shilimkar@oracle.com" <santosh.shilimkar@oracle.com>
Subject: Re: [PATCH 0/3] ARM: dts: k2g: Add support for USB instances on 66AK2G
Date: Mon, 7 Aug 2017 06:41:20 -0700
Message-ID: <804f13a3-fa4b-6902-d6dc-1c9d4aa0b8fb@oracle.com>
References: <20170802201724.11439-1-fcooper@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170802201724.11439-1-fcooper@ti.com>
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
To: Franklin S Cooper Jr <fcooper@ti.com>, gregkh@linuxfoundation.org, robh+dt@kernel.org, ssantosh@kernel.org, linux@armlinux.org.uk, balbi@kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 8/2/17 1:17 PM, Franklin S Cooper Jr wrote:
> Add support for 66AK2G usb instances. However, the driver needs to be updated
> to support PM_RUNTIME. This update has been validated to work on K2L and boot
> tested on K2HK and K2E.
> 
> Franklin S Cooper Jr (2):
>    usb: dwc3: keystone: Add PM_RUNTIME Support to DWC3 Keystone USB
>      driver
>    dt-bindings: usb: keystone-usb: Update bindings pm and clocks
>      properties
> 
> Vitaly Andrianov (1):
>    ARM: dts: k2g: Add USB instances
> 
>   .../devicetree/bindings/usb/keystone-usb.txt       | 18 ++++++-
>   arch/arm/boot/dts/keystone-k2g.dtsi                | 56 ++++++++++++++++++++++
>   drivers/usb/dwc3/dwc3-keystone.c                   | 22 ++++-----
>   3 files changed, 82 insertions(+), 14 deletions(-)
> 
Once you get you driver patch lined up, post
the DTS patch separately.

Regards,
Santosh
