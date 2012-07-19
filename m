From: Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>
Subject: RE: [PATCH 1/2] ARM: vt8500: Update vt8500-ehci driver to support
 device tree.
Date: Thu, 19 Jul 2012 15:31:14 +0000
Message-ID: <76F764B079F92A4E843589C893D0A022C381243A@SERVER.prisktech.co.nz>
References: <1342704684-4858-1-git-send-email-linux@prisktech.co.nz>,
 <CABjd4YxfynH5f0dTwOh3EpiNr2vLq_2yJqys=Ztm_XV2oY4nsw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CABjd4YxfynH5f0dTwOh3EpiNr2vLq_2yJqys=Ztm_XV2oY4nsw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Alexey Charkov <alchark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "vt8500-wm8505-linux-kernel-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <vt8500-wm8505-linux-kernel-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Alexey Charkov [alchark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org]
Sent: 20 July 2012 02:45
To: vt8500-wm8505-linux-kernel-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Arnd Bergmann; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; Tony Prisk
Subject: Re: [PATCH 1/2] ARM: vt8500: Update vt8500-ehci driver to support device tree.

2012/7/19 Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>:
> Signed-off-by: Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>
> ---
>  drivers/usb/host/ehci-vt8500.c |    9 +++++++++
>  1 files changed, 9 insertions(+), 0 deletions(-)

Have you tried to use ehci-platform on VIA/WMT devices? If it works
(which I would expect), I believe it's better to include OF support
into ehci-platform and drop ehci-vt8500 completely after existing
boards are converted to Device Tree. When writing ehci-vt8500, I
mostly only copied stuff from the PCI version and made it initialize
from the platform bus (nothing specific to vt8500).

Thanks,
Alexey

-----


The ehci-platform device requires platform_data be passed at probe.
While its generic enought , it puts requirements on the device-tree to setup
the private data, which would be messy to get approved I suspect.

Regards

Tony P
