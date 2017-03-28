From: Felipe Balbi <felipe.balbi@linux.intel.com>
Subject: Re: [PATCH v5 1/5] usb: dwc2: Add support for STM32F429/439/469 USB
 OTG HS/FS in FS mode (internal PHY)
Date: Tue, 28 Mar 2017 16:36:49 +0300
Message-ID: <8760ith6a6.fsf@linux.intel.com>
References: <20170201012547.76158-1-bruherrera@gmail.com>
 <20170201012547.76158-2-bruherrera@gmail.com>
 <2B3535C5ECE8B5419E3ECBE300772909021B411720@US01WEMBX2.internal.synopsys.com>
 <58187797-2c11-c75b-571c-27fe64578099@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <58187797-2c11-c75b-571c-27fe64578099@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alexandre Torgue <alexandre.torgue@st.com>, John Youn <John.Youn@synopsys.com>, Bruno Herrera <bruherrera@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


Hi,

Alexandre Torgue <alexandre.torgue@st.com> writes:
> Hi John,
>
> On 02/01/2017 04:37 AM, John Youn wrote:
>> On 1/31/2017 5:26 PM, Bruno Herrera wrote:
>>> This patch introduces a new parameter to activate USB OTG HS/FS core
>>> embedded phy transceiver. The STM32F4x9 SoC uses the GGPIO register
>>> to enable the transceiver.
>>> Also add the dwc2_set_params function for stm32f4 otg fs.
>>>
>>> Signed-off-by: Bruno Herrera <bruherrera@gmail.com>
>>
>> Acked-by: John Youn <johnyoun@synopsys.com>
>>
> Do you plan to take those patches on your pull-request for 4.12?
> I was wondering if I take machine parts (DT) in my pull request for 4.12 
> or if I wait an official version with driver part merged.

patches already in my queue for v4.12

-- 
balbi
