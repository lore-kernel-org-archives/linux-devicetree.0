From: Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>
Subject: RE: [PATCH 1/1] Add Wondermedia Technologies (wmt) to
 docs/devicetree/vendor-bindings.txt
Date: Thu, 19 Jul 2012 11:45:59 +0000
Message-ID: <76F764B079F92A4E843589C893D0A022C3811BFD@SERVER.prisktech.co.nz>
References: <76F764B079F92A4E843589C893D0A022C380F1D4@SERVER.prisktech.co.nz>
 <CABjd4Yyk6XR6RizgcpjCdi2N_+Z2EzTtezbkN9V7r4bAXXjhqA@mail.gmail.com>
 <76F764B079F92A4E843589C893D0A022C381059B@SERVER.prisktech.co.nz>,
 <201207191116.27273.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201207191116.27273.arnd-r2nGTMty4D4@public.gmane.org>
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
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "vt8500-wm8505-linux-kernel-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <vt8500-wm8505-linux-kernel-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Alexey Charkov <alchark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Arnd Bergmann [arnd-r2nGTMty4D4@public.gmane.org]
Sent: 19 July 2012 23:16
To: vt8500-wm8505-linux-kernel-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Tony Prisk; Alexey Charkov; devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; Russell King; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Subject: Re: [PATCH 1/1] Add Wondermedia Technologies (wmt) to docs/devicetree/vendor-bindings.txt

On Thursday 19 July 2012, Tony Prisk wrote:
> Given that there have been no replies to this thread, and the restart patch has
> now been accepted using 'wmt' as the vendor namespace - would it be safe to
> assume we should formalize this in the vendor-bindings.txt?
>
> I'd like to try and have basic device tree support added for the next merge
> window (or this one if it all goes well :) ), but it relies on the vendor binding being
> formalized.

What about devices that come from via though? Anything that first showed up
in vt8500 or earlier should probably get a prefix identifying VIA rather
than WonderMedia.

        Arnd


I have no issue with that.

I am mainly concerned with the Wondermedia products at the moment.

Adding device tree support for WM8505 (and WM8650) is my main goal as the WM8650
currently isn't supported and trying to get another board file added seems unlikely with
everything moving to device tree. The VT8500 requires additional/different patches and
as I don't have a vt8500 I can't test them.

It does raise the question of applying 'wmt, prizm-pmc' to the vt8500 though. While it's
fine for the restart patch I submitted, the vt8500 registers are the same but the bit-fields
are different and therefore not entirely compatible with 'prizm-pmc'.
When it comes to other PMC-related features, in particular the clocks, the VT8500 is quite
different in its bit-fields.

The vt8500 isn't technically in the Prizm family, as that is Wondermedia's name for the SoC's.


Regard

Tony P
