From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/7] ARM: dts: STi: Add gpio polarity for "hdmi,hpd-gpio" property
Date: Mon, 15 Jan 2018 15:59:12 +0100
Message-ID: <CAK8P3a3thPTMgcMRT0jqwoOidhxXndWCP0tYpUsPhMTW7DvgCA@mail.gmail.com>
References: <1515572469-19276-1-git-send-email-patrice.chotard@st.com> <1515572469-19276-3-git-send-email-patrice.chotard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1515572469-19276-3-git-send-email-patrice.chotard@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Patrice Chotard <patrice.chotard@st.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, arm-soc <arm@kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 10, 2018 at 9:21 AM,  <patrice.chotard@st.com> wrote:
> From: Patrice Chotard <patrice.chotard@st.com>
>
> The GPIO polarity is missing in the hdmi,hpd-gpio property, this
> fixes the following DT warnings:
>
> arch/arm/boot/dts/stih410-b2120.dtb: Warning (gpios_property): hdmi,hpd-gpio property
> size (8) too small for cell size 2 in /soc/sti-display-subsystem/sti-hdmi@8d04000
>
> arch/arm/boot/dts/stih407-b2120.dtb: Warning (gpios_property): hdmi,hpd-gpio property
> size (8) too small for cell size 2 in /soc/sti-display-subsystem/sti-hdmi@8d04000
>
> arch/arm/boot/dts/stih410-b2260.dtb: Warning (gpios_property): hdmi,hpd-gpio property
> size (8) too small for cell size 2 in /soc/sti-display-subsystem/sti-hdmi@8d04000
>
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>

Olof has picked up a number of other dtc warning fixes into next/dt,
so I ended up
adding this to the same place rather than our fixes branch, but added
a Cc:stable
tag. We now have just one warning left in arm-soc, and I think Linus
Walleij will
send a patch for that soon.

Please send a pull request for the remaining commits from the STi
series, thanks!

      Arnd
