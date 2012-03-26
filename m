From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: uImage with integrated dtb file
Date: Mon, 26 Mar 2012 09:06:02 -0600
Message-ID: <4F7085DA.6030402@wwwdotorg.org>
References: <4F6E5D5B.8050306@antcom.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4F6E5D5B.8050306-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Roland Stigge <stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 03/24/2012 05:48 PM, Roland Stigge wrote:
> Hi,
> 
> since I will need to maintain some machines with DT enabled kernels but 
> containing a U-Boot without DT support, I sometimes need to integrate a 
> dtb file into uImage.
> 
> I'm sure others have got the same issue. But searching for a while I 
> only got older/meanwhile neglected approaches like:
> 
> git://kernel.ubuntu.com/jk/dt/linux-2.6.git - branch: dtbimage
> 
> I'm currently using a simple hack like attached below.
...
> --- a/arch/arm/boot/Makefile
...
>  quiet_cmd_uimage = UIMAGE  $@
> -      cmd_uimage = $(CONFIG_SHELL) $(MKIMAGE) -A arm -O linux -T kernel \
> +      cmd_uimage = cat $< arch/arm/boot/*.dtb > $<.tmp ; \

That won't work well when multiple .dtb files are built. That's
certainly common for Tegra, and probably most subarchs.

The concatenation should be optional; people not using
CONFIG_APPENDED_DTB (hopefully the majority) wouldn't want this for example.

Please be aware of:

https://lkml.org/lkml/2012/3/16/450
Kbuild: centralize MKIMAGE and cmd_uimage definitions

I believe previous discussion around this topic has resolved into people
not wanting to make CONFIG_APPENDED_DTB to easy to use, so that people
who don't need to use it won't be tempted to just use it instead of
explicit FDT support in bootloaders. For example, see:

https://lkml.org/lkml/2011/8/2/200
Build a uImage with dtb already appended

... which Grant has specifically stated he didn't want applied upstream
for the reason I mention above.

> +                  $(CONFIG_SHELL) $(MKIMAGE) -A arm -O linux -T kernel \
>                    -C none -a $(LOADADDR) -e $(STARTADDR) \
> -                  -n 'Linux-$(KERNELRELEASE)' -d $< $@
> +                  -n 'Linux-$(KERNELRELEASE)' -d $<.tmp $@ ; \
> +                  rm -f $<.tmp
