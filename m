From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [Question] orphan platform data header
Date: Sun, 21 Jul 2019 12:44:53 +0900
Message-ID: <CAK7LNATPbCjwzVnAigsQ8tQRXjC31uxgPg3jgi7pwp+N1RPgWw@mail.gmail.com>
References: <CAK7LNASyzmYjjBkFxRc06rqf36-en-bvJvrKcg6iiRfjoPCxhQ@mail.gmail.com>
 <CAK8P3a2AeUpmNfFLJSvHT=AJ0kFRT2B=TWDm0HsTwoHt2jQ0gQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAK8P3a2AeUpmNfFLJSvHT=AJ0kFRT2B=TWDm0HsTwoHt2jQ0gQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, DTML <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Arnd,

On Sat, Jul 20, 2019 at 10:55 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Sat, Jul 20, 2019 at 5:26 AM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> >
> > masahiro@grover:~/ref/linux$ git grep netxbig_led_platform_data
> > drivers/leds/leds-netxbig.c:                          struct
> > netxbig_led_platform_data *pdata,
> > drivers/leds/leds-netxbig.c:                                 struct
> > netxbig_led_platform_data *pdata)
> > drivers/leds/leds-netxbig.c:                      struct
> > netxbig_led_platform_data *pdata)
> > drivers/leds/leds-netxbig.c:    struct netxbig_led_platform_data
> > *pdata = dev_get_platdata(&pdev->dev);
> > include/linux/platform_data/leds-kirkwood-netxbig.h:struct
> > netxbig_led_platform_data {
> >
> >
> >
> > So, what shall we do?
> >
> > Drop the board-file support? Or, keep it
> > in case somebody is still using their board-files
> > in downstream?
>
> Generally speaking, I'd remove the board file support in another
> case like this, but it's worth looking at when it was last used and by
> what.
>
> For this file, all boards got converted to DT, and the old setup
> code removed in commit ebc278f15759 ("ARM: mvebu: remove static
> LED setup for netxbig boards"), four years ago, so it's a fairly
> easy decision to make it DT only.


Thanks.

I see another case, which is difficult
to make a decision.

For example, drivers/spi/spi-tle62x0.c

This driver supports only board-file, but the board-file
is not found in upstream.

Unless I am terribly missing something,
there is no one who passes tle62x0_pdata
to this driver.

$ git grep tle62x0_pdata
drivers/spi/spi-tle62x0.c:      struct tle62x0_pdata *pdata;
include/linux/spi/tle62x0.h:struct tle62x0_pdata {

But, removing board-file support
makes this driver completely useless...


--
Best Regards
Masahiro Yamada
