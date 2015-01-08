From: Zoltan HERPAI <wigyori@uid0.hu>
Subject: Re: [PATCH 1/1] ARM: dts: pcduino: Enable user LED and button support
 for pcDuino
Date: Thu, 8 Jan 2015 16:12:27 +0100 (CET)
Message-ID: <alpine.DEB.2.02.1501081518370.29083@trabant.deployis.eu>
References: <1420709664-12687-1-git-send-email-wigyori@uid0.hu>
 <20150108135953.GU7853@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20150108135953.GU7853@lukather>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, hdegoede@redhat.com
List-Id: devicetree@vger.kernel.org

Hi Maxime,

On Thu, 8 Jan 2015, Maxime Ripard wrote:

>> +	gpio_keys {
>> +		compatible = "gpio-keys";
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&key_pins_pcduino>;
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		button@0 {
>> +			label = "Key Back";
>> +			linux,code = <KEY_BACK>;
>> +			gpios = <&pio 7 17 GPIO_ACTIVE_LOW>;
>> +		};
>> +		button@1 {
>> +			label = "Key Home";
>> +			linux,code = <KEY_HOME>;
>> +			gpios = <&pio 7 18 GPIO_ACTIVE_LOW>;
>> +		};
>> +		button@2 {
>> +			label = "Key Menu";
>> +			linux,code = <KEY_MENU>;
>> +			gpios = <&pio 7 19 GPIO_ACTIVE_LOW>;
>> +		};
>> +	};
>
> Some newlines here would have been nice between the button nodes. I
> added them and applied the patch.

First I did it with newlines between the nodes, then spotted that many of 
the button specs in other DTSes are without them, so I just removed them. 
Thanks for applying anyway!

Regards,
Zoltan H
