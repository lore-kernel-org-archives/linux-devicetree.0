From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [RESEND PATCH v5 10/16] ARM: dts: zynq: Add generic compatible
 string for I2C EEPROM
Date: Mon, 25 Sep 2017 10:06:22 +0200
Message-ID: <e6006c90-99a2-c8f5-cff2-5c729ada8cd1@xilinx.com>
References: <20170615185418.13980-1-javier@dowhile0.org>
 <20170615185418.13980-11-javier@dowhile0.org>
 <b22a7db6-7daf-b5c1-3978-cdc699723e30@xilinx.com>
 <CABxcv=n4pCJLPb_C6eYVJ3CLBVH7T0amiJj7mYbshpv4u8xkXA@mail.gmail.com>
 <67a9d32a-0a20-f101-4660-0d5aa5ad8a8a@xilinx.com>
 <CABxcv==nFELQ8JJrxty=oNwwonJ3=xWqaH3a-RYssPmy8x2Z5w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CABxcv==nFELQ8JJrxty=oNwwonJ3=xWqaH3a-RYssPmy8x2Z5w@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@dowhile0.org>, Michal Simek <michal.simek@xilinx.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Linux Kernel <linux-kernel@vger.kernel.org>, Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh@kernel.org>, =?UTF-8?Q?S=c3=b6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 21.9.2017 11:41, Javier Martinez Canillas wrote:
> Hello Michal,
> 
> On Thu, Aug 24, 2017 at 3:44 PM, Michal Simek <michal.simek@xilinx.com> wrote:
> 
> [snip]
> 
>>
>> Ok. Applied to
>> https://github.com/Xilinx/linux-xlnx/commits/zynq/dt
>>
>> Will wait if something else pop up.
>>
> 
> I see the patch applied to that repository but I don't see it in
> neither mainline nor linux-next.

xilinx tree was merging to linux-next but there were conflicts with arm
soc tree that's why it was removed.

> 
>> Arnd: If you want to take this directly, feel free to do it.
>>
>> Thanks,
>> Michal

It is in queue for v4.15.

FYI: There are still 3 more in doc.

Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt:50:
               compatible = "at,24c08";
Documentation/devicetree/bindings/i2c/nxp,pca9541.txt:25:
               compatible = "at,24c08";
Documentation/devicetree/bindings/trivial-devices.txt:34:at,24c08
       i2c serial eeprom  (24cxx)


Thanks,
Michal
