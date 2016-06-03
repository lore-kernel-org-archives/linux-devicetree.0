From: Santosh Shilimkar <santosh.shilimkar@oracle.com>
Subject: Re: [PATCH 0/5] ARM:Keystone: Add pinmuxing support
Date: Fri, 3 Jun 2016 11:55:37 -0700
Message-ID: <ad9ec6ee-1228-95c3-fda5-046567ff32c2@oracle.com>
References: <1461766308-27669-1-git-send-email-fcooper@ti.com>
 <5cc270d6-aec9-a1a8-597b-37c8413496a9@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5cc270d6-aec9-a1a8-597b-37c8413496a9@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Franklin Cooper Jr." <fcooper@ti.com>, robh+dt@kernel.org, linux@arm.linux.org.uk, ssantosh@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Franklin,

On 6/3/2016 11:42 AM, Franklin Cooper Jr. wrote:
> Gentle ping on this series
>
> On 04/27/2016 09:11 AM, Franklin S Cooper Jr wrote:
>> Unlike most Keystone 2 devices, K2G supports pinmuxing of its pins. This
>> patch series enables pinmuxing for Keystone 2 devices.
>>
>> Franklin S Cooper Jr (1):
>>   ARM: keystone: defconfig: Enable PINCTRL SINGLE for Keystone 2
>>
>> Lokesh Vutla (3):
>>   ARM: Keystone: Enable PINCTRL for Keystone ARCH
>>   ARM: dts: keystone: Header file for pinctrl constants
>>   ARM: dts: k2g-evm: Add pinmuxing for UART0
>>
>> Vitaly Andrianov (1):
>>   ARM: dts: k2g: Add pinctrl support
>>
Can you please check if it needs to be refreshed
against v4.7-rc1 and if yes please re-post it.
I will apply it for 4.8

Regards,
Santosh
