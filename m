From: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: supply a DTB file to be appended
Date: Mon, 19 Sep 2011 11:22:28 -0400 (EDT)
Message-ID: <alpine.LFD.2.00.1109191118400.20358@xanadu.home>
References: <1315476884-28470-1-git-send-email-linus.walleij@stericsson.com>
	<CACRpkdZ+s_y=4VJuz5WetaU1tUFF-f6g38bpy6TSRjt9Q_VgLg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CACRpkdZ+s_y=4VJuz5WetaU1tUFF-f6g38bpy6TSRjt9Q_VgLg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 19 Sep 2011, Linus Walleij wrote:

> On Thu, Sep 8, 2011 at 12:14 PM, Linus Walleij
> <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org> wrote:
> 
> > This makes it easy to script the kernel build with
> > different device trees, and it also vastly simplifies
> > building uImages since "make uImage" will now pick
> > up the devcie tree and include it in the final image
> > as part of the build process.
> 
> A clarification here on what it actually simplifies.
> 
> make zImage
> cat my.dtb >> arch/arm/boot/zImage
> make uImage
> 
> Does *not* work.

You must have been confused by what this patch fixes:

http://www.arm.linux.org.uk/developer/patches/viewpatch.php?id=7016/1

Some confusion on my part made me create a similar patch and send it to 
RMK, but the issue being fixed is the same.

So yes, the above now *does* work.


Nicolas
