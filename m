From: Murali Karicheri <m-karicheri2@ti.com>
Subject: Re: [linux-next PATCH 0/4] Enable network driver on K2G ICE and GP
 EVMs
Date: Tue, 22 May 2018 17:28:35 -0400
Message-ID: <7df564c7-25af-f8a4-1f53-b41ee499c1eb@ti.com>
References: <1526066952-5230-1-git-send-email-m-karicheri2@ti.com>
 <8e1aa492-ae7a-de2b-f5d2-8756b10ece79@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <8e1aa492-ae7a-de2b-f5d2-8756b10ece79@oracle.com>
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
To: "santosh.shilimkar@oracle.com" <santosh.shilimkar@oracle.com>, ssantosh@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 05/20/2018 11:17 PM, santosh.shilimkar@oracle.com wrote:
> On 5/11/18 12:29 PM, Murali Karicheri wrote:
>> Now that NetCP driver patches for K2G SoC is merged to linux-next master
>> this series add patches to enable network driver on K2G ICE and GP EVMs.
>>
>> Thanks
>>
>> Applied the patches on top of latest linux-next master, built kernel and
>> booted up on both EVMs. The logs are below
>>
>> K2G GP EVM: https://pastebin.ubuntu.com/p/ycZDnZXYPx/
>> K2G ICE EVM: https://pastebin.ubuntu.com/p/bdCpzgdrXr/
>>
>> Murali Karicheri (4):
>>    ARM: dts: k2g: add dt bindings to support network driver
>>    ARM: dts: keystone-k2g-evm: Enable netcp network driver
>>    ARM: dts: keystone-k2g-ice: Enable netcp network driver
>>    ARM: keystone: k2g: enable micrel and dp83867 phys
>>
>>   arch/arm/boot/dts/keystone-k2g-evm.dts    |  53 +++++++++++
>>   arch/arm/boot/dts/keystone-k2g-ice.dts    |  59 ++++++++++++
>>   arch/arm/boot/dts/keystone-k2g-netcp.dtsi | 147 ++++++++++++++++++++++++++++++
>>   arch/arm/boot/dts/keystone-k2g.dtsi       |  13 +++
>>   arch/arm/configs/keystone_defconfig       |   2 +
>>   5 files changed, 274 insertions(+)
>>   create mode 100644 arch/arm/boot/dts/keystone-k2g-netcp.dtsi
>>
> Looks good. Will add this to the queue for 4.19. Thanks !!
> 
> Regards,
> Santosh
> 
Thanks Santosh!

-- 
Murali Karicheri
Linux Kernel, Keystone
