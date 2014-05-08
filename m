From: Alex Elder <elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] devicetree: bindings: separate CPU enable method descriptions
Date: Thu, 08 May 2014 11:47:19 -0500
Message-ID: <536BB517.8050701@linaro.org>
References: <1399505033-3368-1-git-send-email-elder@linaro.org> <CAL_JsqKoe6dz6Ncr4nKs8+6u6pZNtcyuVQpjwKenY2nHv-=Yfw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKoe6dz6Ncr4nKs8+6u6pZNtcyuVQpjwKenY2nHv-=Yfw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rohit Vaswani <rvaswani-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 05/08/2014 10:13 AM, Rob Herring wrote:
> On Wed, May 7, 2014 at 6:23 PM, Alex Elder <elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> The bindings for CPU enable methods are defined in ".../arm/cpus.txt".  As
>> additional 32-bit ARM CPUS are converted to use the "enable-method" CPU
>> property to imply a particular set of SMP operations to use, the list of these
>> methods is likely to become unwieldy.  The current documentation already
>> contains several property descriptions that are meaningful only for certain
>> enable methods.
>>
>> This patch defines a new Documentation subdirectory whose purpose is to give
>> each CPU enable method its own place to define how and when it's used, as
>> well as what other properties (optional or required) are associated with
>> the method.  The existing enable method documentation is expanded and moved
>> from ".../arm/cpus.txt" into new files accordingly.
>>
>> Signed-off-by: Alex Elder <elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 
> Please use get_maintainers.pl and copy those people.

I typically trim the list of people it generates but I
will use the full list next time.

>> ---
>> This series is available here:
>>         http://git.linaro.org/landing-teams/working/broadcom/kernel.git
>>         Branch review/enable-method-bindings
>>
>>  .../bindings/arm/cpu-enable-method/README          | 20 +++++
>>  .../bindings/arm/cpu-enable-method/arm,psci.txt    | 69 ++++++++++++++++
>>  .../arm/cpu-enable-method/qcom,gcc-msm8660         | 30 +++++++
>>  .../arm/cpu-enable-method/qcom,kpss-acc-v1         | 56 +++++++++++++
>>  .../arm/cpu-enable-method/qcom,kpss-acc-v2         | 56 +++++++++++++
>>  .../bindings/arm/cpu-enable-method/spin-table.txt  | 96 ++++++++++++++++++++++
>>  Documentation/devicetree/bindings/arm/cpus.txt     | 29 +------
>>  7 files changed, 330 insertions(+), 26 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/arm/cpu-enable-method/README
>>  create mode 100644 Documentation/devicetree/bindings/arm/cpu-enable-method/arm,psci.txt
>>  create mode 100644 Documentation/devicetree/bindings/arm/cpu-enable-method/qcom,gcc-msm8660
>>  create mode 100644 Documentation/devicetree/bindings/arm/cpu-enable-method/qcom,kpss-acc-v1
>>  create mode 100644 Documentation/devicetree/bindings/arm/cpu-enable-method/qcom,kpss-acc-v2
>>  create mode 100644 Documentation/devicetree/bindings/arm/cpu-enable-method/spin-table.txt
> 
> What about all the existing documentation:
> 
> .../arm/psci.txt

This is sort of a weird one anyway.  For arm it sets the
smp_operations vector in a way that's different from the
others, and I guess it's not strictly an enable method
anyway--at least for 32-bit arm.

The reason I started to include it here is that "psci"
(along with "spin-table") is listed as one of the
available ARM v8 enable methods.  That method does not
have any existing documentation in the "cpus.txt" file,
though it should.

Unfortunately I didn't document the right thing.  The
document ".../arm/psci.txt" you reference defines the
Power State Coordination Interface itself, but not
its use as a CPU enable method.  So documenting the
"psci" enable method is still needed (thought it'll
be brief).

I will send an update, and this time I'll fix the
"arm,psci.txt" one to be "psci.txt" and make it
actually describe the enable method.

> .../arm/msm/qcom,kpss-acc.txt

In this case, the same two strings are used for two purposes.
The first purpose, documented in the file you mention, is
defining a compatible clock controller, where this string is
the matching value for a "compatible" property.

The second purpose, currently documented in ".../arm/cpus.txt"
but here moved into .../arm/cpu-enable-method/qcom*" is to
identify the enable method, as a matching value for an
"enable-method" property.

> I can't tell what you are adding and what you are moving.

Well, I'm deleting the descriptions found in ".../arm/cpus.txt"
and replacing them with:
    Details about use of these CPU enable methods is documented
    elsewhere[1].
    ...
    [1] arm/cpu-enable-method/
In the files I've created under ".../arm/cpu-enable-method" I
started with what's there but added a brief semi-boilerplate
introduction to each, and ensured each had a relevant example
or two.

I will post version 2 shortly.  Thanks for your input.

					-Alex

> Rob
> 
. . .

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
