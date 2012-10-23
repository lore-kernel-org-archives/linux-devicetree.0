From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 2/2] USB: doc: Binding document for ehci-platform driver
Date: Tue, 23 Oct 2012 12:47:09 -0600
Message-ID: <5086E62D.8040407@wwwdotorg.org>
References: <Pine.LNX.4.44L0.1210231340340.1635-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <Pine.LNX.4.44L0.1210231340340.1635-100000-IYeN2dnnYyZXsRXLowluHWD2FQJk+8+b@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/23/2012 11:59 AM, Alan Stern wrote:
> On Tue, 23 Oct 2012, Stephen Warren wrote:
> 
>>>> So, rather than:
>>>>
>>>> compatible = "usb-ehci";
>>>>
>>>> You should always have e.g.:
>>>>
>>>> compatible = "nvidia,tegra20-ehci", "usb-ehci";
>>>>
>>>> Given that, there is then always enough information in the device tree
>>>> for the driver to be able to derive the other values from the compatible
>>>> value.
>>>
>>> Yes, I get it.
>>>
>>>> Whether you want to derive the information, or whether you want to
>>>> explicitly represent it via properties, is a decision to make based on
>>>> the trade-offs.
>>>>
>>>> Oh, and I note that quite a few device trees already use compatible
>>>> value "usb-ehci" in their device-trees. Care needs to be taken not to
>>>> usurp that value from any existing device drivers if that was to be
>>>> picked as the compatible value required by this binding.
>>>
>>> Right.  I think Tony's new binding should use compatible value 
>>> "usb-ehci-platform".  It will essentially be a superset of "usb-ehci".
>>
>> I know this is bike-shedding a little bit, but...
>>
>> The word "platform" isn't really about describing the HW, but rather is
>> derived from the Linux SW used to program that HW. DT should be purely
>> about describing the HW.
>>
>> Perhaps "usb-ehci-generic" or "usb-ehci-simple" would be better?
> 
> Neither of those really describes the hardware either.  Which name gets 
> used seems pretty arbitrary.
> 
> Nothing intrinsically distinguishes this class of hardware.  The only
> thing these devices have in common is that they can be managed by
> Linux's ehci-platform driver.

I don't agree. They're all EHCI USB controllers (or all EHCI USB
controllers that don't require custom drivers due to quirks), which is a
much more general statement than anything related to which driver Linux
uses for them.

> For that purpose, "usb-ehci-platform"
> makes more sense than "usb-ehci-generic" or "usb-ehci-simple".
> 
> (It also allows the class to enlarge over time as the driver becomes
> more capable -- is that a bad thing?  Are DT board descriptions written
> for a later kernel supposed to be unusable with an earlier kernel that
> doesn't support the same features?)
> 
> In essense, we're trying to say that the HW is compatible with a 
> particular driver rather than with some other type of HW.

Using a compatible value in order to pick a specific driver in Linux is
explicitly against the device tree design principles; DT is supposed to
represent just the hardware.

> Maybe DT
> wasn't intended to provide this kind of information, but it seems like 
> a logical thing to do.  Unless DT already offers some other way to 
> accomplish the same thing?

The typical way is for the Linux driver to declare that is supports a
variety of different HW models.

Admittedly this is annoying when there are many HW models that otherwise
wouldn't need any driver changes, hence the desire to (additionally)
include some generic value in the compatible field, but again, what that
generic value is should be driven by the HW itself, not the SW that's
using it.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
