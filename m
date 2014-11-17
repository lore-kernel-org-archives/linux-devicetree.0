From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH V5 4/4] clocksource: mips-gic: Add device-tree support
Date: Mon, 17 Nov 2014 22:29:02 +0100
Message-ID: <546A689E.3050207@linaro.org>
References: <1415821419-26974-1-git-send-email-abrestic@chromium.org>	<1415821419-26974-5-git-send-email-abrestic@chromium.org>	<546A66EA.3090107@linaro.org> <CAL1qeaHpK0a+ONK3bhVrRk-G7iwRw_HwpjtLwi6E6EJ+rccbww@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL1qeaHpK0a+ONK3bhVrRk-G7iwRw_HwpjtLwi6E6EJ+rccbww@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Bresticker <abrestic@chromium.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, John Crispin <blogic@openwrt.org>, David Daney <ddaney.cavm@gmail.com>, Qais Yousef <qais.yousef@imgtec.com>, James Hogan <james.hogan@imgtec.com>, Arnd Bergmann <arnd@arndb.de>, Linux-MIPS <linux-mips@linux-mips.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 11/17/2014 10:26 PM, Andrew Bresticker wrote:
> On Mon, Nov 17, 2014 at 1:21 PM, Daniel Lezcano
> <daniel.lezcano@linaro.org> wrote:
>> On 11/12/2014 08:43 PM, Andrew Bresticker wrote:
>>>
>>> Parse the GIC timer frequency and interrupt from the device-tree.
>>>
>>> Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
>>> Acked-by: Arnd Bergmann <arnd@arndb.de>
>>
>>
>> Hi Andrew,
>>
>> through which tree is this patch supposed to go ?
>>
>> Is there any dependency ?
>
> There are quite a few dependencies, so this series and all the other
> MIPS GIC stuff is going through the MIPS tree.

Ok thanks.

   -- Daniel


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
