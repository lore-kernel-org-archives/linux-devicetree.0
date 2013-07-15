From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] [ATTEND] Handling of devicetree bindings
Date: Mon, 15 Jul 2013 10:36:22 +0200
Message-ID: <CACRpkdanQz+Tb-c+-3hRVKhCEBHtxm1toFw7mwyeMmSuVq+sfQ@mail.gmail.com>
References: <20130713192647.GA3798@katana> <20130713204927.GA1124@roeck-us.net>
 <CACRpkdaJ5podVCrb7XuhhGF0Oco+eLrFH0EVGZM0MBbGP9m7WQ@mail.gmail.com>
 <20130714181331.GC26513@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130714181331.GC26513-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
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
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, ksummit-2013-discuss-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jul 14, 2013 at 8:13 PM, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org> wrote:
> On Sun, Jul 14, 2013 at 01:46:45AM +0200, Linus Walleij wrote:>> Maybe some just consider this "some documentation", think it has been
>> defined by someone who thought it over and merge it without looking
>> closely.
>>
> For my part I do have a close look, but I don't really know if my understanding
> of acceptable properties matches the understanding of the devicetree community.
> Devicetree is supposed to describe the hardware, but in many cases there is
> an overlap between hardware description and configuration and/or use. Where is
> the boundary ?

Well this is what we need everyone to know so I guess this confirms the
need to bring it up at the kernel summit...

> My approach is to accept properties which would otherwise require platform data.
> Is that acceptable ?

In most cases yes, but there are some paradigms about it, and nothing
linux-specific should be encoded in it, except for a few "linux-*"
bindings.

> How can I know if devicetree-discuss is mostly silent on
> such matters, as you point out ?

Right now it feels like everyone developing these drivers think it is very
convenient that the Linux subsystem maintainers do all the reviewing
and deciding, so they can then later take the blame for it if they merged
something bad.

I feel just as ambivalent about it as you do :-/

Yours,
Linus Walleij
