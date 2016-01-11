From: 8001010 <8001010@gmail.com>
Subject: Re: [linux-sunxi] Re: [PATCH 0/5] ARM: dts: sunxi: Add backlight node
 to q8 tablets
Date: Mon, 11 Jan 2016 11:34:18 +0100
Message-ID: <5693852A.1060604@gmail.com>
References: <1442752251-20744-1-git-send-email-hdegoede@redhat.com>
 <fc4adcf5-4362-4d4c-b42e-729922c79f65@googlegroups.com>
 <5677F7CF.3050308@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5677F7CF.3050308@redhat.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Hans de Goede <hdegoede@redhat.com>, linux-sunxi <linux-sunxi@googlegroups.com>
Cc: devicetree@vger.kernel.org, maxime.ripard@free-electrons.com, wens@csie.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hans de Goede wrote:
> Hi,
>
> On 21-12-15 11:56, Silvio Pellicano wrote:
>>
>>
>>> Here is a slightly updated version of Chen-Yu's backlight
>>> patches, also adding support for the backlight found on A13
>>> based q8 tablets.
>>>
>>
>> If i compile your dtsi with (obviously) pwm  support enable , backlight
>> switch off after kernel start,
>> if i disable pwm in menuconfig,it stay on, all seem correct (pwm on PB2 in
>> original script.bin),
>> but there is somewhere a bug in pwm or dtsi description of backlight.
>
> No there is not, if you enable the pwm driver you must also enable
> the backlight-pwm driver / add CONFIG_BACKLIGHT_PWM=y to your .config
> (and make sure it stays that way after a "make oldconfig").
>
> Regards,
>
> Hans
>
Now work, but what flag  i have to enable to leave 5v usb otg ON?
uboot switch ON Usb Otg voltage but kernel switch off during boot (no usb devices work).

Thanks
