From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v2 3/3] ARM: dts: da850: Add node for pullup/pulldown
 pinconf
Date: Thu, 1 Dec 2016 19:33:59 +0530
Message-ID: <39ef42d3-3a34-70ff-25eb-86006d6841ee@ti.com>
References: <1480351226-3332-1-git-send-email-david@lechnology.com>
 <1480351226-3332-4-git-send-email-david@lechnology.com>
 <CACRpkdZOxZRRUGkso_b0hLta4OWkeAgX2khcJxFc8EETFKiiXw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdZOxZRRUGkso_b0hLta4OWkeAgX2khcJxFc8EETFKiiXw@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>, David Lechner <david@lechnology.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Axel Haslam <ahaslam@baylibre.com>, Kevin Hilman <khilman@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Alexandre Bailon <abailon@baylibre.com>, =?UTF-8?Q?Bartosz_Go=c5=82aszewski?= <bgolaszewski@baylibre.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 30 November 2016 06:31 PM, Linus Walleij wrote:
> On Mon, Nov 28, 2016 at 5:40 PM, David Lechner <david@lechnology.com> wrote:
> 
>> This SoC has a separate pin controller for configuring pullup/pulldown
>> bias on groups of pins.
>>
>> Signed-off-by: David Lechner <david@lechnology.com>
>> ---
>>
>> v2 changes:
>> * Moved pin-controller@22c00c device node after gpio@226000 (there seem to be
>>   more nodes in proper order here compared to the i2c@228000 node suggested by
>>   Sekhar)
> 
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Take this through the ARM SoC tree.

Thanks Linus! Applied to v4.10/dt

Thanks,
Sekhar
