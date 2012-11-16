From: Matthieu CASTET <matthieu.castet@parrot.com>
Subject: Re: [PATCH 6/9] usb: chipidea: add PTW and PTS handling
Date: Fri, 16 Nov 2012 15:46:57 +0100
Message-ID: <50A651E1.5030001@parrot.com>
References: <1352909950-32555-1-git-send-email-m.grzeschik@pengutronix.de>
 <1352909950-32555-7-git-send-email-m.grzeschik@pengutronix.de>
 <87zk2h67ik.fsf@ashishki-desk.ger.corp.intel.com>
 <20121116131628.GA21447@pengutronix.de>
 <87lie1659c.fsf@ashishki-desk.ger.corp.intel.com>
 <20121116135743.GB21447@pengutronix.de>
 <87ip9563r8.fsf@ashishki-desk.ger.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <87ip9563r8.fsf@ashishki-desk.ger.corp.intel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: "fabio.estevam@freescale.com" <fabio.estevam@freescale.com>, Michael Grzeschik <m.grzeschik@pengutronix.de>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "mkl@pengutronix.de" <mkl@pengutronix.de>, Michael Grzeschik <mgr@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Alexander Shishkin a =E9crit :
> Michael Grzeschik <mgr@pengutronix.de> writes:
> =

>> On Fri, Nov 16, 2012 at 03:34:23PM +0200, Alexander Shishkin wrote:
>>> Michael Grzeschik <mgr@pengutronix.de> writes:
>>>
>>>> On Fri, Nov 16, 2012 at 02:45:39PM +0200, Alexander Shishkin wrote:
>>>>> Michael Grzeschik <m.grzeschik@pengutronix.de> writes:
>>>>>
>>>>>> This patch makes it possible to configure the PTW and PTS bits inside
>>>>>> the portsc register for host and device mode before the driver starts
>>>>>> and the phy can be addressed as hardware implementation is designed.
>>>>>>
>>>>>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>>>>>> Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
>>>>>> ---
>>>>>>  drivers/usb/chipidea/bits.h        |    3 +++
>>>>>>  drivers/usb/chipidea/ci.h          |    2 ++
>>>>>>  drivers/usb/chipidea/ci13xxx_imx.c |    1 +
>>>>>>  drivers/usb/chipidea/core.c        |   47 +++++++++++++++++++++++++=
+++++++++++
>>>>>>  drivers/usb/chipidea/host.c        |    4 +++
>>>>>>  include/linux/usb/chipidea.h       |    9 +++++++
>>>>>>  6 files changed, 66 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/usb/chipidea/bits.h b/drivers/usb/chipidea/bits=
.h
>>>>>> index 4b6ae3e..3cded5f 100644
>>>>>> --- a/drivers/usb/chipidea/bits.h
>>>>>> +++ b/drivers/usb/chipidea/bits.h
>>>>>> @@ -48,6 +48,9 @@
>>>>>>  #define PORTSC_SUSP           BIT(7)
>>>>>>  #define PORTSC_HSP            BIT(9)
>>>>>>  #define PORTSC_PTC            (0x0FUL << 16)
>>>>>> +#define PORTSC_PTS            (BIT(31) | BIT(30))
>>>>>> +#define PORTSC_PTW            BIT(28)
>>>>>> +#define PORTSC_STS            BIT(29)
>>>>> Hm, my spec says these are actually in DEVLC register and only have t=
his
>>>>> meaning in device mode. And in portsc these bits fall in device addre=
ss
>>>>> bitfield. Can you refer me to your spec?
>>>> You can find it here:
>>>> http://cache.freescale.com/files/32bit/doc/ref_manual/iMX53RM.pdf?fpsp=
=3D1
>>>> Page 4947
>>> Oh, but see, the offset is 0x184, which in chipidea spec (the version
>>> that I have) corresponds to DEVLC and not PORTSC. So in this driver's
>>> terminology it's DEVLC too, at least currently.
>>>
>>> So have you tested this code and did it make any difference?
>> Yes, i have tested this code with MX25, MX28, MX35 and MX53. In every
>> SoCs Datasheet the PORTSC register is defined on PORTBASE+0x184. Without
>> this proper configuration its not possible to communicate with the PHY.
> =

> No, I mean, you're writing DEVLC (using present driver's terminology)
> bits to PORTSC register. It *shouldn't* work. I suppose, it does
> something, but not exactly what you intended.
> =

I confirm in our datasheet we have PTW, PTS, STS in this register  PORTSCx =
with
this mapping.

In later design that support lpm, these bits have to move in another regist=
er
because ehci 1.1 use them [1].

So this code should only do that when !ci->hw_bank.lpm.
In case of ci->hw_bank.lpm, I don't know the new register mapping.


Matthieu



[1]
/* EHCI 1.1 addendum */
#define PORTSC_SUSPEND_STS_ACK 0
#define PORTSC_SUSPEND_STS_NYET 1
#define PORTSC_SUSPEND_STS_STALL 2
#define PORTSC_SUSPEND_STS_ERR 3

#define PORT_DEV_ADDR   (0x7f<<25)      /* device address */
#define PORT_SSTS   (0x3<<23)       /* suspend status */
