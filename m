From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH] ARM: dts: da850: use gpio-ranges
Date: Fri, 23 Feb 2018 17:14:56 +0530
Message-ID: <be660007-cf4b-bf01-d811-a456af74bb49@ti.com>
References: <1519079371-25493-1-git-send-email-david@lechnology.com>
 <CACRpkdb=wOomi4QxvXLdNJVfB-rvGfKE+QZvmxvT2SzVDjH4tw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdb=wOomi4QxvXLdNJVfB-rvGfKE+QZvmxvT2SzVDjH4tw@mail.gmail.com>
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
To: Linus Walleij <linus.walleij@linaro.org>, David Lechner <david@lechnology.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE
 TREE BINDINGS" <devicetree@vger.kernel.org>, Kevin Hilman <khilman@kernel.org>, Tony Lindgren <tony@atomide.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Haojian Zhuang <haojian.zhuang@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thursday 22 February 2018 09:04 PM, Linus Walleij wrote:
> On Mon, Feb 19, 2018 at 11:29 PM, David Lechner <david@lechnology.com> wrote:
> 
>> This makes use of the gpio-ranges feature that connects GPIO
>> controllers and PINMUX controllers.
>>
>> In da850.dtsi, pinctrl-single,gpio-range is added to the pinmux node
>> and gpio-ranges is added to the GPIO node. Unfortunately, the way the
>> pinctrl-single driver enumerates the pins (starting with LSB) causes
>> them to be in reverse order compared to the way the gpios are assigned.
>> As a result, we have to declare the mapping for each GPIO individually.
>>
>> This also lets us remove all of the GPIO pinmuxes from
>> da850-lego-ev3.dts. (Other da850 boards do not currently have any
>> GPIO pinmuxes declared.)
>>
>> Signed-off-by: David Lechner <david@lechnology.com>
> 
> Nice,
> Acked-by: Linus Walleij <linus.wallei@linaro.org>

Looks good to me too. And quite painstakingly done!

I suppose this needs to wait a bit due to the dependencies? Let me know
once its okay to merge.

Thanks,
Sekhar
