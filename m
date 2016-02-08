From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun7i: Enable USB DRC on Itead Ibox
Date: Mon, 8 Feb 2016 18:34:59 +0100
Message-ID: <56B8D1C3.809@redhat.com>
References: <1454947167-12236-1-git-send-email-codekipper@gmail.com>
 <56B8BED7.9030704@redhat.com>
 <CAEKpxBkXp9hx6KWpWyRBvYBFi7Sr0FgFHrD6M0nSBuJ1bV++1A@mail.gmail.com>
Reply-To: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBDRZXY4CYYORBSVD4O2QKGQE6B76LTI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <CAEKpxBkXp9hx6KWpWyRBvYBFi7Sr0FgFHrD6M0nSBuJ1bV++1A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 08-02-16 17:56, Code Kipper wrote:
> On 8 February 2016 at 17:14, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>> Hi,
>>
>> On 08-02-16 16:59, codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
>>>
>>> From: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>
>>> Enable the otg/drc usb controller on the Itead Ibox device.
>>>
>>> Signed-off-by: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>
>>
>> Same remark as with your Olimex A20 EVB board patch, please
>> also provide a vbus detect pin setting. If for some reason the
>> VBus detect is not wired up, or not working properly, please mention
>> this explicitly in the commit message.
> Hi Hans,
> I've added vbus detect and it no longer works. It's mentioned that the
> Itead Ibox is similar to the Cubieboard 2 which also doesn't include
> the detect. I can see now in the commit that it states "Note this
> board has the otg-vbus connected directly to the 5v-dcc of the board,
> so there is no vbus0 regulator, nor vbus0-det.", I will add this to
> the commit message and try and dig out a schematic to confirm.

Ok, thanks for looking into this.

Regards,

Hans
