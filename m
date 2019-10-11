From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v1 3/3] ARM: dts: bcm2711: Enable GENET support for the
 RPi4
Date: Fri, 11 Oct 2019 16:11:36 -0700
Message-ID: <40970bd1-f461-ddde-aa51-346ad04240c9@gmail.com>
References: <20191011184822.866-1-matthias.bgg@kernel.org>
 <20191011184822.866-4-matthias.bgg@kernel.org>
 <dfe9062b-1960-f67b-2a9e-864c0680f5d3@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <dfe9062b-1960-f67b-2a9e-864c0680f5d3@gmx.net>
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
To: Stefan Wahren <wahrenst@gmx.net>, matthias.bgg@kernel.org, Florian Fainelli <f.fainelli@gmail.com>, "David S . Miller" <davem@davemloft.net>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Matthias Brugger <mbrugger@suse.com>, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, linux-kernel@vger.kernel.org, Eric Anholt <eric@anholt.net>, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 10/11/19 4:09 PM, Stefan Wahren wrote:
> Am 11.10.19 um 20:48 schrieb matthias.bgg@kernel.org:
>> From: Matthias Brugger <mbrugger@suse.com>
>>
>> Enable Gigabit Ethernet support on the Raspberry Pi 4
>> Model B.
> 
> I asked some questions about genet to the RPi guys [1] which are
> relevant to this patch (missing clocks and interrupt, MAC address
> assignment) but i didn't get an answer yet.
> 
> During my tests with a similiar patch series i noticed that the driver
> won't probe without a MAC address.

Yes, that is true, we have an internal patch for that that we just
recently did, let me submit it so this does not block you.

> 
> How does it get into DT (via U-Boot)?
> 
> [1] -
> https://github.com/raspberrypi/linux/issues/3101#issuecomment-534665860
> 


-- 
Florian
