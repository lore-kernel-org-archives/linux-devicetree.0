From: Srinivas KANDAGATLA <srinivas.kandagatla@st.com>
Subject: Re: [PATCH v5] clocksource:arm_global_timer: Add ARM global timer
 support.
Date: Mon, 24 Jun 2013 22:10:19 +0100
Message-ID: <51C8B5BB.8040007@st.com>
References: <1372089195-29219-1-git-send-email-srinivas.kandagatla@st.com> <alpine.DEB.2.02.1306242200460.4013@ionos.tec.linutronix.de>
Reply-To: srinivas.kandagatla@st.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.02.1306242200460.4013@ionos.tec.linutronix.de>
Sender: linux-doc-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-doc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Stuart Menefy <stuart.menefy@st.com>, John Stultz <john.stultz@linaro.org>, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

On 24/06/13 21:01, Thomas Gleixner wrote:
> On Mon, 24 Jun 2013, Srinivas KANDAGATLA wrote:
> 
>> From: Stuart Menefy <stuart.menefy@st.com>
>>
>> This is a simple driver for the global timer module found in the Cortex
>> A9-MP cores from revision r1p0 onwards. This should be able to perform
>> the functions of the system timer and the local timer in an SMP system.
>>
>> The global timer has the following features:
>>     The global timer is a 64-bit incrementing counter with an
>> auto-incrementing feature. It continues incrementing after sending
>> interrupts. The global timer is memory mapped in the private memory
>> region.
>>     The global timer is accessible to all Cortex-A9 processors in the
>> cluster. Each Cortex-A9 processor has a private 64-bit comparator that
>> is used to assert a private interrupt when the global timer has reached
>> the comparator value. All the Cortex-A9 processors in a design use the
>> banked ID, ID27, for this interrupt. ID27 is sent to the Interrupt
>> Controller as a Private Peripheral Interrupt. The global timer is
>> clocked by PERIPHCLK.
>>
>> Signed-off-by: Stuart Menefy <stuart.menefy@st.com>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@st.com>
>> CC: Arnd Bergmann <arnd@arndb.de>
>> CC: Rob Herring <robherring2@gmail.com>
>> CC: Linus Walleij <linus.walleij@linaro.org>
>> CC: Will Deacon <will.deacon@arm.com>
>> CC: Thomas Gleixner <tglx@linutronix.de>
> 
> Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
Thanks Thomas,
I will fix Stephen's comment in next spin.

Thanks,
srini
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
> 

