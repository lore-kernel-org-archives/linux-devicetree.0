From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 3/3] MAINTAINERS: Refactor device tree maintainership
Date: Mon, 22 Jul 2013 10:29:08 -0700
Message-ID: <CAOesGMjdH6x9U0+6f6TC8Q=sCbO38aNedqTpHBe5cpLG79r3eA@mail.gmail.com>
References: <1374290388-19308-1-git-send-email-grant.likely@linaro.org>
	<1374290388-19308-3-git-send-email-grant.likely@linaro.org>
	<CAOesGMhaAy93J=Q1STZUHHA-SbH+WXCVuUn0ef14_18du2dk6w@mail.gmail.com>
	<1374366577.1940.10.camel@joe-AO722>
	<CACxGe6tqisx19LP=5gPyF1iuBKedTLp0yK+WgmqG5Cf+a95Taw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACxGe6tqisx19LP=5gPyF1iuBKedTLp0yK+WgmqG5Cf+a95Taw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>
Cc: Joe Perches <joe@perches.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, Rob Herring <rob.herring@calxeda.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, Jul 21, 2013 at 2:46 AM, Grant Likely <grant.likely@linaro.org> wrote:
> On Sun, Jul 21, 2013 at 1:29 AM, Joe Perches <joe@perches.com> wrote:
>> On Sat, 2013-07-20 at 17:17 -0700, Olof Johansson wrote:
>>> On Fri, Jul 19, 2013 at 8:19 PM, Grant Likely <grant.likely@linaro.org> wrote:
>>> > Device tree bindings require a lot more attention than they used to.
>>> > We've got a group of volunteers willing to take over maintaining
>>> > bindings. This patch adds them to the MAINTAINERS file.
>> []
>>> > diff --git a/MAINTAINERS b/MAINTAINERS
>> []
>>> > +OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
>> []
>>> > +F:     arch/*/
>> []
>>> This seems a bit broad.
>>
>> Yep, that's every file anywhere under arch.
>
> yeah, that was a c/p mistake. I'll drop that line before committing.

Ok, with that:

Acked-by: Olof Johansson <olof@lixom.net>


-Olof
