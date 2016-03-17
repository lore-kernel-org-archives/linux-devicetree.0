From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: WARNING: DT compatible string vendor "mips" appears un-documented
Date: Thu, 17 Mar 2016 08:04:43 -0500
Message-ID: <CAL_JsqLGKW1beZET0brr7DDXbrz1ufi8i=OT-+drUu5cPkYLCw@mail.gmail.com>
References: <20160317060223.e14ebbdf05224845279843c3@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160317060223.e14ebbdf05224845279843c3-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Linux-MIPS <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 16, 2016 at 10:02 PM, Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi all,
>
> checkpatch.pl notes that DT compatible string vendor "mips" appears un-documented.
>
> On the one hand there are several users of this vendor string:
>
>     linux$ git grep \"mips,
>     Documentation/devicetree/bindings/mips/img/xilfpga.txt: - compatible: Must be "mips,m14Kc".
>     Documentation/devicetree/bindings/mips/img/xilfpga.txt:                 compatible = "mips,m14Kc";
>     arch/mips/boot/dts/lantiq/danube.dtsi:                  compatible = "mips,mips24Kc";
>     arch/mips/boot/dts/qca/ar9132.dtsi:                     compatible = "mips,mips24Kc";
>     arch/mips/boot/dts/ralink/mt7620a.dtsi:                 compatible = "mips,mips24KEc";
>     arch/mips/boot/dts/ralink/rt2880.dtsi:                  compatible = "mips,mips4KEc";
>     arch/mips/boot/dts/ralink/rt3050.dtsi:                  compatible = "mips,mips24KEc";
>     arch/mips/boot/dts/ralink/rt3883.dtsi:                  compatible = "mips,mips74Kc";
>     arch/mips/boot/dts/xilfpga/microAptiv.dtsi:                     compatible = "mips,m14Kc";
>
> On the other hand we already have the "mti" vendor string:
>
>     linux$ grep MIPS Documentation/devicetree/bindings/vendor-prefixes.txt
>     mti    Imagination Technologies Ltd. (formerly MIPS Technologies Inc.)
>
> Can we add an another one vendor string for MIPS?

No.

It is called checkpatch.pl, not checkfile.pl (yes, I know it can check
files too). There are many warnings if you look at the tree as a
whole. The main point of the checks (at least for DT) is to not
introduce new warnings.

So mips is deprecated and shouldn't be used for new bindings (perhaps
mti is too as img? should be used now). Continuing to use the existing
strings is fine.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
