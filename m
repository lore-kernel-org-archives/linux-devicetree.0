From: Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/5] dt/bindings: Add binding for the DA8xx MUSB driver
Date: Wed, 17 Feb 2016 10:18:49 +0100
Message-ID: <56C43AF9.3030906@barix.com>
References: <1455188466-10879-1-git-send-email-petr@barix.com>
 <20160212162110.GA21833@rob-hp-laptop> <56BE1531.8060800@barix.com>
 <CAL_Jsq+uBoSc_LutGrLswYYPGa5gZL3UqLxQxMi=KcxaDpAu8w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+uBoSc_LutGrLswYYPGa5gZL3UqLxQxMi=KcxaDpAu8w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Rob,

On 16.02.2016 21:05, Rob Herring wrote:
> On Fri, Feb 12, 2016 at 11:24 AM, Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org> wrote:
>> I understand your point that the description should be generic.
>> However the USB 2.0 specification does not define any relation between the
>> bMaxPower provided by the device and the actual power control.
>> As far as I understand the value just serves the purpose to raise a flag to
>> the user if the attached device would draw too much power, and not to enable
>> it at all.
> That won't really work given devices lie. My bus powered USB disk
> enclosure reports something like 10mA. That's pretty good considering
> I have a 5W drive in it.
Yes, that's exactly what's happening. The USB 2.0 is in that matter 
naive and assumes that the devices don't lie :-)
But at the same time gives them the possibility to lie by not binding 
this value to the physical current.
>> For instance on my development board the real maximum current is limited
>> only by the mains power-supply used.
>> So it cannot even be modelled in the DT as a regulator because the
>> power-supply is not part of the HW and
>> everybody can take a different one.
> Not part of which h/w? Different for everyone is exactly why Vbus
> supply should be described in DT.
I mean the regulator is in the AC power supply, which is standalone and 
can be changed. Therefore not described in the DT.
The DT describes only the board.

>> So defining a regulator just to store this arbitrary USB 2.0 value is a bit
>> overkill for me.
> If it is just arbitrary, then put it into the driver. I would do 500mA
> and be done with it. I'd guess there is nothing real behind the
> current default of 250mA.
Still there is some sense behind. The power_budget is used to possibly 
print a warning message and/or
disable a self powered device that announces too much power. So I would 
leave it configurable.

What would be your proposal then? Something like this?

     usb_reg: fixedregulator@0 {
         compatible = "regulator-fixed";
         regulator-name = "USB Vbus";
         regulator-always-on;
         regulator-max-microamp = <500000>;    /* 500mA */
     };

or a real regulator if there is one. And then reference it as:

     usb20: ... {
         ...
         vbus-supply = <&usb_reg>;
     }

As I said for me it's an overkill, knowing that this monster needs to be 
set-up and reside in memory just to write the power_budget variable for 
devices which anyway may lie.
But if you prefer that and Sergei and the guys from USB agree to it I 
don't really mind.--

Regards
Petr
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
