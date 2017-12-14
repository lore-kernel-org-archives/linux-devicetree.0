From: Ludovic BARRE <ludovic.barre@st.com>
Subject: Re: [PATCH 1/1] dt-bindings: arm: document supported STM32 SoC family
Date: Thu, 14 Dec 2017 17:16:48 +0100
Message-ID: <1ad31902-41d5-d8f3-6817-b69927c2467c@st.com>
References: <1512741394-27341-1-git-send-email-ludovic.Barre@st.com>
 <20171212210348.proilmqmxf4yl5jn@rob-hp-laptop>
 <20171212231744.u4wtadrpaq3wp4sq@rob-hp-laptop>
 <16700917-a53a-c319-d27d-f447c6ed3dce@st.com>
 <CAL_JsqJ8+NrOOpg1VcC8ZVVtm3tFTL2qvj8GSkrPU91CWDqzDA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAL_JsqJ8+NrOOpg1VcC8ZVVtm3tFTL2qvj8GSkrPU91CWDqzDA@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Alexandre Torgue <alexandre.torgue@st.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Gwenael Treuveur <gwenael.treuveur@st.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


On 12/14/2017 04:05 PM, Rob Herring wrote:
> On Wed, Dec 13, 2017 at 2:40 AM, Ludovic BARRE <ludovic.barre@st.com> wrote:
>> hi Rob
>>
>> Today there was no bindings documentation for STM32 SoC
>> already upstreamed. This patch adds initial list of STM32
>> existing in kernel.
>> The next serie adds just new soc and one compatible on STM32 list.
> 
> Yes, and that series will go thru arm-soc tree so this patch needs to too.
You are right, to avoid merge conflict.
I will included this patch in my series
on "ARM: stm32: add initial STM32MPU support"

This patch can be abandoned.
> 
>> So, I think you could apply this patch.
> 
> If your series is not going into 4.16, then I can take this one.
> 
> Rob
> 
