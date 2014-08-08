From: Jean-Michel Hautbois <jean-michel.hautbois-B+Q8N6RmIDZBDgjK7y7TUQ@public.gmane.org>
Subject: Fwd: Multiple devices with same SMBus address
Date: Fri, 8 Aug 2014 10:10:09 +0200
Message-ID: <CAL8zT=i8eHvJUH68gSZoPxVE994U_329=-tTkbhz4vksjmZ9zw@mail.gmail.com>
References: <CAL8zT=hs42xkjp9WYPf=baLjJURzhR9_v-icLX73_uxrqsuh8Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL8zT=hs42xkjp9WYPf=baLjJURzhR9_v-icLX73_uxrqsuh8Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

I have a custom board which has two LMH0303 SDI drivers on the same
i2c bus. They are connected in some daisy chain form, like on the
schematics in the datasheet on page 9 :
http://www.ti.com/lit/ds/symlink/lmh0303.pdf

My problem is how to declare these devices in the DT in order to set
the new adress of the first one when probed.

I thought that something like that could do the trick but it seems crappy :

lmh0303@17 {
    new-addr = <0x16>;
    rsti_n = <&gpio1_17>; /* GPIO signal connected to the RSTI signal
of the first LMH0303 */
};
lmh0303@17 {
    /* Nothing to do right now */
};

This is a draft thought :).

Maybe would it also be possible do define a "super device" like this :
lmh0303@17 {
    lmh0303_1 {
        new-addr = <0x16>;
        rsti_n = <&gpio1_17>; /* GPIO signal connected to the RSTI
signal of the first LMH0303 */
    };
    lmh0303_2 {
    };
};

This would be something like the gpio-leds binding...
But there is probably already a nice way to do that :-) ?

Thanks for your advices !
JM
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
