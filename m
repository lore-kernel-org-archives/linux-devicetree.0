From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH v2 1/3] leds: leds-pwm: Convert to use devm_get_pwm
Date: Wed, 5 Dec 2012 16:36:36 +0100
Message-ID: <50BF6A04.4040204@ti.com>
References: <1352731270-27534-1-git-send-email-peter.ujfalusi@ti.com> <1352731270-27534-2-git-send-email-peter.ujfalusi@ti.com> <CAK5ve-JDCSSOKHQG-F1RoDii62=-DiPevaD6SafndYVvOgB6Fw@mail.gmail.com> <50BCB391.1070305@ti.com> <CAK5ve-+1eQ3mPLAu2Qxw4LjNA85oEtJE-wZcL=YpQ0xBFJ6+hQ@mail.gmail.com> <50BDB016.7010908@ti.com> <CAK5ve-K69=NqApFTFOZB7Z_KXcRLaWExzbkUhP=GeASMB7JYqw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK5ve-K69=NqApFTFOZB7Z_KXcRLaWExzbkUhP=GeASMB7JYqw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On 12/04/2012 06:34 PM, Bryan Wu wrote:
> What's best thing I can do is I can merge these patchset into my
> -devel branch, after 3.8 merge window close I will move this -devel
> branch to my for-next branch for 3.9 merge window.
>=20
> Does this make sense to you?

Not sure if I can get changes related to leds-pwm through linux-omap in=
 this
way. The practice is that l-o should be 'in a working condition' alone =
-
without linux-next.

But I'll find something else while waiting for 3.10 to clean up the oma=
p board
files related to this.

--=20
P=E9ter
