From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH RFC 2/3] ARM: regulator: add Freescale MXS regulator driver
Date: Wed, 10 Sep 2014 15:54:45 -0300
Message-ID: <CAOMZO5BEN_DQOyhrx5ZB7y6DoDvqbLvDyJfAabOvtUvKOiGHOA@mail.gmail.com>
References: <1410089869-6611-1-git-send-email-info@lategoodbye.de>
	<1410089869-6611-3-git-send-email-info@lategoodbye.de>
	<20140909182211.GG3896@leverpostej>
	<540F523D.4010904@lategoodbye.de>
	<20140910141853.GA4994@leverpostej>
	<20140910151316.GG7960@sirena.org.uk>
	<54108B34.6010701@lategoodbye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54108B34.6010701@lategoodbye.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Wahren <info@lategoodbye.de>
Cc: Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, "stefan.wahren@i2se.com" <stefan.wahren@i2se.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Stefan,

On Wed, Sep 10, 2014 at 2:32 PM, Stefan Wahren <info@lategoodbye.de> wrote:
> Hi Mark,
>
> Am 10.09.2014 17:13, schrieb Mark Brown:
>>
>> On Wed, Sep 10, 2014 at 03:18:53PM +0100, Mark Rutland wrote:
>>>
>>> On Tue, Sep 09, 2014 at 08:17:17PM +0100, Stefan Wahren wrote:
>>
>>
>> Ugh, this looks like it might be a regulator driver but since the
>> subject line was "ARM: " I deleted it unread - if your changelog looks
>> different to all the other changelogs in the subsystem it probably needs
>> changing.
>
>
> sorry about the confusion, i will remove ARM in the next version.
>
> Changelog? I didn't send a changelog because it was my first version.
>
> Should i resend this version only to you?

In the cover letter of this RFC series you mentioned that this has not
been tested on real hardware.

What about sending a new version of this series (with the RFC prefix
removed and with Mark Rutland's suggestion implemented) tested on a
mx28 board and also with the Subject of the regulator patch changed to
'regulator: add support for mxs regulator" with Mark Brown on Cc?
