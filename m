From: John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH V2 RFC 6/6] ARM: dts: bcm2835: Add Raspberry Pi Zero
Date: Thu, 18 Aug 2016 11:03:18 -0700
Message-ID: <400e11e7-8263-17d8-5c22-8b1c3a0878e7@synopsys.com>
References: <1469559213-16160-1-git-send-email-stefan.wahren@i2se.com>
 <1469559213-16160-7-git-send-email-stefan.wahren@i2se.com>
 <722dafcb-2f67-88c7-69df-d442c56c058f@synopsys.com>
 <263309088.290419.51598113-17aa-4db0-9dc0-6e58e3fafe07.open-xchange@email.1und1.de>
 <ac20c0e9-0cab-7e3f-4abf-75223538a816@synopsys.com>
 <1270178266.398560.152fe5dd-527b-4ad6-b2fd-e4b0af6bc2a9.open-xchange@email.1und1.de>
 <badc3aa5-29ac-9b8c-2531-564c44b60030@synopsys.com>
 <85508461.401578.b150078c-11e6-4a32-b9b6-f40bf8417708.open-xchange@email.1und1.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <85508461.401578.b150078c-11e6-4a32-b9b6-f40bf8417708.open-xchange@email.1und1.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stefan Wahren <stefan.wahren@i2se.com>, John Youn <John.Youn@synopsys.com>, Eric Anholt <eric@anholt.net>
Cc: Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>, Stephen Warren <swarren@wwwdotorg.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "linux-rpi-kernel@lists.infradead.org" <linux-rpi-kernel@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 8/17/2016 3:17 PM, Stefan Wahren wrote:
> Hi John,
> 
>> John Youn <John.Youn@synopsys.com> hat am 17. August 2016 um 23:21
>> geschrieben:
>>
>>
>> ...
>> Ok, yeah, that seems better.
>>
>> Can you check if applying just patch 2 and 3 solves the issue? If so I
>> think we can send those upstream.
> 
> unfortunately not:

Ok. I'll see if I can come up with a more conservative version of
patch 4 until I can look at it properly. I'll try to get to this
sometime next week but I may not be able to get to it until later.

In the meantime, specifying the fifo sizes as you've done can serve as
a workaround.

Regards,
John
