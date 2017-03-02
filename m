From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH v2 3/3] ARM64: dts: meson-gx: Add MALI nodes for GXBB and
 GXL
Date: Thu, 2 Mar 2017 18:45:31 +0100
Message-ID: <541574a1-ebb6-7a0b-0c40-46fac74621b7@suse.de>
References: <1488365164-22861-1-git-send-email-narmstrong@baylibre.com>
 <1488365164-22861-4-git-send-email-narmstrong@baylibre.com>
 <e26cf584-dab2-2702-f7e6-b28f750fa00c@suse.de>
 <e80d9fb0-1d71-7cab-5e32-72316474fdfc@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <e80d9fb0-1d71-7cab-5e32-72316474fdfc@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: devicetree@vger.kernel.org, khilman@baylibre.com, sboyd@codeaurora.org, linux-kernel@vger.kernel.org, carlo@caione.org, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,

Am 02.03.2017 um 13:47 schrieb Neil Armstrong:
> On 03/02/2017 01:31 PM, Andreas F=E4rber wrote:
>> Am 01.03.2017 um 11:46 schrieb Neil Armstrong:
>>> For GXL, since a lot is shared with the GXM that has a MALI-T820 IP, th=
is
>>> patch adds a new meson-gxl-mali.dtsi and is included in the SoC specific
>>> dtsi files.
>>
>> This part is slightly confusing though.
>>
>> What exactly is the GXL vs. GXM difference that this can't be handled by
>> overriding node properties compatible/interrupts/clocks? I am missing a
>> GXM patch in this series as rationale for doing it this way.
>>
>> In particular I am wondering whether the whole GXM-inherits-from-GXL
>> concept is flawed and should be adjusted if this leads to secondary
>> .dtsi files like this: My proposal would be to instead create a
>> meson-gxl-gxm.dtsi, that meson-gxl.dtsi and meson-gxm.dtsi can inherit
>> the current common parts from, then the Mali bits can simply go into
>> meson-gxl.dtsi without extra #includes needed in S905X and S905D. While
>> it's slightly more work to split once again, I think it would be cleaner.
> =

> The GXL and GXM differences are very small :
>  - They share the same clock tree
>  - They share the same pinctrl and even the same pinout (S905D and S912 a=
re pin-to-pin compatible)
>  - They share all the peripherals
> =

> The only changes are :
>  - Enhanced video encoding and decoding support, this will need a family-=
specific compatible when pushed
>  - Slightly differences in the Video Processing Unit, this is why I intro=
duced family-specific compatibles
>  - A secondary Cortex-A53 cluster
>  - A secondary SCPI cpufreq clock entry
>  - A different Mali core, but with the same interrupts (less but they sha=
re the same lower interrupts), clocks and memory space
> =

> This is why it was decided to have a sub-dtsi, having a secondary dtsi wi=
ll simply copy 99% of the GXL dtsi,
> but surely we could also have an intermediate dtsi but for boards I'm ok =
with it, but less for a SoC dtsi,
> since it could lead to some confusion.
> =

> Finally, yes I could have added the mali node to the GXL dtsi, but the mi=
dgard Mali dt-bindings are not upstream
> and the family is too big and recent enough to consider having stable bin=
dings for now.

OK, my question really was specific to Mali differences. :)

> Nevertheless, nothing is final, this gxl-mali.dtsi could be merged into t=
he GXL dtsi in the future when we
> have proper dt-bindings and a real support of the T820 Mali on the S912.

What about a /delete-node/ &mali; in meson-gxm.dtsi?
That would avoid having any new .dtsi.

Regards,
Andreas

-- =

SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Felix Imend=F6rffer, Jane Smithard, Graham Norton
HRB 21284 (AG N=FCrnberg)
