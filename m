From: Amelie DELAUNAY <amelie.delaunay@st.com>
Subject: Re: [PATCH 0/6] Introduce STMicroelectronics MultiFunction eXpander
Date: Thu, 22 Feb 2018 15:13:30 +0000
Message-ID: <276d5f97-55c2-406e-92c7-0d03c7f7a49d@st.com>
References: <1518100057-23234-1-git-send-email-amelie.delaunay@st.com>
 <CACRpkdZYnQC5BusLyK5aAcA2q0NmvHu=TaLhFCfu2M0bgBcjrQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdZYnQC5BusLyK5aAcA2q0NmvHu=TaLhFCfu2M0bgBcjrQ@mail.gmail.com>
Content-Language: en-US
Content-ID: <CC33488A7E6801469D12F0B3DDDD9228@st.com>
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

Hi Linus,

Thanks for your review on the whole series.

On 02/22/2018 02:06 PM, Linus Walleij wrote:
> Hi Amelie,
> 
> thanks a lot for your patches!
> 
> On Thu, Feb 8, 2018 at 3:27 PM, Amelie Delaunay <amelie.delaunay@st.com> wrote:
> 
>> This series adds support for STMicroelectronics MultiFunction eXpander
>> (ST MFX), used on some STM32 discovery and evaluation boards.
> 
> So I take it that the department creating the STMPE
> "ST MPE" or "ST Microelectronics MultiPurpose Expander"
> Now created a new set of circuits?
> 

ST MFX is based on a STM32L152 with a firmware offering features similar 
to the STMPE (GPIO and TS controller) but also IDD measurement to 
measure the power consumption of the MCU to which MFX is connected to.

> Can we first establish whether this new family is really so
> different from STMPE that it really needs a new driver in
> MFD and GPIO (and I guess pin control as well)?
> 

ST MFX is different from STMPE as far as the HW is completely different.
IDD is a new feature.
TS management is completely different.
GPIO management looks like but is also rather different.
ST MFX counts a first level of 8 interrupts (acked by writing in the ACK 
register), then a second level of 24 interrupts for GPIOs. GPIO IRQ can 
be triggered on low level, falling edge, high level, rising edge. GPIO 
IRQ have to be acked by writing in the GPI_ACK register, GPIO can be 
output open-drain with/without internal pull-up, output push-pull, input 
with pull-up/down, input floating or analog.

> I would be annoyed to see later that it is just a few bytes
> separating it from the STMPE, in that case I think it is
> better to just reuse/improve the good old stmpe driver
> and take it from there.
> 

Sure, but if it was a new STMPE variant, it would be called STMPE24xx or 
something like that (24 GPIOs maximum, 20 if IDD or TS is enabled, 16 if 
IDD and TS are enabled).

Regards,
Amelie

> Yours,
> Linus Walleij
> 
