From: Raviteja Garimella <raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [RFC 1/1] Changes to support the driver for platform device registration
Date: Fri, 6 Jan 2017 12:39:04 +0530
Message-ID: <CAEHZuqP9Bmt-SVFEOb6mW91nsrFdVxLi0m+X+uA5M_uh_wTkgg@mail.gmail.com>
References: <1483604597-26160-1-git-send-email-raviteja.garimella@broadcom.com>
 <1483604597-26160-2-git-send-email-raviteja.garimella@broadcom.com> <3d3e9fce-faae-3ff0-c42c-20f4bced663a@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3d3e9fce-faae-3ff0-c42c-20f4bced663a-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Florian,

On Thu, Jan 5, 2017 at 11:13 PM, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 01/05/2017 12:23 AM, Raviteja Garimella wrote:
>> -- Add OF based platform device registration
>> -- Modify debug prints to be compatible with both pci and platform devices
>> -- Add members to 'struct udc' for extcon and phy support
>> -- Add checks to not process repeated calls to udc connect and
>>    disconnect routines
>> -- Kconfig changes
>
> What you are doing in this patch is all well and good, but since you are
> listing these changes, that means we should see 4/5 patches submitted to
> this driver each one doing what you have as a bullet point.
>
> Since you are adding Device Tree probing support to the driver, you also
> need to create a proper binding document which describes the properties
> and nodes.

I will split this patch into multiple patches, and also create the
binding document.
Thanks. I will wait a bit for any other comments.

Ravi

>
> Thank you
> --
> Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
