From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCHv2 1/2] ARM: vt8500: Update vt8500-ehci driver to support
 device tree.
Date: Fri, 20 Jul 2012 22:05:28 +0000
Message-ID: <201207202205.28815.arnd@arndb.de>
References: <1342787373-2230-1-git-send-email-linux@prisktech.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1342787373-2230-1-git-send-email-linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>
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
To: Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>
Cc: vt8500-wm8505-linux-kernel-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Friday 20 July 2012, Tony Prisk wrote:
> Signed-off-by: Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>
> ---
>  .../devicetree/bindings/usb/vt8500-ehci.txt        |   10 ++++++++++
>  drivers/usb/host/ehci-vt8500.c                     |    9 +++++++++
>  2 files changed, 19 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/usb/vt8500-ehci.txt

As mentioned, you need to Cc the USB mailing list and the EHCI maintainers:

$ ./scripts/get_maintainer.pl drivers/usb/host/ehci-vt8500.c -f
Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org> (maintainer:USB EHCI DRIVER)
Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org> (supporter:USB SUBSYSTEM)
linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org (open list:USB EHCI DRIVER)
linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org (open list)


> diff --git a/Documentation/devicetree/bindings/usb/vt8500-ehci.txt b/Documentation/devicetree/bindings/usb/vt8500-ehci.txt
> new file mode 100644
> index 0000000..74f75c6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/vt8500-ehci.txt
> @@ -0,0 +1,10 @@
> +VIA VT8500 and Wondermedia WM8xxx SoC USB controllers.
> +
> +Required properties:
> + - compatible: Should be "via,vt8500-ehci" or "wm,prizm-ehci".

I would list the interrupts and reg properties as required as well,
and you can mention that there must be exactly one interrupt and one
reg resource with a length of 0x200 bytes.

	Arnd
