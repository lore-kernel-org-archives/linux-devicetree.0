From: Christopher Bostic <christopher.lee.bostic-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 15/18] drivers/fsi: Add documentation for GPIO based
 FSI master
Date: Wed, 1 Feb 2017 11:09:38 -0600
Message-ID: <CAA0LjjVMh4DNH7BoF_pgQHWowS0d4_LBue_VP20GkydHSgcLow@mail.gmail.com>
References: <1484260543-80300-1-git-send-email-christopher.lee.bostic@gmail.com>
 <20170118215755.xoamoc2rrzhy4kyz@rob-hp-laptop> <f0933f56-6a23-9c53-6e10-0e1ca18082e2@ozlabs.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <f0933f56-6a23-9c53-6e10-0e1ca18082e2-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, Open List OF Flattened dev tree bindings <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Moderated list: ARM PORT" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, Linux open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, Alistair Popple <alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Chris Bostic <cbostic-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 18, 2017 at 8:11 PM, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org> wrote:
> Hi Chris,
>
> From this:
>
>>> +
>>> +The standard FSI master node
>>> +----------------------------
>>> +This node describes a FSI master implmemented fully in hardware
>>> +with dedicated input/output pins required for its function (i.e.
>>> +not using generic GPIO pins).
>>> +Required property:
>>> +    compatible = "ibm,fsi-master"
>
> and this:
>
>>> +Example:
>>> +
>>> +fsi-master {
>>> +    compatible = "ibm,fsi-master-gpio", "ibm,fsi-master";
>>
>> From the description, these should be mutually exclusive.
>
> I agree with Rob here. The intention is for "ibm,fsi-master" to be an
> abstract master -- simply indicating that this node describes a master,
> with no specific implementation, and "ibm,fsi-master-gpio" to be a
> GPIO-based implementation. A hardware-based FSI master would have a
> different compatible value, based on the hardware.
>
> We should remove references to implementations in the "The standard FSI
> master node" section, because this is independent of implementation.
>

Hi,

OK will make that change for version 4.

>>> +    clk-gpios = <&gpio 0>, <&gpio 6>;
>>> +    data-gpios = <&gpio 1>, <&gpio 7>;
>>> +    enable-gpios = <&gpio 2>, <&gpio 8>;
>>> +    trans-gpios = <&gpio 3>, <&gpio 9>;
>>> +    mux-gpios = <&gpio 4>, <&gpio 10>;
>
> Do we support multiple-link masters? This example implies a 2-link
> master.
>

Should we start with a single link in this case?  To start off with
only one link is supported by the master.

Thanks

> Cheers,
>
>
> Jeremy
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
