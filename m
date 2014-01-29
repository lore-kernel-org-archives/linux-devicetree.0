From: Boris BREZILLON <b.brezillon.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v2 09/14] mtd: nand: add sunxi NFC dt
 bindings doc
Date: Wed, 29 Jan 2014 19:30:20 +0100
Message-ID: <52E948BC.8090305@gmail.com>
References: <1391006064-28890-1-git-send-email-b.brezillon.dev@gmail.com> <1391006064-28890-10-git-send-email-b.brezillon.dev@gmail.com> <CAL_JsqLVr1gSLArqtfOiHce+u6ZK8FiKMX0o9bvMrMoGGhATvg@mail.gmail.com> <20980858CB6D3A4BAE95CA194937D5E73EA6C01D@DBDE04.ent.ti.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------000305030102010607010000"
Return-path: <linux-sunxi+bncBDE6NB73YAMBBRMRUWLQKGQECWFXSJI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA6C01D-yXqyApvAXouIQmiDNMet8wC/G2K4zDHf@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: "Gupta, Pekon" <pekon-l0cyMroinI0@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Ezequiel Garcia (ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org)" <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org" <dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is a multi-part message in MIME format.
--------------000305030102010607010000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Le 29/01/2014 19:02, Gupta, Pekon a =E9crit :
> Dear Rob, and other DT maintainers,
>
>> From: Rob Herring
> [...]
>>> +- onfi,nand-timing-mode : mandatory if the chip does not support the O=
NFI
>>> +  standard.
>> Add to generic nand binding.
>>
>>> +- allwinner,rb : shall contain the native Ready/Busy ids.
>>> + or
>>> +- rb-gpios : shall contain the gpios used as R/B pins.
>> Isn't allwinner,rb implied by a lack of rb-gpios property. Or no R/B
>> pin is an option? If so, don't you need some fixed time delay
>> properties like max erase time?
>>
>> rb-gpios could be added to the generic nand binding as well.
>>
> I do think this should go into generic nand binding, as this is controlle=
r specific.
> Some controllers have dedicated R/B pin (Ready/Busy) while others may use
> GPIO instead. It's the way a hardware controller is designed.

You meant "You do not think", right ?
If so, I think even if the retrieval and control of the GPIO is done is=20
each NAND
controller, we could at least use a common property name for all drivers=20
using
a GPIO to detect the R/B state.

>
> Request you to please consider Ack from MTD Maintainers 'at-least' for
> generic NAND DT bindings. There is already a discussion going in
> a separate thread for which is still not awaiting replies [1].
>
> [1] http://lists.infradead.org/pipermail/linux-mtd/2014-January/051625.ht=
ml

I missed this thread, but I can definitely use the nand-ecc-strength and
nand-ecc-step-size instead of the one I defined (nand-ecc-level), as long
as there is a proper way to define these informations in the DT.

I'll let DT and MTD maintainers decide ;-).

Best Regards,

Boris
>
>
> with regards, pekon

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/groups/opt_out.

--------------000305030102010607010000
Content-Type: text/html; charset=ISO-8859-1

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">Le 29/01/2014 19:02, Gupta, Pekon a
      &eacute;crit&nbsp;:<br>
    </div>
    <blockquote
      cite="mid:20980858CB6D3A4BAE95CA194937D5E73EA6C01D-yXqyApvAXouIQmiDNMet8wC/G2K4zDHf@public.gmane.org"
      type="cite">
      <pre wrap="">Dear Rob, and other DT maintainers,

</pre>
      <blockquote type="cite">
        <pre wrap="">From: Rob Herring
</pre>
      </blockquote>
      <pre wrap="">[...]
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="">+- onfi,nand-timing-mode : mandatory if the chip does not support the ONFI
+  standard.
</pre>
        </blockquote>
        <pre wrap="">
Add to generic nand binding.

</pre>
        <blockquote type="cite">
          <pre wrap="">+- allwinner,rb : shall contain the native Ready/Busy ids.
+ or
+- rb-gpios : shall contain the gpios used as R/B pins.
</pre>
        </blockquote>
        <pre wrap="">
Isn't allwinner,rb implied by a lack of rb-gpios property. Or no R/B
pin is an option? If so, don't you need some fixed time delay
properties like max erase time?

rb-gpios could be added to the generic nand binding as well.

</pre>
      </blockquote>
      <pre wrap="">I do think this should go into generic nand binding, as this is controller specific.
Some controllers have dedicated R/B pin (Ready/Busy) while others may use
GPIO instead. It's the way a hardware controller is designed.</pre>
    </blockquote>
    <br>
    You meant "You do not think", right ?<br>
    If so, I think even if the retrieval and control of the GPIO is done
    is each NAND<br>
    controller, we could at least use a common property name for all
    drivers using<br>
    a GPIO to detect the R/B state.<br>
    <br>
    <blockquote
      cite="mid:20980858CB6D3A4BAE95CA194937D5E73EA6C01D-yXqyApvAXouIQmiDNMet8wC/G2K4zDHf@public.gmane.org"
      type="cite">
      <pre wrap="">

Request you to please consider Ack from MTD Maintainers 'at-least' for
generic NAND DT bindings. There is already a discussion going in
a separate thread for which is still not awaiting replies [1].

[1] <a class="moz-txt-link-freetext" href="http://lists.infradead.org/pipermail/linux-mtd/2014-January/051625.html">http://lists.infradead.org/pipermail/linux-mtd/2014-January/051625.html</a></pre>
    </blockquote>
    <br>
    I missed this thread, but I can definitely use the nand-ecc-strength
    and<br>
    nand-ecc-step-size instead of the one I defined (nand-ecc-level), as
    long<br>
    as there is a proper way to define these informations in the DT.<br>
    <br>
    I'll let DT and MTD maintainers decide ;-).<br>
    <br>
    Best Regards,<br>
    <br>
    Boris<br>
    <meta http-equiv="content-type" content="text/html;
      charset=ISO-8859-1">
    <blockquote
      cite="mid:20980858CB6D3A4BAE95CA194937D5E73EA6C01D-yXqyApvAXouIQmiDNMet8wC/G2K4zDHf@public.gmane.org"
      type="cite">
      <pre wrap="">


with regards, pekon
</pre>
    </blockquote>
    <br>
  </body>
</html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org<br />
For more options, visit <a href="https://groups.google.com/groups/opt_out">https://groups.google.com/groups/opt_out</a>.<br />

--------------000305030102010607010000--
