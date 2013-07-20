From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] [ATTEND] Handling of devicetree bindings
Date: Sat, 20 Jul 2013 18:16:32 +0200
Message-ID: <CACRpkdZtkiqfs_7iantgQc4_Ch-nKCzMtDDooB6TikL5cVwD9g@mail.gmail.com>
References: <20130713192647.GA3798@katana> <20130713204927.GA1124@roeck-us.net>
 <CACRpkdaJ5podVCrb7XuhhGF0Oco+eLrFH0EVGZM0MBbGP9m7WQ@mail.gmail.com>
 <20130715165620.GA29040@kroah.com>
 <1373914227.2128.24.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1373914227.2128.24.camel-Fexsq3y4057IgHVZqg5X0TlWvGAXklZc@public.gmane.org>
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
To: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, ksummit-2013-discuss-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 15, 2013 at 8:50 PM, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org> wrote:

> I've heard tales of people having to keep device-tree files for their
> board tightly in sync with the specific *version* of the Linux kernel
> that they were shipped with.
>
> That makes me very sad, because it almost certainly means that someone
> has done it completely and utterly wrong.

This paradigm creep up in ideas like the FIT image at this
years ELC:
http://events.linuxfoundation.org/images/stories/slides/elc2013_fernandes.pdf

Surely, most complex mobile systems (such as mobile handsets) are
flashed with some custom-brew composite images, FIT seems to want
to start to standardize that.

However the dangerous stuff is not this tool even, it happens on the
build systems: multiple things are compiled together and stuffed into
an image, the device tree and kernel is always recompiled at every
image composition. Everything is versioned in sync.

This means that most embedded companies have a build system
where it is possible for system integrators to alter kernel code and
device trees at the same time.

I think their mental model is that of assembling a fridge or a car or
something - you take this bolt and it fits with that nut, and it's OK if
it only fits on just this one model of the end product.

Changing that way of thinking goes well outside the kernel community
I'm afraid, one way would be if device trees had conformance tests
such as is done for ACPI (or USB, or whatever) meaning it will at
some point arrive at a final, definitive form, and you're not allowed to
alter bindings etc at that point. And given all bindings are available
this can be done early on in the hardware projects.

I think a group of volunteers are up to move in this direction.

Needless to say, doing it the slow way threatens to slow down the
deployment phase and lead to Gantt-effects in projects. Which I
guess is why these companies really like the idea of tying in the
device tree with the kernel.

Or to put it another way: I think this is caused by embedded
companies constantly having one finger pressing the fast-forward
button.

Yours,
Linus Walleij
