From: David Lechner <david@lechnology.com>
Subject: Re: [PATCH 5/5] ARM: dts: Add LEGO MINDSTORTMS EV3 dts
Date: Mon, 24 Oct 2016 21:56:50 -0500
Message-ID: <aa18572c-2c9d-ee24-dcd2-8627ab7a9b83@lechnology.com>
References: <1477075018-20176-1-git-send-email-david@lechnology.com>
 <1477075018-20176-6-git-send-email-david@lechnology.com>
 <b0022fad-a96e-86d4-71ba-2b803e5421fe@ti.com>
 <1593441f-d147-4c91-8aab-8622dd8ced19@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1593441f-d147-4c91-8aab-8622dd8ced19@lechnology.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 10/24/2016 10:50 AM, David Lechner wrote:
> On 10/24/2016 06:58 AM, Sekhar Nori wrote:
>> On Saturday 22 October 2016 12:06 AM, David Lechner wrote:
>>> +};
>>> +
>>> +&spi1 {
>>> +    status = "okay";
>>> +    pinctrl-names = "default";
>>> +    pinctrl-0 = <&spi1_pins>, <&spi1_cs0_pin>;
>>> +
>>> +    /* TODO: LCD Display goes here */
>>
>> Add this node when you actually have display working.
>
> What if we set this up as a spidev node instead? This way the display
> could be used from userspace without a driver.
>

To answer my own question, it seems that specifying "spidev" in 
devicetree is frowned upon since it does not "describe the hardware".
