From: boris brezillon dev <b.brezillon.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Re: [RFC PATCH v2 09/14] mtd: nand: add sunxi NFC
 dt bindings doc
Date: Thu, 30 Jan 2014 09:46:38 +0100
Message-ID: <52EA116E.3030100@gmail.com>
References: <1391006064-28890-1-git-send-email-b.brezillon.dev@gmail.com>	 <1391006064-28890-10-git-send-email-b.brezillon.dev@gmail.com>	 <CAL_JsqLVr1gSLArqtfOiHce+u6ZK8FiKMX0o9bvMrMoGGhATvg@mail.gmail.com> <1391035079.14902.3.camel@localhost>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDE6NB73YAMBB4FCVCLQKGQE7572FSI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1391035079.14902.3.camel@localhost>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: =?UTF-8?B?SGVucmlrIE5vcmRzdHLDtm0=?= <henrik-N0bZODiMPoV/1Aw6q1k8hdHuzzzSOjJt@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Henrik,

Sorry for the noise, I sent the mail to Rob's old address.

On 29/01/2014 23:37, Henrik Nordstr=C3=B6m wrote:
> ons 2014-01-29 klockan 11:11 -0600 skrev Rob Herring:
>
>> Isn't allwinner,rb implied by a lack of rb-gpios property. Or no R/B
>> pin is an option? If so, don't you need some fixed time delay
>> properties like max erase time?
>>
>> rb-gpios could be added to the generic nand binding as well.
> The Allwinner NAND controller have dedicated RB pins when NAND is
> enabled, only MUXed with other functions when NAND is not enabled.
>
> Leaving RB unconnected is not a valid hardware configuration. The
> controller internal timing engine depends on being able to sense RB to
> sequence NAND commands properly.

This is not true (at least in this driver). It was in yuq's driver because
he was using the NFC_WAIT_FLAG ,and in this case the controller wait
for the native R/B pin to be high before considering the CMD is complete.

This driver choose the appropriate way to test the R/B state of the
NAND chip according to what was specified in the DT:
- allwinner,rb: native R/B id. These pins will be used by the NAND
   controller to test the R/B state. Only 0 and 1 are valid because the
   NAND controller only support 2 R/B pins.
- rb-gpios: gpio used for R/B tests. This is a simple GPIO and will
   use the GPIO subsystem to test the R/B pin state.
- none: the NAND base code will wait some time before and send
   STATUS cmd to the NAND to check its status.

BTW, the controller supports 8 CS (8 NAND chips), but only have 2 native
R/B pins, this means you'll have to use the GPIO or standard GET_STATUS
method if you connect 3 or more NAND chips.

And for the record, I still think the rb-gpios property (or whatever
common name you choose: nand-rb-gpios ?) should be part of
the generic NAND binding, because other controllers (at least the
atmel one :)) use GPIOs to test R/B state.

Best Regards,

Boris

>
> Regards
> Henrik
>

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/groups/opt_out.
