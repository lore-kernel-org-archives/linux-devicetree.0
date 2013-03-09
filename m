From: Ezequiel Garcia <elezegarcia-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: plat-nand DT support
Date: Sat, 9 Mar 2013 12:29:00 -0300
Message-ID: <CALF0-+UGapoPTWdVG4W=5nzHT9NJU2z65g=zi2Dj2=JVA0_u2w@mail.gmail.com>
References: <20130303155226.GA1976@edkhil>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130303155226.GA1976@edkhil>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Alexander Clouter <alex-L4GPcECwBoDe9xe1eoZjHA@public.gmane.org>
Cc: hsweeten-3FF4nKcrg1dE2c76skzGb0EOCMrvLtNR@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Alexander,

Sorry for the delay.

On Sun, Mar 3, 2013 at 12:52 PM, Alexander Clouter <alex-L4GPcECwBoDe9xe1eoZjHA@public.gmane.org> wrote:
>
> https://github.com/jimdigriz/ts78xx/blob/gen-nand-dt/arch/arm/mach-orion5x/board-ts7800.c

I'm not too familiar with this whole bus_register_notifier() business.
So, I can't really answer if this looks sane. However, I have
a few things to say see below.

> https://github.com/jimdigriz/ts78xx/blob/gen-nand-dt/arch/arm/boot/dts/orion5x-ts7800.dts
>

This device tree node looks okay.

>
> [2] could also support the NAND used by arch/arm/mach-ep93xx/ts72xx.c but
> the whole SoC has not         been ported to DT
>

Okey, here I think you're going in the wrong direction.
The current trend -and there are very good reasons for this-
is to NOT litter arch/arm/mach-foo/ but rather put drivers handling in drivers/
where they rightfully belong.

In other words, the right direction is to write a nand driver if you need one.
For instance, I find a bit mixed up to have functions like
ts7800_nand_write/read_buf() in your board.c file.

BTW, it could be great if you could upstream your work.
Also, it could be much easier for you to get support and answers if you
try to upstream.

Hope this helps,
-- 
    Ezequiel
