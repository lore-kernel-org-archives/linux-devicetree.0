From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH] ARM: dts: da850: fix W=1 warnings with pinmux node
Date: Tue, 24 Apr 2018 14:31:20 +0530
Message-ID: <926d9dc1-9182-a27f-3e4b-724c391fad19@ti.com>
References: <20180417123600.23548-1-nsekhar@ti.com>
 <d45ed86f-3b99-707e-e584-cbdcb2f5552d@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <d45ed86f-3b99-707e-e584-cbdcb2f5552d@lechnology.com>
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
To: David Lechner <david@lechnology.com>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Device Tree Mailing List <devicetree@vger.kernel.org>, Kevin Hilman <khilman@kernel.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 17 April 2018 09:26 PM, David Lechner wrote:
> On 04/17/2018 07:36 AM, Sekhar Nori wrote:
>> Remove unused #address-cells and #size-cells from pinmux
>> node. This fixes W=1 warnings of the type:
>>
>> arch/arm/boot/dts/da850-lcdk.dtb: Warning
>> (avoid_unnecessary_addr_size): /soc@1c00000/pinmux@14120: unnecessary
>> #address-cells/#size-cells without "ranges" or child "reg" property
>>
>> Tested on DA850 LCDK by checking output of:
>>
>> /sys/kernel/debug/pinctrl/1c14120.pinmux-pinctrl-single/pins
>>
>> before and after the change.
>>
>> Signed-off-by: Sekhar Nori <nsekhar@ti.com>
>> ---
> 
> Reviewed-by: David Lechner <david@lechnology.com>

Applied to fixes.

Thanks,
Sekhar
