From: Maxime Coquelin <maxime.coquelin@st.com>
Subject: Re: [PATCH 1/9] ARM: STi: DT: STiH416: 416 DT Entry for clockgen
 A0/1/10/11/12
Date: Wed, 14 May 2014 13:50:02 +0200
Message-ID: <5373586A.5000302@st.com>
References: <1399305223-18703-1-git-send-email-gabriel.fernandez@linaro.org> <1399305223-18703-2-git-send-email-gabriel.fernandez@linaro.org> <20140506071843.GD5206@lee--X1> <CAG374jD+msPPbPtFS+ji=8jS9+D-YHu31k7zzzC7Ty7jw9n7jQ@mail.gmail.com> <20140508080344.GE5307@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140508080344.GE5307@lee--X1>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Gabriel Fernandez <gabriel.fernandez@linaro.org>
Cc: Gabriel FERNANDEZ <gabriel.fernandez@st.com>, Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Patrice Chotard <patrice.chotard@st.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, kernel@stlinux.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Pankaj Dev <pankaj.dev@st.com>
List-Id: devicetree@vger.kernel.org

Hi Lee,

On 05/08/2014 10:03 AM, Lee Jones wrote:
>>>> Patch adds DT entries for clockgen A0/1/10/11/12
>>>>
>>>> Signed-off-by: Pankaj Dev <pankaj.dev@st.com>
>>>> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@linaro.org>
>>>> ---
>>>>   arch/arm/boot/dts/stih416-clks.h     |  15 ++
>>>
>>> This should live in include/dt-bindings/clk
>>>
>> include/dt-bindings/clk or  include/dt-bindings/clock ?
>
> I have no idea what the difference between the two are.  I guess you
> are in a better position to answer that.  My point was just that the
> includes should be in the include directory, rather than being held
> locally in the 'dts' directory.

Even if these .h files are only used by the DTS files??

There are some .h files for pincfg related stuff, shouldn't we do the 
same in this case?

Regards,
Maxime

>
>>>>   arch/arm/boot/dts/stih416-clock.dtsi | 477 ++++++++++++++++++++++++++++++++++
>>>>   arch/arm/boot/dts/stih416.dtsi       |  10 +-
>>>>   3 files changed, 497 insertions(+), 5 deletions(-)
>>>>   create mode 100644 arch/arm/boot/dts/stih416-clks.h
>
