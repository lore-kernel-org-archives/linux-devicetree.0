From: Vignesh R <vigneshr@ti.com>
Subject: Re: [PATCH RESEND] ARM: dts: keystone-k2*: Increase SPI Flash
 partition size for U-Boot
Date: Wed, 12 Oct 2016 16:30:28 +0530
Message-ID: <c3be6bfc-9cfa-bcd8-5988-ee8bdd9fa506@ti.com>
References: <20161010141141.21333-1-vigneshr@ti.com>
 <20161010143144.GB1041@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161010143144.GB1041@n2100.armlinux.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Muralidharan Karicheri <m-karicheri2@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Monday 10 October 2016 08:01 PM, Russell King - ARM Linux wrote:
> On Mon, Oct 10, 2016 at 07:41:41PM +0530, Vignesh R wrote:
>> U-Boot SPI Boot image is now more than 512KB for Keystone2 devices and
>> cannot fit into existing partition. So, increase the SPI Flash partition
>> for U-Boot to 1MB for all Keystone2 devices.
>>
>> Signed-off-by: Vignesh R <vigneshr@ti.com>
>> ---
>>
>> This was submitted to v4.9 merge window but was never picked up:
>> https://patchwork.kernel.org/patch/9135023/
> 
> I think you need to explain why it's safe to change the layout of the
> flash partitions like this.
> 
> - What is this "misc" partition?
> 

This partition seems to exists from the very beginning.  I believe, this
is just a spare area of flash that can be used as per end-user
requirement. Either to store a small filesystem or kernel. Copying
Murali who added above partition if he has any input here.

> - Why is it safe to move the "misc" partition in this way?
> 
> - Do users need to do anything with data stored in the "misc" partition
>   when changing kernels?
> 

MTD layer will take care of most abstractions (like start address etc).
Will add a note in commit message informing about the reduction in size
of the partition.

> If the "misc" partition is simply unused space on the flash device, why
> list it in DT?
> 

If the unused space is not listed in the DT, then there is no /dev/mtdX
node created for the unused section. User will then have to manually
edit DT, in order to get the node and mount it. Instead, lets make it
available by default.

-- 
Regards
Vignesh
