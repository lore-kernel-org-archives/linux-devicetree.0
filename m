From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH V6 2/5] of: move of_parse_phandle()
Date: Fri, 30 Aug 2013 14:09:55 -0600
Message-ID: <5220FC13.4070708@wwwdotorg.org>
References: <1376515632-12594-1-git-send-email-swarren@wwwdotorg.org> <1376515632-12594-2-git-send-email-swarren@wwwdotorg.org> <CACRpkdYK75uSXLmzkQ9uNQfSBW86bSz3D0nYSr_XSXfixKSDGg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYK75uSXLmzkQ9uNQfSBW86bSz3D0nYSr_XSXfixKSDGg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ian.campbell@citrix.com>, Kumar Gala <galak@kernel.crashing.org>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

On 08/28/2013 01:30 PM, Linus Walleij wrote:
> On Wed, Aug 14, 2013 at 11:27 PM, Stephen Warren <swarren@wwwdotorg.org> wrote:
> 
>> From: Stephen Warren <swarren@nvidia.com>
>>
>> Move of_parse_phandle() after __of_parse_phandle_with_args(), since a
>> future patch will call __of_parse_phandle_with_args() from
>> of_parse_phandle(). Moving the function avoids adding a prototype. Doing
>> the move separately highlights the code changes separately.
>>
>> Signed-off-by: Stephen Warren <swarren@nvidia.com>
>> Acked-by: Mark Rutland <mark.rutland@arm.com>
>> ---
>> v5: New patch.
> 
> Still no feedback from Rob || Grant on this quite important cleanup?
> 
> I would like to nominate Stephen Warren as co-maintainer of
> drivers/of/*, he definately knows his way around the code.
> I'm just worried that he may not accept due to a lot of work in the
> bindings already.

I would prefer not to be flooded with any more email. That said,
/swapping/ my DT binding reviewer position with a drivers/of reviewer
position would reduce the email load.
