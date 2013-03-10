From: Alexander Clouter <alex-L4GPcECwBoDe9xe1eoZjHA@public.gmane.org>
Subject: Re: plat-nand DT support
Date: Sun, 10 Mar 2013 11:31:51 +0000
Message-ID: <20130310113151.GS30947@edkhil>
References: <20130303155226.GA1976@edkhil>
 <CALF0-+UGapoPTWdVG4W=5nzHT9NJU2z65g=zi2Dj2=JVA0_u2w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CALF0-+UGapoPTWdVG4W=5nzHT9NJU2z65g=zi2Dj2=JVA0_u2w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Ezequiel Garcia <elezegarcia-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Thanks for replying!

On Sat, Mar 09, 2013 at 12:29:00PM -0300, Ezequiel Garcia wrote:
>
>> [2] could also support the NAND used by arch/arm/mach-ep93xx/ts72xx.c but
>> the whole SoC has not been ported to DT
>
>Okey, here I think you're going in the wrong direction. The current trend -and there are very 
>good reasons for this- is to NOT litter arch/arm/mach-foo/ but rather put drivers handling in 
>drivers/ where they rightfully belong.

I would agree.  However, what nags at me is that this driver would be rather board specific and 
not SoC/platform so the option for re-use is low; the NAND is implemented in an FPGA.

I'm trying to get a feeling of what the lesser evil is so that I can avoid "no, please write a 
proper driver to live in 'drivers'" or "jeez, not another near-identical driver, use plat-nand". 
:)

Whats are the thoughts from the MTD world?
  * plat-nand provides all the common boilerplate NAND code that each driver needs and then has 
the platform specific non-reusable cases hook in via platform_device
  * if the SoC has be DT'd, then a unique non-reusable driver is the correct approach

The only possible other user of the driver is arm/mach-ep93xx (not a DT enabled SoC yet though), 
but it was made to work with plat-nand:

http://lists.infradead.org/pipermail/linux-mtd/2009-October/027563.html

That year it was also suggested I go with plat-nand, which then got accepted upstream, so I guess 
everyone was happy with it :)

http://lists.infradead.org/pipermail/linux-mtd/2009-February/024556.html

On a passing note, the plat-nand DT hooks do not work.  One core component is that 
part_probe_types missed 'ofpart' so that is a bit depressing, but the other 
nr-chips/chip-delay/bank-width/bbt-use-flash options do mean that all the maintainer needs to do 
is write the ready/cmd hooks.

>In other words, the right direction is to write a nand driver if you need one.
>For instance, I find a bit mixed up to have functions like
>ts7800_nand_write/read_buf() in your board.c file.

Maybe there is an appetite for a hybrid?

I could write a drivers/mtd/nand/ts7xxx.c, a DT enabled NAND driver that shims around plat-nand 
which has my new DT extending patches.  Means it is all pure DT over in arch/arm and there is 
still where possible re-use of boilerplate code.

plat-nand, to me, makes sense to save code.  With a DT shim, others could crib from it too.

Never-the-less, I am happy to do whatever the MTD folk want, I just really do not want to go down 
one path and then told to burn everything and do plan B instead.

>BTW, it could be great if you could upstream your work. Also, it could be much easier for you to 
>get support and answers if you try to upstream.

This is what I am trying to do.  I am currently trying to port my board 
arch/arm/mach-orion5x/ts78xx-setup.c (that I am the maintainer for) to DT, the github page is 
just where I do development on.

Cheers, and thanks again for the reply.

-- 
Alexander Clouter
.sigmonster says: He who foresees calamities suffers them twice over.
