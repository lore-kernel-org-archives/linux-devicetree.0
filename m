From: Murali Karicheri <m-karicheri2@ti.com>
Subject: Re: [PATCH v1 1/2] ARM: dts: keystone: remove bogus IO resource entry
 from PCI binding
Date: Thu, 2 Jun 2016 17:07:46 -0400
Message-ID: <5750A022.2000601@ti.com>
References: <1464880672-15203-1-git-send-email-m-karicheri2@ti.com>
 <bdf18787-46ed-cc15-8914-fc14a3557681@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <bdf18787-46ed-cc15-8914-fc14a3557681@oracle.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Santosh Shilimkar <santosh.shilimkar@oracle.com>, ssantosh@kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 06/02/2016 02:08 PM, Santosh Shilimkar wrote:
> On 6/2/2016 8:17 AM, Murali Karicheri wrote:
>> The PCI DT bindings contain a bogus entry for IO space which is not
>> supported on Keystone. The current bogus entry has an invalid size
>> and throws following error during boot.
>>
>> [0.420713] keystone-pcie 21021000.pcie: error -22: failed to map
>>            resource [io  0x0000-0x400000003fff]
>>
>> So remove it from the dts. While at it also add a bus-range
>> value that eliminates following log at boot up.
>>
>> [0.420659] No bus range found for /soc/pcie@21020000, using [bus 00-ff]
>>
>> Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
>> ---
> Both 1/2 and 2/2 looks fine to me. Will queue them for
> next merge window.
> 
> Regards,
> Santosh
> 
Ok. Thanks Santosh!

-- 
Murali Karicheri
Linux Kernel, Keystone
