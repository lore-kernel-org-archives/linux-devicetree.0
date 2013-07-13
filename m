From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] [ATTEND] Handling of devicetree bindings
Date: Sun, 14 Jul 2013 01:46:45 +0200
Message-ID: <CACRpkdaJ5podVCrb7XuhhGF0Oco+eLrFH0EVGZM0MBbGP9m7WQ@mail.gmail.com>
References: <20130713192647.GA3798@katana> <20130713204927.GA1124@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130713204927.GA1124-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
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

On Sat, Jul 13, 2013 at 10:49 PM, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org> wrote:
> On Sat, Jul 13, 2013 at 08:26:47PM +0100, Wolfram Sang wrote:

>> I think the KS would be a good opportunity to present the status quo,
>> show some rules of thumb and finally discuss if we can improve the
>> process even further. E.g., should first the bindings be accepted, then
>> the driver? What could be the process if the need for a generic binding
>> arises? And spreading the word, so at least the basic issues are
>> understood by most maintainers.
>>
> Sounds like a good idea, but I think you'll need some deadline. When reviewing
> hwmon drivers I usually wait for a couple of weeks if there is any feedback
> from devicetree-discuss before I accept bindings, but what should I do
> if there is no feedback ? Holding the driver hostage doesn't seem like a good
> idea either.

Nobody rarely say anything on devicetree-discuss. And if something is
said it will usually be about syntax rather than semantics. And if it's
semantics, it's usually a subsystem or arch maintainer saying it.

I've been ranting a bit about this recently, and one of the problems with
device tree now being driven by the Linux community (basically - it used
to be a IEEE thing at one point in the past) is that as the bindings are
merged by the subsystem maintainers, they alone get to decide when
they are finished.

They are all in Documentation/devicetree/bindings/* so theoretically
we could have a dedicated maintainer for it, but that requires someone
to step up :-/

I wonder if some subsystem maintainers who are more used to things
like ACPI or PCI where someone else has already done the thinking
and written a large (non-perfect, mind you) specification even think that
reviewing hardware descriptions is their problem at all?

Maybe some just consider this "some documentation", think it has been
defined by someone who thought it over and merge it without looking
closely.

There have been discussions on improving the situation recently,
so maybe someone has a few words to add?

Yours,
Linus Walleij
