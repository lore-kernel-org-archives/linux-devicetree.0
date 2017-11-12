From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH v7 usb-next 4/4] dt-bindings: usb: xhci: include the
 roothub and a device in the example
Date: Sun, 12 Nov 2017 21:48:36 +0100
Message-ID: <CAFBinCCFN-AWjQPWoC-0VaJZz0zK8EKcZP89d_=BqVAoz1vROA@mail.gmail.com>
References: <CAFBinCALbByzAiAqTOzGj6XHASGwWX34xg7GKf=Fa6_eiCEnkA@mail.gmail.com>
 <Pine.LNX.4.44L0.1710271550360.1355-100000@iolanthe.rowland.org>
 <CAFBinCBocmr6fywO9vqWu+ngfrbG=FBFqdEvYEBWR84VgMANpw@mail.gmail.com>
 <CAK8P3a1xdUy7g991MbtrSTYFsM864MQDc61=sLZmfSMwrokCBg@mail.gmail.com> <CAFBinCBJuL7J7847ZU0jO=O0WuwNZj_oBT4NO1+ge11dEbQL+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFBinCBJuL7J7847ZU0jO=O0WuwNZj_oBT4NO1+ge11dEbQL+w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:ARM/Amlogic Meson SoC support" <linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Arnd (and anyone else who is interested in this),

On Mon, Oct 30, 2017 at 11:59 PM, Martin Blumenstingl
<martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
> Hi Arnd,
>
> On Mon, Oct 30, 2017 at 3:08 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
>> On Sat, Oct 28, 2017 at 3:33 PM, Martin Blumenstingl
>> <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
>>> On Fri, Oct 27, 2017 at 9:55 PM, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org> wrote:
>>>> On Fri, 27 Oct 2017, Martin Blumenstingl wrote:
>>>>> >> diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Documentation/devicetree/bindings/usb/usb-xhci.txt
>>>>> >> index 5b49ba9f2f9a..20e5ce2b016a 100644
>>>>> >> --- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
>>>>> >> +++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
>>>>> >> @@ -42,4 +42,27 @@ Example:
>>>>> >>               compatible = "generic-xhci";
>>>>> >>               reg = <0xf0931000 0x8c8>;
>>>>> >>               interrupts = <0x0 0x4e 0x0>;
>>>>> >> +
>>>>> >> +             #address-cells = <1>;
>>>>> >> +             #size-cells = <0>;
>>>>> >> +
>>>>> >> +             /* see usb-roothub.txt */
>>>>> >> +             roothub@0 {
>>>>> >> +                     compatible = "usb1d6b,3", "usb1d6b,2";
>>>>> >> +                     #address-cells = <1>;
>>>>> >> +                     #size-cells = <0>;
>>>>> >> +                     reg = <0>;
>>>>> >> +
>>>>> >> +                     port@1 {
>>>>> >> +                             reg = <1>;
>>>>> >> +                             phys = <&usb2_phy1>, <&usb3_phy1>;
>>>>> >> +                             phy-names = "usb2-phy", "usb3-phy";
>>>>> >> +                     };
>>>>> >> +             };
>>>>> >> +
>>>>> >> +             /* see usb-device.txt */
>>>>> >> +             hub: genesys@1 {
>>
>>>> Two things to be aware of:
>>>>
>>>>     1.  /sys/kernel/debug/usb/devices has an off-by-one error in the
>>>>         "Port=" field.  Every value you see should actually be one
>>>>         higher than it is.  It has been this way for many, many years
>>>>         so we can't fix it now.
>>> here's the output of "lsusb -t" (which is easier to read I guess):
>>> # lsusb -t
>>> /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci-hcd/0p, 5000M
>>> /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci-hcd/2p, 480M
>>>    |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 480M
>>>        |__ Port 3: Dev 3, If 0, Class=Mass Storage, Driver=usb-storage, 480M
>>
>> I see two possible problems here:
>>
>> * Linux does show the root hub as a parent of the external hub,
>>   while the DT shows them as two unrelated children of the host
>>   controller. This clearly doesn't reflect the reality, and may come
>>   to bite us again later when we try to extend it in some other way.
> ok, I see your point here
>
>> * Listing the root hub as compatible="usb1d6b,3" encodes a Linux
>>   implementation detail into the OS-independent DT ABI: The
>>   root hub does not actually have this vendor/device ID, it's
>>   just something we make up in Linux.
> I see, this would have to be more generic then (compatible =
> "usb-root-hub", etc..)
> however, let's postpone this discussion and evaluate more options (see below)
>
>> I think you mentioned that an earlier version of the patch set
>> did not have the root hub at all but instead listed the PHYs directly
>> under the host controller. Can you summarize what the problem
>> with that approach was?
> this is going on for a while now, I think it started with Rob's
> comment here: [0]
> I do not remember any explicit NACKs on that idea
>
> I took a step back and tried to figure out the
> requirements/constraints again (in no specific order):
> a) we need to initialize multiple PHYs on an xHCI controller
> b) other USB controller implementation already initialize multiple
> PHYs (see [1]) and we must not break these
> c) we need to make sure that we don't get any conflicts when specifying PHYs
>   (for example: if we pass the PHY for the root-hub/controller port 1
> at &usb/device@1 then we may run into a problem where device@1 also
> requires a USB PHY. I'm not sure if such cases exist in real-life
> though)
> d) currently the devicetree phy bindings state that a phy-names
> property is mandatory (see [2], I interpret this as 'we cannot have
> "phys = <...>" without "phy-names = ...'")
> e) existing USB OF helper functions (like of_usb_get_dr_mode_by_phy)
> rely on the fact that the PHY is specified directly at the controller
> f) DT hierarchy should match the reality
> g) ...feel free to name more
>
> defining the PHYs directly under the controller node gives these
> results (my own interpretation):
> a) we can implement this similar to my current patch (the only
> difference would be where the code takes the PHYs from)
> b) I am not familiar with these other drivers, however we might be
> able to fix those by simply removing the "parse all PHYs" code from
> them (and rely on our new code)
> c) I don't see any problems, if a controller needs more than just an
> USB PHY then we could still use the "phy-names" to skip all non USB
> PHYs
> d) we would either have to make phy-names optional for this specific
> use-case or come up with a convention how the phy-names should be
> built for our case
> e) of_usb_get_dr_mode_by_phy and friends would still work - no changes required
> f) hierarchy matches the reality if we define that the root-hub is not
> specified in device-tree (this would mean that we simply treat the
> PHYs as properties of the controller, I'm not aware of any other
> "root-hub" specific properties)
>
> defining the PHYs in a root-hub node gives these results (my own
> interpretation):
> a) that's what this series does
> b) we're not touching the other implementations - however, existing
> .dts files would have to be changed to switch to this new binding
> c) the root-hub is currently separated, so there are no conflicts
> (needs more thoughts though if we need to nest the USB devices below
> the root-hub)
> d) phy-names can be specified easily and non USB PHYs are skipped by
> the current code already
> e) of_usb_get_dr_mode_by_phy and friends would have to be adjusted
> (not part of this series yet)
> f) the root-hub is now described in devicetree but the hierarchy may
> not be correct
>
> could you please let me know if you see more requirements or constraints?
> do you agree with my interpretation of the two possible solutions (and
> even more important: which are the ones you don't agree with)?
did you have time to go through this yet?
I have more time to work on this next week

>> Is it correct that roothub@0/port@1 corresponds to the same
>> connector that genesys@1 is connected to?
> yes, both refer to the same port/connector
>
>
> Regards
> Martin
>
>
> [0] http://lists.infradead.org/pipermail/linux-amlogic/2016-November/001818.html
> [1] http://lists.infradead.org/pipermail/linux-amlogic/2017-January/001947.html
> [2] http://elixir.free-electrons.com/linux/v4.13.9/source/Documentation/devicetree/bindings/phy/phy-bindings.txt#L33


Regards
Martin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
