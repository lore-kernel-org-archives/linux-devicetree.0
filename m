From: Grant Likely <grant.likely@linaro.org>
Subject: Re: [GIT PULL] bug fix for devicetree memory parsing
Date: Mon, 7 Jul 2014 01:52:33 +0100
Message-ID: <CACxGe6sZgjVeCLW8VXAtrYg+mbZYOsUvTySJzuBp9OijiTmNyQ@mail.gmail.com>
References: <CACxGe6vFHADzsE7_69B+jjT3kwX_3kOdUBzjtSVEYETwR7HY3Q@mail.gmail.com>
 <CA+55aFwd7sKSKu0+pfSOUGUQrbVuCO_ZBAXds=uGYx5=yfV=VA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+55aFwd7sKSKu0+pfSOUGUQrbVuCO_ZBAXds=uGYx5=yfV=VA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Rob Herring <rob.herring@linaro.org>, Laura Abbott <lauraa@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jul 6, 2014 at 8:24 PM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Sun, Jul 6, 2014 at 2:37 AM, Grant Likely <grant.likely@linaro.org> wrote:
>>
>> Can you pull this bug fix into your tree please?
>
> I took it, but I think both your explanation and the patch itself is
> actually crap. It may fix the issue, but it's seriously confused.
>
> Your explanation says that it's a 32-bit platform issue. No it's not.
> Most 32-bit configurations still have a 64-bit phys_addr_t (ie
> PAE/LPAE etc).
>
> And the code is crap, because it uses ULONG_MAX etc in ways that
> simply make no f*cking sense. And why does it care about sizeof?
>
> Why does the code not just do something like
>
>   #define MAX_PHYS_ADDR ((phys_addr_t) ~0)
>
> and then do
>
>   if (base > MAX_PHYS_ADDR || base + size > MAX_PHYS_ADDR)
>     ...

Sure. I'll make sure a cleanup patch gets written and queued up.

g.
