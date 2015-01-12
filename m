From: arno@natisbad.org (Arnaud Ebalard)
Subject: Re: [PATCHv0 1/3] of: add vendor prefix for Abracon Corporation
Date: Mon, 12 Jan 2015 18:11:22 +0100
Message-ID: <87mw5nncud.fsf@natisbad.org>
References: <cover.1421045942.git.arno@natisbad.org>
	<754e04216222807206344fdd9f8575e6b504ed14.1421045942.git.arno@natisbad.org>
	<CAL_JsqL=yP1XmhNiV6Rq_t=ktE1FDBmRKYNNJ0Tn3iAkM3ecag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqL=yP1XmhNiV6Rq_t=ktE1FDBmRKYNNJ0Tn3iAkM3ecag@mail.gmail.com>
	(Rob Herring's message of "Mon, 12 Jan 2015 07:41:25 -0600")
Sender: linux-doc-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Mark Rutland <mark.rutland@arm.com>, Alessandro Zummo <a.zummo@towertech.it>, Peter Huewe <peter.huewe@infineon.com>, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <treding@nvidia.com>, Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Rob Landley <rob@landley.net>, rtc-linux@googlegroups.com, Jason Cooper <jason@lakedaemon.net>, Guenter Roeck <linux@roeck-us.net>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,

Rob Herring <robherring2@gmail.com> writes:

> On Mon, Jan 12, 2015 at 2:16 AM, Arnaud Ebalard <arno@natisbad.org> wrote:
>> Signed-off-by: Arnaud Ebalard <arno@natisbad.org>
>> ---
>>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
>> index b1df0ad1306c..44defc3c162a 100644
>> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
>> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
>> @@ -4,6 +4,7 @@ This isn't an exhaustive list, but you should add new prefixes to it before
>>  using them to avoid name-space collisions.
>>
>>  abilis Abilis Systems
>> +abcn   Abracon Corporation
>
> Is there some reason not to use "abracon"?

None, I guess. I'll change that in a v1.

Cheers,

a+
