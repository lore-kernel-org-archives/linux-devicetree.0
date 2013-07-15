From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] [ATTEND] Handling of devicetree bindings
Date: Mon, 15 Jul 2013 23:07:36 +0200
Message-ID: <CACRpkdaEswVPNqwQkMjsNWutCpOQxgMeGwsgemsF4SSZxXMocQ@mail.gmail.com>
References: <20130713192647.GA3798@katana> <20130713204927.GA1124@roeck-us.net>
 <CACRpkdaJ5podVCrb7XuhhGF0Oco+eLrFH0EVGZM0MBbGP9m7WQ@mail.gmail.com>
 <20130714181331.GC26513@roeck-us.net>
 <CACRpkdanQz+Tb-c+-3hRVKhCEBHtxm1toFw7mwyeMmSuVq+sfQ@mail.gmail.com>
 <20130715082915.5142547a@lwn.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130715082915.5142547a-T1hC0tSOHrs@public.gmane.org>
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
To: Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, ksummit-2013-discuss-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 15, 2013 at 4:29 PM, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org> wrote:

> Do we need a kernel summit discussion, or do we just need a good
> document?  Or, to phrase the question another way, are we lacking a
> consensus among the clueful regarding how device tree bindings should be
> designed, or are we simply lacking education?

I think both. I fear some maintainers do not know enough about
the subject to know if a binding should be rejected.

We have for example:
Documentation/devicetree/usage-model.txt

But this does not at all qualify anyone to judge (dredd) the
validity of some new $binding. It's not kerneldoc, where
everything is pretty easy to understand, it is way more
complex.

It looks simple to begin with: registers, IRQs, compatible
strings ... then all of a sudden: how many #foo-cells should
this have?  0, 1 or 4? foo: bar@12345 {} what naming
convention should be used here? What is an alias? Basically
you have to know it all to properly review that.

The recent discussions about clock bindings is a good
example. Or the fact that we do not have common
pin control binings because it was simply too hard
to get people to agree: I got the committe work dumped
in my knee and I did a bad job at it too. :-(

Part of the problem with both major hardware description
languages (ACPI and devicetree) is that the developers using
either variant appear to be clueless of the other. What makes
devicetree more dangerous than ACPI is that the kernel
maintainers define it, it is not being given from the outside.

Yours,
Linus Walleij
