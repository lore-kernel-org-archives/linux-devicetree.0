From: Loys Ollivier <lollivier@baylibre.com>
Subject: Re: [PATCH v4 2/4] dt-bindings: gnss: add mediatek binding
Date: Mon, 18 Feb 2019 15:08:38 +0100
Message-ID: <86k1hxur2x.fsf@baylibre.com>
References: <1550070569-18588-1-git-send-email-lollivier@baylibre.com>
 <1550070569-18588-3-git-send-email-lollivier@baylibre.com>
 <20190215160457.GO28278@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <20190215160457.GO28278@localhost>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Johan Hovold <johan@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>, Loys Ollivier <lollivier@baylibre.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


On Fri 15 Feb 2019 at 16:04, Johan Hovold <johan@kernel.org> wrote:

> On Wed, Feb 13, 2019 at 04:09:27PM +0100, Loys Ollivier wrote:
>> Add binding for Mediatek-based GNSS receivers.
>> 
>> Signed-off-by: Loys Ollivier <lollivier@baylibre.com>
>> ---
>> v4:
>> Use standard names for reset-gpios and gnss-fix-gpios
>> s/an/a UART
>> 
>> v3:
>> Removed the I2C and SPI interfaces references.
>> Removed the "mediatek,mt3339" compatible line.
>> Added the optional propertied (reset, fix)
>> Added the pin names for the optional properties.
>> 
>> v2:
>> Renamed bindings from Globaltop/gtop to Mediatek/mtk.
>> Moved current-speed as an optional propertie.
>> Removed the status line in the example.
>> Added "mediatek,mt3339" compatible.
>> 
>>  .../devicetree/bindings/gnss/mediatek.txt          | 37 ++++++++++++++++++++++
>>  1 file changed, 37 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/gnss/mediatek.txt
>> 
>> diff --git a/Documentation/devicetree/bindings/gnss/mediatek.txt b/Documentation/devicetree/bindings/gnss/mediatek.txt
>> new file mode 100644
>> index 000000000000..12283d429baa
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/gnss/mediatek.txt
>> @@ -0,0 +1,37 @@
>> +Mediatek-based GNSS Receiver DT binding
>> +
>> +Mediatek chipsets are used in GNSS-receiver modules produced by several
>> +vendors and can use a UART interface.
>> +
>> +Please see Documentation/devicetree/bindings/gnss/gnss.txt for generic
>> +properties.
>> +
>> +Required properties:
>> +
>> +- compatible	: Must be
>> +
>> +			"globaltop,pa6h"
>> +
>> +- vcc-supply	: Main voltage regulator (pin name: VCC)
>> +
>> +Optional properties:
>> +
>> +- current-speed		: Default UART baud rate
>> +- gnss-fix-gpios	: GPIO used to determine device position fix state
>> +			  (pin name: FIX, 3D_FIX)
>> +- reset-gpios		: GPIO used to reset the device
>> +  		  	  (pin name: RESET, NRESET)
>> +- timepulse-gpios	: Time pulse GPIO (pin name: PPS1, 1PPS)
>> +- v-bckp-supply		: Backup voltage regulator
>> +  			  (pin name: VBAT, VBACKUP)
>
> As we discussed, I changed this to "vbackup-supply" (here and in the
> driver) before applying.
>
> Note that git reported some whitespace errors above too (spaces before
> tabs) that I fixed up. Not sure why checkpatch doesn't complain.
>
Oops, thanks for fixing it. I ran checkpatch again and it did not
complain. Apprently it's not checking for spaces before tabs in "txt"
files.
I'll add a step in my flow to apply the patches I create before sending
them to the list so that won't happen again ;)

> All now applied.
>
Yay ! Thanks !
Loys


> Thanks,
> Johan


-- 
-L
