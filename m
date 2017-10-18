From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 5/5] arm: dts: stm32: remove useless clocksource nodes
Date: Wed, 18 Oct 2017 08:21:23 -0500
Message-ID: <CABGGisx1mrf8xSWAXSm9sevE16HgCT72RhcpH6J44ECQnCd3Jw@mail.gmail.com>
References: <1508331506-23782-1-git-send-email-benjamin.gaignard@linaro.org> <1508331506-23782-6-git-send-email-benjamin.gaignard@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1508331506-23782-6-git-send-email-benjamin.gaignard@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, linux@armlinux.org.uk, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, Daniel Lezcano <daniel.lezcano@linaro.org>, tglx@linutronix.de, ludovic.barre@st.com, julien.thierry@arm.com, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 18, 2017 at 7:58 AM, Benjamin Gaignard
<benjamin.gaignard@linaro.org> wrote:
> 16 bits timers aren't accurate enough to be used as
> clocksource, remove them from stm32f4 and stm32f7 devicetree.

They aren't useful for anything? Zephyr? u-boot?

Rob
