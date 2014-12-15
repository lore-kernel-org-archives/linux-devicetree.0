From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Re: [PATCH 5/5] ARM: dts: sun6i: Add dts file for
 CSQ CS908 board
Date: Mon, 15 Dec 2014 12:38:13 +0100
Message-ID: <548EC825.7080602@redhat.com>
References: <1416747283-13489-1-git-send-email-hdegoede@redhat.com>	<1416747283-13489-6-git-send-email-hdegoede@redhat.com>	<20141125182147.GD25249@lukather>	<5475962A.4090508@redhat.com> <CAEKpxBnm2w9pcuf_T1HaO8ACz+94U9G3MeYKNhtzph+9fPtPWg@mail.gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBDRZXY4CYYORBMEQXOSAKGQEKVN4GYI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <CAEKpxBnm2w9pcuf_T1HaO8ACz+94U9G3MeYKNhtzph+9fPtPWg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 15-12-14 11:21, Code Kipper wrote:
>>
>> usb0 (otg): usb-a receptacle 1 (labeled 1 on the box, 0 on the print)
>> usb1 (ehci): routed to internal wifi
>> usb2 (ehci): usb-a receptacle 2 (labeled 2 on both the box and the print)
>>
>> I'm using fel mode with an usb-a <-> usb-a cable connected to usb0 on
>> the cs908. The cs908 has no fel button, so I've hooked up the serial
>> console,
>> and then keep 2 pressed on the serial console while inserting the usb-a
>> into
>> the PC (which will also power the board). boot0 from the nand will then
>> jump
>> into fel mode when it sees the 2 keypress.
>>
>
> Hi Hans,
>
> I'm looking to try this on my vidon box which like the cs908 doesn't have
> OTG
> or a fel button. Just would like to confirm the wiring on the usb-a 2 usb-a
> male
> cable. Are they connected one to one i.e. 5v <-> 5v, D+ <-> D+ etc or are
> the
> data lines twisted. i.e. D+ <-> D- and vice versa?.

I don't know, I just picked a A <-> A cable out of my box with usb cables
(some regular usb devices actually ship with an A receptacle instead of a B)
used that and things just worked. So I would say whatever standard A <-> A
cables are using.

Regards,

Hans
