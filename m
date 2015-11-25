From: Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>
Subject: Re: [PATCH 4/10] watchdog: bcm63xx_wdt: Handle hardware interrupt and
 remove software timer
Date: Wed, 25 Nov 2015 20:28:59 +0000
Message-ID: <56561A0B.9020700@simon.arlott.org.uk>
References: <5650BFD6.5030700@simon.arlott.org.uk>
 <5650C08C.6090300@simon.arlott.org.uk> <5650E2FA.6090408@roeck-us.net>
 <5650E5BB.6020404@simon.arlott.org.uk> <56512937.6030903@roeck-us.net>
 <5651CB13.4090704@simon.arlott.org.uk> <5651CB9C.4090005@simon.arlott.org.uk>
 <20151124182138.GB12289@roeck-us.net>
 <CAOiHx=kn4NPxxYq0Te_T+8y_Cb1udyU0_EO-_eKp2Xshh7X6EA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOiHx=kn4NPxxYq0Te_T+8y_Cb1udyU0_EO-_eKp2Xshh7X6EA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Maxime Bizon <mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, MIPS Mailing List <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 25/11/15 20:14, Jonas Gorski wrote:
> On Tue, Nov 24, 2015 at 7:21 PM, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org> wrote:
>> On Sun, Nov 22, 2015 at 02:05:16PM +0000, Simon Arlott wrote:
>>> There is a level triggered interrupt for the watchdog timer as part of
>>> the bcm63xx_timer device. The interrupt occurs when the hardware watchdog
>>> timer reaches 50% of the remaining time.
>>>
>>> It is not possible to mask the interrupt within the bcm63xx_timer device.
>>> To get around this limitation, handle the interrupt by restarting the
>>> watchdog with the current remaining time (which will be half the previous
>>> timeout) so that the interrupt occurs again at 1/4th, 1/8th, etc. of the
>>> original timeout value until the watchdog forces a reboot.
>>>
>>> The software timer was restarting the hardware watchdog with a 85 second
>>> timeout until the software timer expired, and then causing a panic()
>>> about 42.5 seconds later when the hardware interrupt occurred. The
>>> hardware watchdog would not reboot until a further 42.5 seconds had
>>> passed.
>>>
>>> Remove the software timer and rely on the hardware timer directly,
>>> reducing the maximum timeout from 256 seconds to 85 seconds
>>> (2^32 / WDT_HZ).
>>>
>>
>> Florian,
>>
>> can you have a look into this patch and confirm that there is no better
>> way to clear the interrupt status ?
> 
> While the watchdog interrupt can't be masked, it should be able to be
> cleared by writing 1 to the appropriate bit in the timer block's
> interrupt status register. At least the broadcom sources do so.

Not according to the hardware itself:
[    6.674626] watchdog watchdog0: warning timer fired, reboot in 7499ms
[    6.681212] irq_bcm6345_l2_timer: bcm6345_timer_write_int_status: b0000083=08
[    6.688583] watchdog watchdog0: warning timer fired, reboot in 7486ms
[    6.695181] irq_bcm6345_l2_timer: bcm6345_timer_write_int_status: b0000083=08
[    6.702554] watchdog watchdog0: warning timer fired, reboot in 7472ms
[    6.709158] irq_bcm6345_l2_timer: bcm6345_timer_write_int_status: b0000083=08
[    6.716529] watchdog watchdog0: warning timer fired, reboot in 7458ms
[    6.723135] irq_bcm6345_l2_timer: bcm6345_timer_write_int_status: b0000083=08
[    6.730538] watchdog watchdog0: warning timer fired, reboot in 7444ms
[    6.737121] irq_bcm6345_l2_timer: bcm6345_timer_write_int_status: b0000083=08
[    6.744482] watchdog watchdog0: warning timer fired, reboot in 7430ms
[    6.751090] irq_bcm6345_l2_timer: bcm6345_timer_write_int_status: b0000083=08


typedef struct Timer {
    uint16        unused0;
    byte          TimerMask;
#define TIMER0EN        0x01
#define TIMER1EN        0x02
#define TIMER2EN        0x04
    byte          TimerInts;
#define TIMER0          0x01
#define TIMER1          0x02
#define TIMER2          0x04
#define WATCHDOG        0x08
...

-- 
Simon Arlott
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
