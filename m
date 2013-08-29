From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V6 5/5] gpio: implement gpio-ranges binding document fix
Date: Thu, 29 Aug 2013 09:09:45 +0200
Message-ID: <CACRpkdZMSLj-Pq_TQuXVn1yRAGXV19C-zsOFmjg3Rc0b=oS0vQ@mail.gmail.com>
References: <1376515632-12594-1-git-send-email-swarren@wwwdotorg.org>
	<1376515632-12594-5-git-send-email-swarren@wwwdotorg.org>
	<20130828204743.4AF6E3E0B6B@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20130828204743.4AF6E3E0B6B@localhost>
Sender: linux-gpio-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Rob Herring <rob.herring@calxeda.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ian.campbell@citrix.com>, Kumar Gala <galak@kernel.crashing.org>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 28, 2013 at 10:47 PM, Grant Likely <grant.likely@linaro.org> wrote:
> On Wed, 14 Aug 2013 15:27:12 -0600, Stephen Warren <swarren@wwwdotorg.org> wrote:
>> From: Stephen Warren <swarren@nvidia.com>
>>
>> Use the new of_parse_phandle_with_fixed_args() to implement the
>> corrected gpio-ranges DT property definition.
>>
>> Signed-off-by: Stephen Warren <swarren@nvidia.com>
>> Acked-by: Mark Rutland <mark.rutland@arm.com>
>
> I'll take this with the rest of the series.

Go ahead, acked-by...

Yours,
Linus Walleij
