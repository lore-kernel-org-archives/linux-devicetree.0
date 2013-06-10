From: "Philip, Avinash" <avinashphilip-l0cyMroinI0@public.gmane.org>
Subject: RE: [PATCH 09/11] gpio: davinci: DT changes for driver
Date: Mon, 10 Jun 2013 11:45:59 +0000
Message-ID: <518397C60809E147AF5323E0420B992E3EAD9928@DBDE04.ent.ti.com>
References: <1369206634-6778-1-git-send-email-avinashphilip@ti.com>
	<1369206634-6778-10-git-send-email-avinashphilip@ti.com>
	<CACRpkdZH4w_-K617QNCo0Z9jH7LKQyjzoG9K-dj4UbN3h5Bcxw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
In-Reply-To: <CACRpkdZH4w_-K617QNCo0Z9jH7LKQyjzoG9K-dj4UbN3h5Bcxw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <http://linux.davincidsp.com/mailman/options/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=unsubscribe>
List-Archive: <http://linux.davincidsp.com/pipermail/davinci-linux-open-source>
List-Post: <mailto:davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Help: <mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=help>
List-Subscribe: <http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=subscribe>
Sender: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
Errors-To: davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org" <davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ext Kevin Hilman <khilman-1D3HCaltpLuhEniVeURVKkEOCMrvLtNR@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "KV,
  Sujith" <sujithkv-l0cyMroinI0@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 30, 2013 at 23:55:22, Linus Walleij wrote:
> On Wed, May 22, 2013 at 9:10 AM, Philip Avinash <avinashphilip-l0cyMroinI0@public.gmane.org> wrote:
> 
> (...)
> > +- interrupts: The Starting IRQ number for GPIO
> > +- intc_irq_num: The number of IRQs supported by the Interrupt Controller
> (...)
> 
> No this is not how you pass a number of IRQs in the device tree.
> 
> "interrupts" is an array. Pass every interrupt here for a full
> resolution of the IRQs.

Correct. I will change.

> 
> Further this looks fishy:
> 
> + interrupts = <42>;
> 
> Usually you pass flags with the IRQs, I would rather have expected
> an array like this:
> 
> interrupts = < 90 0x4 96 0x4 14 0x4 15 0x4 79 0x4>;
> 
> 0x4 is IRQ_TYPE_LEVEL_HIGH, you can use the dts
> #include <dt-bindings/interrupt-controller/irq.h> and
> define that symbolically.
> 
> Doesn't the DaVinci IRQ controller support *any* IRQ flags?

I wasn't sure about it.
But from davinci GPIO driver perspective, GPIO pins are
configured as edge sensitive. So IRQ_TYPE_EDGE_BOTH can be used.

So I will correct Documentation and update DT nodes in next version.

> 
> Since the driver code is not reading out the interrupts but
> (I guess?) falling back to platform data IRQ assignment,
> this seems wrong.

Driver code reads "Starting IRQ number for GPIO" from platform resource
See [PATCH 03/11] gpio: davinci: Modify to platform driver.
Driver requires only starting offset of gpio irq number. GPIO interrupt
Number expected in sequential order for davinci GPIO.

Thanks
Avinash

 
> Yours,
> Linus Walleij
> 
