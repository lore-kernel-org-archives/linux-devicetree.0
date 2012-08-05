From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: DT GPIO numbering?
Date: Sun, 5 Aug 2012 12:06:03 +0200
Message-ID: <CACRpkdZryc95WpSXddCrLvZGDsv4x-ndX9XcVzoxaDCT53AFLw@mail.gmail.com>
References: <20120801152240.GA16388@sig21.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120801152240.GA16388-FF7aIK3TAVNeoWH0uzbU5w@public.gmane.org>
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
To: Johannes Stezenbach <js-FF7aIK3TAVNeoWH0uzbU5w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 1, 2012 at 5:22 PM, Johannes Stezenbach <js-FF7aIK3TAVNeoWH0uzbU5w@public.gmane.org> wrote:

> I'm currently learning how Linux devicetree support works,
> here is one question I couldn't find an answer for.
>
> I understand that within the devicetree GPIOs are referenced by phandle,
> thus the numbers are irrelevant.  However, in sysfs the number is
> what is used to access the GPIO, e.g. for debugging or
> blinkenlight apps.  How does this fit together?

I think it simply does not fit together.

Grant & me has been claiming the GPIO sysfs interface is a bit
crazy from time to time.

My long-term plan would be to replace it with /dev/gpio/gpioN
device nodes per-gpiochip and use ioctl etc to control these
beasts instead. However one does not do that overnight,
and my life is too busy, and other refactorings also need to
happen :-/

Yours,
Linus Walleij
