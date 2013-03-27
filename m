From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 1/4] iio: adc: Document the regulator/clocks for exynos-adc
Date: Wed, 27 Mar 2013 11:46:43 -0700
Message-ID: <CAD=FV=XVWe+GNzEuYkXL3n85t2zRCHJkz5ry_uVXY62rp61qKQ@mail.gmail.com>
References: <1363129994-10438-1-git-send-email-dianders@chromium.org>
	<1363207202-10858-1-git-send-email-dianders@chromium.org>
	<1363207202-10858-2-git-send-email-dianders@chromium.org>
	<CAHfPSqDLXD-T6__eF=d+U7Me953DqTgMXi=Jmx7LnHL+W-FLhQ@mail.gmail.com>
	<51533D34.7020406@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <51533D34.7020406@metafoo.de>
Sender: linux-doc-owner@vger.kernel.org
To: Lars-Peter Clausen <lars@metafoo.de>, Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Naveen Krishna Chatradhi <ch.naveen@samsung.com>, Olof Johansson <olof@lixom.net>, Guenter Roeck <linux@roeck-us.net>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, Mar 27, 2013 at 11:40 AM, Lars-Peter Clausen <lars@metafoo.de> wrote:
> On 03/27/2013 07:35 PM, Naveen Krishna Ch wrote:
>> On 13 March 2013 13:39, Doug Anderson <dianders@chromium.org> wrote:
>>> The exynos ADC won't work without a regulator called "vdd" and a clock
>>> called "adc".  Document this fact in the device tree bindings.
>>>
>>> Signed-off-by: Doug Anderson <dianders@chromium.org>
>> Reviewed-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
>>
>> Lars, any update on this patch set. This change is required.
>
> Uhm, looks fine to me. I'm sure Jonathan will pick it up :)

Part 2 made it in, but not the documentation patch.  Now that it has a
Reviewed-by it can probably go in...  :)

-Doug
