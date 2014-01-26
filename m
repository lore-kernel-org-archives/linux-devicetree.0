From: Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: Firmware for Bluetooth (and wifi)
Date: Sun, 26 Jan 2014 22:39:52 +0100
Message-ID: <52E580A8.4060600@broadcom.com>
References: <52A040CE.5040706@schinagl.nl> <CAFXj5xjJ0DTa0Qo1avLboQF-e3TFv3aEr_jjkuZjinwuTzXykQ@mail.gmail.com> <52A09B5B.70800@schinagl.nl> <CAGRGNgWBgWqoPUdHSm2OXGb8r-ca5NX2z4_v0eG6oOMgJRd3HQ@mail.gmail.com> <52B17973.1000608@broadcom.com> <52B19F38.7060503@redhat.com> <52B1CA51.4010202@broadcom.com> <CAGb2v67cnP0yth0xxBKcaW_T2fF+4nP4r6h9NLqy5FV2x=hO=Q@mail.gmail.com> <CAGb2v67mmYnyPeOd4Wwp1zHs7EC_Gr+gEdaaMWeKP5z_Z_SVGA@mail.gmail.com> <CAGb2v66646-1Sye=Eb04_SoeCGBU064OePcxDi7th1fqU8XfBg@mail.gmail.com> <52BD68BA.3080304@broadcom.com> <CAGb2v67Q=q4vyOftb+BLhAYR-6d04dDP3+kY3b88U8_vCvAmgQ@mail.gmail.com> <52CD12D4.5030008@broadcom.com> <CAGb2v64+5Rgs6JxD0iH3bcwXPOm-xyS_LSmWLfx0qiMQwreOeQ@mail.gmail.com> <52E19A27.7000402@redhat.com> <52E19E1C.1010402@redhat.com> <CAGb2v66KhGoGmoFkTw9PQYBtX
 9YQbmxk4oy_tM4LM_UhZMkcZg@mail.gmail.com> <52E5392B.80605@redhat.com> <CAGb2v6594vsKCd9E8apojQXE8h6WJj4-doJ8wa85Nt3EFZhXHA@mail.gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBCKLZOXH5AIBBPEBS2LQKGQE2XEBEBQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <CAGb2v6594vsKCd9E8apojQXE8h6WJj4-doJ8wa85Nt3EFZhXHA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/26/2014 05:58 PM, Chen-Yu Tsai wrote:
> Hi,
> 
> On Mon, Jan 27, 2014 at 12:34 AM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>> Hi,
>>
>> On 01/24/2014 04:38 AM, Chen-Yu Tsai wrote:
>>
>> <snip>
>>
>>
>>>> Quick update, I've just tested:
>>>> https://github.com/wens/linux/commits/wip/sunxi-next-wifi
>>>
>>>
>>> About this, I would like to move WiFi power control to a regulator,
>>> and controlled by sunxi-mci via vmmc-supply (not supported ATM)
>>
>>
>> Actually the sunxi-mci.c driver already has support for an optional
>> regulator called vmmc.
>>
>> I like this idea, I've done a version of the dt patch using a regulator
>> instead of rfkill here:
>> https://github.com/jwrdegoede/linux-sunxi/commit/8d200113b573549cdcdc1b2d5a5a1cad15cfbe07
>>
>> This works as advertised and IMHO is the better solution.
> 
> I have a version in another branch I haven't pushed. I had it using an
> always-on regulator. I can adjust it to use vmmc.
> 
> BTW, I'd like to do a patch for sunxi-mci to use the DT parsing code
> in mmc core.
> We should re-use code if possible, wouldn't you agree?
> 
>>>> About the oob interrupt stuff not working, AFAIK you should set a pinctrl
>>>> function (not input, but a function like mmc is a function) on the pin in
>>>> question
>>>> for it to work as external interrupt, I believe you're not doing so in
>>>> your
>>>> dts.
>>>
>>>
>>> The pinctrl driver seems to set the function when the interrupt is
>>> enabled.
>>> Unfortunately we don't have any documentation/examples on how to use them.
>>> I will look into that later.
>>
>>
>> Hmm, but you also have a pinctrl entry in the dts setting it up as
>> gpio-input,
>> maybe that conflicts ?
> 
> I made a version with pinctrl entry setup as "irq", got an interrupt,
> but then the whole thing hung. Looks like pinctrl irqchip was not
> properly handling chained interrupts. I have done a simple fix, and I
> hope to test it tomorrow. Then I'll do some more testing with different
> configurations and hopefully write some documents.

Hi Chen-Yu,

I had a look at github tree from Hans with your DT support patch for
brcmfmac. I applied it to my 3.14 tree and modified it a little. I guess
the bindings are still experimental, but I would prefer you to use brcm
instead of broadcom in the 'compatible' entry as found in
Documentation/devicetree/bindings/vendor-prefixes.txt. There is an
exception to this rule in the bindings (in net/broadcom-bcm87xx.txt),
but I guess that train has left and it is tricky to change it now.
In the brcmfmac patch you also use multiple of_device ids. Could we make
it more generic, ie. compatible = "brcm,brcmfmac" or "brcm,wifi-fullmac"
or whatever...

Regards,
Arend
