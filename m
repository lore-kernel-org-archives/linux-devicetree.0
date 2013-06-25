From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/4] pinctrl: remove slew-rate parameter from tz1090
Date: Tue, 25 Jun 2013 15:32:47 +0200
Message-ID: <CACRpkdbdwvmBYFX=ppdM_RmGwyTcWVeTCMj60F4sh6YEVRE2Uw@mail.gmail.com>
References: <201306251455.01540.heiko@sntech.de>
	<201306251456.36499.heiko@sntech.de>
	<51C99581.2010403@imgtec.com>
	<201306251521.55634.heiko@sntech.de>
	<51C99AB5.1080002@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <51C99AB5.1080002@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: James Hogan <james.hogan@imgtec.com>
Cc: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Stephen Warren <swarren@wwwdotorg.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 25, 2013 at 3:27 PM, James Hogan <james.hogan@imgtec.com> w=
rote:
> On 25/06/13 14:21, Heiko St=FCbner wrote:

>> My thoughts were that this code would never be reached when the pars=
ing was
>> removed and to not cause confusion to the driver when an acceptable =
binding
>> was found for slew-rate.
>>
>> But it of course also doesn't hurt to stay in.
>
> Okay, fair enough.
>
> Acked-by: James Hogan <james.hogan@imgtec.com>

OK applied this so we have a clean slate.

Patches adding it back in with SI measures will be welcomed!

Yours,
Linus Walleij
