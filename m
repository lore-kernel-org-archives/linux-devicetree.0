From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: st_fdma: Firmware filename in DT?
Date: Mon, 07 Sep 2015 14:41:17 +0200
Message-ID: <5009480.9u9jyfIQDy@wuerfel>
References: <20150903144944.GC7093@griffinp-ThinkPad-X1-Carbon-2nd> <201509051058.54229.arnd@arndb.de> <CANCZdfrLbbN_nGJ8WLsBHHGuM3SxGgiLgjkZ+YG4zP4BBA68YQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CANCZdfrLbbN_nGJ8WLsBHHGuM3SxGgiLgjkZ+YG4zP4BBA68YQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Warner Losh <imp-uzTCJ5RojNnQT0dZR+AlfA@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Saturday 05 September 2015 15:06:35 Warner Losh wrote:
> On Sat, Sep 5, 2015 at 2:58 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> > On Friday 04 September 2015, Warner Losh wrote:
> 
> I understood what you were proposing. It wasn't a lack of understanding
> that lead me to the opinion that it was a horrible policy. Despite your
> lengthy explanation, you did nothing to address the very simple and common
> use case of having identical hardware that none-the-less needs different
> firmware which was my basis of the horrible brand I put on this policy.

You must be thinking of different examples of firmware files than I
am. We have tons of drivers that need firmware, and the reasons for
picking a particular file over another alternative tend to be slightly
different (most of the time, you just want the latest version).

Can you name a specific example you are thinking of where you want
different firmware to be loaded on systems with identical hardware?

> Also, firmware comes from vendors generally named something other
> than FDT compat strings. Renaming firmware generally is also a
> horrible policy that most shops frown on. It hampers traceability from
> a deployed system back to the sources, for one and introduces one
> more place for an 'oops' rename to go undetected until the firmware
> is deployed.

Most firmware that I can think of does not even come as a file in the
format that Linux wants, often there is some vendor source code
with firmware in a header file, or you dissect a windows binary
driver to pull out the right bits.

The file name gets fixed at the point at which the binary is included
in the linux-firmware git tree.

> So there needs to be a standardized way to augment local policy
> to say 'the firmware you need for this node so that the system behaves
> as expect in the DT is Y.'

Why is that even something that is known by the boot loader? If the boot
loader just knows what hardware you have, but a particular instance
requires some other device firmware, that sounds like the system
administrator would just put the special firmware file in a known
location on the local file system (preferably not the same file name
as the generic one).

	Arnd
