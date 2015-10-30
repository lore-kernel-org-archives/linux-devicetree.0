From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH] Revert "h8300: clocksource"
Date: Fri, 30 Oct 2015 12:48:52 +0100
Message-ID: <56335924.408@linaro.org>
References: <1446200775-23898-1-git-send-email-daniel.lezcano@linaro.org>
 <7633294.svub55eV7t@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7633294.svub55eV7t@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: tglx@linutronix.de, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>
List-Id: devicetree@vger.kernel.org

On 10/30/2015 12:19 PM, Arnd Bergmann wrote:
> On Friday 30 October 2015 11:26:08 Daniel Lezcano wrote:
>> This reverts commit 618b902d8c098f2fff188119da7b3184c4bc5483.

[ ... ]

> I found that Yoshinori Sato has always addressed all review comments =
very
> quickly by rewriting the code in a proper manner when mistakes were
> pointed out in the other drivers. Maybe you can describe now what the
> problems are with the three drivers to give him a chance to fix them?

I agree it is a good argument to give him the opportunity to fix the co=
de.

Yoshinori Sato, can you please do a cleanup in the init functions to=20
comply with the other drivers, use CLOCKSOURCE_OF_DECLARE and remove th=
e=20
module exit code ?

Thanks.

   -- Daniel

--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
