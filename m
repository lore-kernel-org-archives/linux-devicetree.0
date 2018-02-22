From: Amelie DELAUNAY <amelie.delaunay@st.com>
Subject: Re: [PATCH 3/6] gpio: Add GPIO support for the ST Multi-Function
 eXpander
Date: Thu, 22 Feb 2018 15:33:31 +0000
Message-ID: <2440a092-507d-bc39-6ed6-4a4ee094da7a@st.com>
References: <1518100057-23234-1-git-send-email-amelie.delaunay@st.com>
 <1518100057-23234-4-git-send-email-amelie.delaunay@st.com>
 <CACRpkdaeFXuB1Qv-vqNpf4pHsAysiYh03_gfNoRdHBh1pN_Amw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdaeFXuB1Qv-vqNpf4pHsAysiYh03_gfNoRdHBh1pN_Amw@mail.gmail.com>
Content-Language: en-US
Content-ID: <E024ED14A7477541AA91EDA73DF3AA9A@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE
 TREE BINDINGS" <devicetree@vger.kernel.org>, Alexandre TORGUE <alexandre.torgue@st.com>, Russell King <linux@armlinux.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lee Jones <lee.jones@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org



On 02/22/2018 02:47 PM, Linus Walleij wrote:
> On Thu, Feb 8, 2018 at 3:27 PM, Amelie Delaunay <amelie.delaunay@st.com> wrote:
> 
>> ST Multi-Function eXpander (MFX) can be used as GPIO expander.
>> It has 16 fast GPIOs and can have 8 extra alternate GPIOs
>> when other MFX features are not enabled.
>>
>> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
> 
> As mentioned I think this driver needs to:
> 
> - Move to drivers/pinctrl/pinctrl-stmfx.c similar to the sx150x controller.
> - Pass a regmap around instead of the custom accessor functions.

I study this right now!
Thanks,
Amelie

> - Maybe refactor and reuse STMPE infrastructure
> 
> Yours,
> Linus Walleij
> 
