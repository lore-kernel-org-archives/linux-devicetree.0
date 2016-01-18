From: Jonas Gorski <jogo@openwrt.org>
Subject: Re: [PATCH 1/2] bmips: add BCM6358 support
Date: Mon, 18 Jan 2016 14:35:48 +0100
Message-ID: <CAOiHx=kD2Rj4wKpXkHeMYP8efuBA1PjirqxpX4RNkrTyNARV4A@mail.gmail.com>
References: <1453030101-14794-1-git-send-email-noltari@gmail.com>
 <0BC6030C-7485-4193-B86D-E690BF673952@gmail.com> <BF36180D-DB32-42A5-AFF7-2B282F5A81DC@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <BF36180D-DB32-42A5-AFF7-2B282F5A81DC@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, MIPS Mailing List <linux-mips@linux-mips.org>, Ralf Baechle <ralf@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kevin Cernekee <cernekee@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi,

On 18 January 2016 at 10:42, =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@=
gmail.com> wrote:
> I can refine it to support a custom offset for each cpu instead of a =
generic one, but defining a custom offset for new SoCs such as BCM6368 =
or BCM6328 would actually break them, since that way the address wouldn=
't be remapped to 0xb0000000.
> See: https://github.com/torvalds/linux/blob/master/arch/mips/include/=
asm/io.h#L213
> In those CPUs the remapping is done automatically (from 0x10000000 to=
 0xb0000000), since the registers are located in the low 512MB of addre=
ss space (0x1fffffffULL).
>
> However, the older CPUs such as BCM6358 (or BCM3368) need that custom=
 ioremap, since those registers aren't located in the low 512MB of addr=
ess space.
> If you want, I can do something like this: https://gist.github.com/No=
ltari/bc5fe029c52cf053a454
> And after that we could add other CPUs such as the BCM3368, which nee=
ds a different offset: "{ "brcm,bcm3368", 0xfff80000 }"
>
> What do you think? Should we keep a generic offset (0xfff00000) or sh=
ould we add SoC specific compatible strings with each custom offset?

How about using the arm approach [1] and adding support for
registering static mappings? That way we avoid adding a custom
plat_ioremap() and keep the amount of bmips code to a minimum.


Jonas

[1]:
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/=
?id=3Ded8fd2186a4e4f3b98434093b56f9b793d48443e
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/=
?id=3D101eeda38c0ab8a4f916176e325d9e036d981a24
