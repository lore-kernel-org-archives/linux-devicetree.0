From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/1] Add Wondermedia Technologies (wmt) to
 docs/devicetree/vendor-bindings.txt
Date: Thu, 19 Jul 2012 11:16:26 +0000
Message-ID: <201207191116.27273.arnd@arndb.de>
References: <76F764B079F92A4E843589C893D0A022C380F1D4@SERVER.prisktech.co.nz>
 <CABjd4Yyk6XR6RizgcpjCdi2N_+Z2EzTtezbkN9V7r4bAXXjhqA@mail.gmail.com>
 <76F764B079F92A4E843589C893D0A022C381059B@SERVER.prisktech.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <76F764B079F92A4E843589C893D0A022C381059B-A1+cU8XkcJSYgi1/3OOQJ8krCUz0bFs7@public.gmane.org>
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
To: vt8500-wm8505-linux-kernel-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexey Charkov <alchark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

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
