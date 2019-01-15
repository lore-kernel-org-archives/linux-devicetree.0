From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 0/3] nvmem: imx-ocotp: Implement i.MX6ULL/ULZ support
Date: Tue, 15 Jan 2019 10:21:02 +0000
Message-ID: <617796b0-47b1-7dc2-533b-1765dc825bd0@linaro.org>
References: <1544536273-17909-1-git-send-email-stefan.wahren@i2se.com>
 <7ca64f1d-8649-79a3-4c48-5242a68a837b@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <7ca64f1d-8649-79a3-4c48-5242a68a837b@i2se.com>
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
To: Stefan Wahren <stefan.wahren@i2se.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linux-imx@nxp.com, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org



On 15/01/2019 10:17, Stefan Wahren wrote:
> Hi Shawn,
> hi Srinivas,
> 
> Am 11.12.18 um 14:51 schrieb Stefan Wahren:
>> According to the reference manuals for i.MX6ULL and i.MX6ULZ both SoCs
>> only support 8 OTP banks instead of 16. So we can't use the compatible
>> string of i.MX6UL.
>>
>> Stefan Wahren (3):
>>    dt-bindings: imx-ocotp: Add i.MX6ULL/ULZ support
>>    nvmem: imx-ocotp: Implement i.MX6ULL/ULZ support
>>    ARM: dts: imx6ull: Fix i.MX6ULL/ULZ ocotp compatible
>>
>>   Documentation/devicetree/bindings/nvmem/imx-ocotp.txt | 3 ++-
>>   arch/arm/boot/dts/imx6ull.dtsi                        | 4 ++++
>>   drivers/nvmem/imx-ocotp.c                             | 7 +++++++
>>   3 files changed, 13 insertions(+), 1 deletion(-)
>>
> Rob already gave his Reviewed-By for the binding. Are you fine with the rest of the series?
> 

I can take 1 and 2 via nvmem tree, dt patch has to go via ARM SoC tree!


thanks,
srini
> Regards
> Stefan
> 
