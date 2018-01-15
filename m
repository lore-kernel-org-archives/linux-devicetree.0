From: Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [PATCH 2/7] ARM: dts: STi: Add gpio polarity for "hdmi, hpd-gpio"
 property
Date: Mon, 15 Jan 2018 17:43:29 +0000
Message-ID: <aa7fb6b7-8fde-8206-7459-e7fe14dc2f09@st.com>
References: <1515572469-19276-1-git-send-email-patrice.chotard@st.com>
 <1515572469-19276-3-git-send-email-patrice.chotard@st.com>
 <CAK8P3a3thPTMgcMRT0jqwoOidhxXndWCP0tYpUsPhMTW7DvgCA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAK8P3a3thPTMgcMRT0jqwoOidhxXndWCP0tYpUsPhMTW7DvgCA@mail.gmail.com>
Content-Language: en-US
Content-ID: <3A01F4E35868204991A30ABCA1B882A4@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>, arm-soc <arm@kernel.org>, Russell King - ARM Linux <linux@armlinux.org.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Arnd

On 01/15/2018 03:59 PM, Arnd Bergmann wrote:
> On Wed, Jan 10, 2018 at 9:21 AM,  <patrice.chotard@st.com> wrote:
>> From: Patrice Chotard <patrice.chotard@st.com>
>>
>> The GPIO polarity is missing in the hdmi,hpd-gpio property, this
>> fixes the following DT warnings:
>>
>> arch/arm/boot/dts/stih410-b2120.dtb: Warning (gpios_property): hdmi,hpd-gpio property
>> size (8) too small for cell size 2 in /soc/sti-display-subsystem/sti-hdmi@8d04000
>>
>> arch/arm/boot/dts/stih407-b2120.dtb: Warning (gpios_property): hdmi,hpd-gpio property
>> size (8) too small for cell size 2 in /soc/sti-display-subsystem/sti-hdmi@8d04000
>>
>> arch/arm/boot/dts/stih410-b2260.dtb: Warning (gpios_property): hdmi,hpd-gpio property
>> size (8) too small for cell size 2 in /soc/sti-display-subsystem/sti-hdmi@8d04000
>>
>> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> 
> Olof has picked up a number of other dtc warning fixes into next/dt,
> so I ended up
> adding this to the same place rather than our fixes branch, but added
> a Cc:stable
> tag. We now have just one warning left in arm-soc, and I think Linus
> Walleij will
> send a patch for that soon. >
> Please send a pull request for the remaining commits from the STi
> series, thanks!

Ok thanks

Patrice

> 
>        Arnd
> 
