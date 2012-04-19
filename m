From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/4] clk: select CLKDEV_LOOKUP for COMMON_CLK
Date: Thu, 19 Apr 2012 09:59:36 -0500
Message-ID: <4F902858.9040905@gmail.com>
References: <1334003101-17274-1-git-send-email-robherring2@gmail.com>
 <1334003101-17274-2-git-send-email-robherring2@gmail.com>
 <CAJOA=zMPqiH2fQJ5JWJ=COnju7Cmur6J2ATYUTcx41C4WMjFQQ@mail.gmail.com>
 <20120418070721.GL3852@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120418070721.GL3852-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "Turquette, Mike" <mturquette-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 04/18/2012 02:07 AM, Sascha Hauer wrote:
> On Tue, Apr 17, 2012 at 03:13:49PM -0700, Turquette, Mike wrote:
>> On Mon, Apr 9, 2012 at 1:24 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>>>
>>> Using the common clock infrastructure without the common clkdev code makes
>>> little sense, so select CLKDEV_LOOKUP for COMMON_CLK.
>>>
>>> Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>>> ---
>>>  drivers/clk/Kconfig |    1 +
>>>  1 files changed, 1 insertions(+), 0 deletions(-)
>>>
>>> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
>>> index 165e1fe..f05a60d 100644
>>> --- a/drivers/clk/Kconfig
>>> +++ b/drivers/clk/Kconfig
>>> @@ -12,6 +12,7 @@ config HAVE_MACH_CLKDEV
>>>  config COMMON_CLK
>>>        bool
>>>        select HAVE_CLK_PREPARE
>>> +       select CLKDEV_LOOKUP
>>>        ---help---
>>>          The common clock framework is a single definition of struct
>>>          clk, useful across many platforms, as well as an
>>
>> Hi Rob,
>>
>> I agree that the common clk framework is not particularly useful
>> without clkdev.  However the core code has no dependency on clkdev.
>> Why not just select it from an arch Kconfig, or even make it a
>> dependency based on your own platform clock data/code?
> 
> Selecting it from COMMON_CLK means that the compiler/linker will point
> everybody trying to implement it without CLKDEV into the right
> direction.

Right. That was part of my rationale as well.

The DT clock support is dependent on both options, so without this patch
we'll have to add an otherwise unneeded OF_CLOCK option to select both.

Rob
