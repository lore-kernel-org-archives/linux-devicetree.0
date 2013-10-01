From: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH] tpm: Add support for Atmel I2C TPMs
Date: Tue, 1 Oct 2013 12:00:27 -0600
Message-ID: <20131001180027.GB1649@obsidianresearch.com>
References: <20130911205807.GA21467@obsidianresearch.com>
 <CADUykeorCx+YY1mF4DazXAmmnS=ocjdxeT2mHRsRxmJv04LFSQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CADUykeorCx+YY1mF4DazXAmmnS=ocjdxeT2mHRsRxmJv04LFSQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Teddy Reed <teddy.reed-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Leonidas Da Silva Barbosa <leosilva-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Ashley Lai <ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org>, Rajiv Andrade <mail-ZlhrYzitvtWsTnJN9+BGXg@public.gmane.org>, Peter Huewe <peter.huewe-d0qZbvYSIPpWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 01, 2013 at 12:43:42AM -0600, Teddy Reed wrote:
>    Looks great, thanks again Jason!
>    Also, if anyone would like some TSSOP AT97SC3204T's, please email me
>    and I will send you a few along with breakouts and programmable crystal
>    so you can test/play/break/etc, no charge, but I'd rather only ship
>    within the USA.
>    Signed-off-by: Teddy Reed <teddy-KaFzXBG2u9Ng9hUCZPvPmw@public.gmane.org>

Thanks Teddy,

I've updated the series with the revised commit message:
https://github.com/jgunthorpe/linux/commit/4378757fbf7771ffecc3b8779856dcc938f45234

tpm: Add support for Atmel I2C TPMs
This is based on the work of Teddy Reed <teddy-KaFzXBG2u9Ng9hUCZPvPmw@public.gmane.org> published
on GitHub:
 https://github.com/theopolis/tpm-i2c-atmel.git
 34894b9

That driver was never merged, I have taken it as a starting port,
forward ported, tested and revised the driver:
 - Make it broadly textually similar to the Infineon and Nuvoton I2C
   driver
 - Place everything in a format suitable for mainline inclusion
 - Use high level I2C functions i2c_master_send and
   i2c_master_recv for data xfer
 - Use the timeout system from the core code, by faking out a status
   register
 - Only I2C transfer the number of bytes in the reply, not a fixed
   message size.
 - checkpatch cleanups
 - Testing on ARM Kirkwood, with this device tree, using a
   AT97SC3204T-X1A180
        tpm@29 {
                compatible = "atmel,at97sc3204t";
                reg = <0x29>;
        };

Signed-off-by: Teddy Reed <teddy-KaFzXBG2u9Ng9hUCZPvPmw@public.gmane.org>
[jgg: revised and tested]
Signed-off-by: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>

Jason
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
