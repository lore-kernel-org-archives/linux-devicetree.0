From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH v8] reset: Add driver for gpio-controlled reset pins
Date: Thu, 18 Jul 2013 15:50:09 -0700
Message-ID: <CACxGe6usaesdKTb8eVtB3SxdOUzJVbE+4X4J5mfKDmD6oiyQsQ@mail.gmail.com>
References: <1369904940-716-1-git-send-email-p.zabel@pengutronix.de>
 <20130716015038.GD28375@S2101-09.ap.freescale.net>
 <51E4BF98.8030604@wwwdotorg.org>
 <20130716041056.GA30067@S2101-09.ap.freescale.net>
 <51E56AA7.7020103@wwwdotorg.org>
 <20130717030246.GA4541@S2101-09.ap.freescale.net>
 <51E6CCE4.20705@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <51E6CCE4.20705-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
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
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Len Brown <len.brown-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "Rafael J. Wysocki" <rjw-KKrjLPT3xs0@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 17, 2013 at 9:57 AM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> On 07/16/2013 09:02 PM, Shawn Guo wrote:
>> On Tue, Jul 16, 2013 at 09:45:43AM -0600, Stephen Warren wrote:
>>> Registering the driver earlier won't cause any bugs. However, it's not
>>> the correct approach.
>>>
>>> Deferred probe /is/ the approach for assuring correct dependencies
>>> between drivers. It works and should be used. There are not enough
>>> initcall levels to play games using initcalls and solve all the issues,
>>> and the ordering requirements vary board-to-board. Deferred probe at
>>> runtime handles this without having to manually place all the drivers
>>> into specific initcall levels, and dynamically adjusts to board
>>> differences, since it all happens automatically at run-time.
>>
>> I do not quite follow the argument here.  I agree with you that
>> deferred probe is the approach to solve dependencies.  But it does not
>> necessarily mean that initcall can not be used to help it save some
>> nasty or nested deferring.  Deferred probe and initcalls are not two
>> mutually exclusive mechanisms but two which can help each other.
>
> My understanding is that deferred probe was implemented specifically to
> avoid having to, or allowing, the use of initcall levels to determine
> probe order.

Correct. Futzing around with initcalls may optimize particular use
cases, but it isn't complete. I've been pushing for all drivers to use
module_initcall() unless there is a very strong reason to do
otherwise. Premature optimization (without measuring time consumed) is
not a strong justification.

g.
