From: Rahul Bedarkar <Rahul.Bedarkar@imgtec.com>
Subject: Re: [PATCH 2/2] MIPS: DTS: img: add device tree for Marduk board
Date: Thu, 13 Oct 2016 12:32:10 +0530
Message-ID: <57FF3172.4010709@imgtec.com>
References: <1475757094-31089-1-git-send-email-rahul.bedarkar@imgtec.com>
 <1475757094-31089-2-git-send-email-rahul.bedarkar@imgtec.com>
 <20161010142152.GA7920@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <20161010142152.GA7920@rob-hp-laptop>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Rob Herring <robh@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, Mark Rutland <mark.rutland@arm.com>, James Hartley <james.hartley@imgtec.com>, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On Monday 10 October 2016 07:51 PM, Rob Herring wrote:
>> +
>> +	memory {
>
> Is 0 the actual base, or that gets filled in by bootloader? If the
> formet, add unit address.
>

Bootloader (uboot) can override or fixup memory node. But with version 
of bootloader I tested with, base address is hardcoded to 0 and only 
size may get changed. But since booloader can override or fixup memory 
node, I assume we don't add unit address in this case.

>> +		device_type = "memory";
>> +		reg =  <0x00000000 0x08000000>;

I now realized that size is incorrectly specified in memory node. It 
should be 256MB and not 128MB. I will fix this in v2.

Thanks,
Rahul
