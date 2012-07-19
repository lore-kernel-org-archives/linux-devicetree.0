From: Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>
Subject: RE: [PATCH 1/1] Add Wondermedia Technologies (wmt) to
 docs/devicetree/vendor-bindings.txt
Date: Thu, 19 Jul 2012 12:19:28 +0000
Message-ID: <76F764B079F92A4E843589C893D0A022C381202D@SERVER.prisktech.co.nz>
References: <76F764B079F92A4E843589C893D0A022C380F1D4@SERVER.prisktech.co.nz>
 <CABjd4Yyk6XR6RizgcpjCdi2N_+Z2EzTtezbkN9V7r4bAXXjhqA@mail.gmail.com>
 <76F764B079F92A4E843589C893D0A022C381059B@SERVER.prisktech.co.nz>
 <201207191116.27273.arnd@arndb.de>
 <76F764B079F92A4E843589C893D0A022C3811BFD@SERVER.prisktech.co.nz>,
 <CABjd4YyV6mrdRBXyixz_+ZDi1szNPJMSUNuT80FPySp+43FrTA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CABjd4YyV6mrdRBXyixz_+ZDi1szNPJMSUNuT80FPySp+43FrTA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-GB
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Alexey Charkov <alchark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "vt8500-wm8505-linux-kernel-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <vt8500-wm8505-linux-kernel-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Alexey Charkov [alchark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org]
Sent: 20 July 2012 00:12
To: Tony Prisk
Cc: Arnd Bergmann; vt8500-wm8505-linux-kernel-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org; devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; Russell King; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Subject: Re: [PATCH 1/1] Add Wondermedia Technologies (wmt) to docs/devicetree/vendor-bindings.txt

2012/7/19 Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>:
> From: Arnd Bergmann [arnd-r2nGTMty4D4@public.gmane.org]
> Sent: 19 July 2012 23:16
> To: vt8500-wm8505-linux-kernel-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
> Cc: Tony Prisk; Alexey Charkov; devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; Russell King; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Subject: Re: [PATCH 1/1] Add Wondermedia Technologies (wmt) to docs/devicetree/vendor-bindings.txt
>
> On Thursday 19 July 2012, Tony Prisk wrote:
>> Given that there have been no replies to this thread, and the restart patch has
>> now been accepted using 'wmt' as the vendor namespace - would it be safe to
>> assume we should formalize this in the vendor-bindings.txt?
>>
>> I'd like to try and have basic device tree support added for the next merge
>> window (or this one if it all goes well :) ), but it relies on the vendor binding being
>> formalized.
>
> What about devices that come from via though? Anything that first showed up
> in vt8500 or earlier should probably get a prefix identifying VIA rather
> than WonderMedia.
>
>         Arnd
>
>
> I have no issue with that.
>
> I am mainly concerned with the Wondermedia products at the moment.
>
> Adding device tree support for WM8505 (and WM8650) is my main goal as the WM8650
> currently isn't supported and trying to get another board file added seems unlikely with
> everything moving to device tree. The VT8500 requires additional/different patches and
> as I don't have a vt8500 I can't test them.

I believe that Arnd's point was about the hardware that WonderMedia
chips have inherited from their VIA ancestors, like NAND, SD/MMC,
graphics engine, USB EHCI glue, PWM, PS/2 controller, parts of PMC
etc. Those would be more appropriately named with something
VIA-specific rather than WMT as the vendor prefix (this would apply
for the PWM and the raster engine, which are unchanged between VT8500
and WM8505, to my knowledge).

On the other hand, all of these parts might well be some kind of
licensed third-party design anyway, which makes this whole VIA vs. WMT
a bikeshed discussion mostly. I would personally not feel too guilty
about calling some device that first appeared in a VT8xxx chip 'wmt'
until there's technical reason for different 'compatible' strings
matching different chip versions (VIA age vs. WMT age). So far, we
don't have that need.

Best,
Alexey

-----

The problem is that we do have that need now - as I pointed out the PMC
on the VT8500 should not use the 'wmt,prizm-pmc' compatibility as it isn't
actually compatible. Any time you wanted to modify a bit-field you would
need to check whether you had a VT8500 or WM8xxx.

I appreciate that a lot of the devices are identical, but we do still need to
sort out those devices that aren't and what we're going to do with them.

The framebuffer is a good example - we have two separate drivers, one
for VT8500 and one for WM8xxx.

Regards,
Tony
