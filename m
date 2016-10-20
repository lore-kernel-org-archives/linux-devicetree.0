From: Albert ARIBAUD <albert.aribaud-iEu9NFBzPZE@public.gmane.org>
Subject: Re: [PATCH 1/2] fsl-quadspi: fix QUAD read, add NORMAL, DUAL and
 FAST reads
Date: Thu, 20 Oct 2016 09:16:30 +0200
Message-ID: <20161020091630.3477efab.albert.aribaud@3adev.fr>
References: <20160927055957.427-1-albert.aribaud@3adev.fr>
        <69a5b0d7-6b89-7edc-738d-c9e25802ba31@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <69a5b0d7-6b89-7edc-738d-c9e25802ba31-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, yunhui.cui-3arQi8VN3Tc@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Han Xu <han.xu-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Cyrille,

Le Wed, 19 Oct 2016 18:42:36 +0200, Cyrille Pitchen
<cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org> a écrit :

> Hi Albert,
> 
> +Yunhui


> It seems that both Yunhui and you work on the same topic, maybe you can
> synchronize?
> https://patchwork.ozlabs.org/patch/660356/

I am already preparing a v2 based over Yunhui's series. :)

> I don't think it is a good thing to select the relevant "READ" LUT entry
> according to the command op code. What if spi-nor.c introduces new op codes?
> 
> Maybe you could index the LUT entries by functions:
> - READ_REG: the LUT op code would be dynamically updated by your
>             .read_reg(nor, opcode, ...) implementation according to opcode.
> - WRITE_REG: the same as above with the .write_reg(nor, opcode, ...) hook.
> - READ_SLAVE1: read memory from the first SPI-NOR memory.
> - WRITE_SLAVE1: write into the first SPI-NOR memory.
> - READ_SLAVE2: read memory form the 2nd SPI-NOR memory.
> ...
> - WRITE_SLAVEN: write into the N-th SPI-NOR memory.

Actually, my needs could be met using Han Xu's dynamic LUT entries
without the need to introduce 'virtual' opcodes (and without having
to 'leak back' those new opcodes into other kernel code portions).

The per-slave differences (in my case, bus width essentially) can be
managed though DT entries and corresponding per-nor flags in the driver.

> Also be aware even for the .read() hook the nor->read_opcode might changes
> between calls!

Noted -- I'll check that the driver always use the current NOR codes.

> I don't know whether those comments fit your actual needs and the Freescale SPI
> controller hardware constraints but I'm always worried about the ease to maintain
> SPI-NOR controller drivers when they are not "op code agnostic".

Understood and agreed.

Thanks for yuor feedback!
 
> Best regards,
> 
> Cyrille

Cordialement,
Albert ARIBAUD
3ADEV
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
