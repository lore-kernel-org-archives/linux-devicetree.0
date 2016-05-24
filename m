From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Subject: Re: [PATCH 00/11] Clock improvement for video playback
Date: Tue, 24 May 2016 09:40:26 +0200
Message-ID: <5744056A.7020606@st.com>
References: <1463560892-7209-1-git-send-email-gabriel.fernandez@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1463560892-7209-1-git-send-email-gabriel.fernandez@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Gabriel Fernandez <gabriel.fernandez@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Maxime Coquelin <maxime.coquelin@st.com>, Patrice Chotard <patrice.chotard@st.com>, Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Olivier Bideau <olivier.bideau@st.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>, Pankaj Dev <pankaj.dev@st.com>, Dinh Nguyen <dinguyen@opensource.altera.com>, Arnd Bergmann <arnd@arndb.de>, Thierry Reding <treding@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@stlinux.com, linux-clk@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, Peter Griffin <peter.griffin@linaro.org>, benjamin.gaignard@st.com, vincent.abriou@st.com
List-Id: devicetree@vger.kernel.org

Hello Gabriel,

Tested with success on stih407 family platforms

Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Tested-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>

Regards
Arnaud

On 05/18/2016 10:41 AM, Gabriel Fernandez wrote:
> This serie allows to increase video resolutions and make audio
> adjustment during a video playback.
> 
> Gabriel Fernandez (11):
>   drivers: clk: st: Add fs660c32 synthesizer algorithm
>   drivers: clk: st: Add clock propagation for audio clocks
>   drivers: clk: st: Handle clkgenD2 clk synchronous mode
>   ARM: DT: STiH407: Add compatibility string on clkgend0 for audio
>     clocks
>   ARM: DT: STiH410: Add compatibility string on clkgend0 for audio
>     clocks
>   ARM: DT: STiH418: Add compatibility string on clkgend0 for audio
>     clocks
>   ARM: DT: STiH407: Enable synchronous clock mode on clkgend2
>   ARM: DT: STiH410: Enable synchronous clock mode on clkgend2
>   ARM: DT: STiH418: Enable synchronous clock mode on clkgend2
>   ARM: DT: STi: STiH407: clock configuration to address 720p and 1080p
>   ARM: DT: STi: STiH410: clock configuration to address 720p and 1080p
> 
>  .../devicetree/bindings/clock/st/st,flexgen.txt    |   3 +
>  arch/arm/boot/dts/stih407-clock.dtsi               |   4 +-
>  arch/arm/boot/dts/stih407.dtsi                     |  16 ++-
>  arch/arm/boot/dts/stih410-clock.dtsi               |   4 +-
>  arch/arm/boot/dts/stih410.dtsi                     |  16 ++-
>  arch/arm/boot/dts/stih418-clock.dtsi               |   4 +-
>  drivers/clk/st/clk-flexgen.c                       |  61 +++++++-
>  drivers/clk/st/clkgen-fsyn.c                       | 159 +++++++++++++++------
>  8 files changed, 211 insertions(+), 56 deletions(-)
> 
