From: Kevin Brodsky <kevin.brodsky@arm.com>
Subject: Re: [PATCH] arm64: dts: fast models: Increase clcd's
 max-memory-bandwidth
Date: Thu, 25 Jul 2019 17:58:25 +0100
Message-ID: <1d7929a2-273e-e695-6700-36aacf38f61a@arm.com>
References: <20190725145040.42182-1-kevin.brodsky@arm.com>
 <042d5c3d-96fe-5466-3869-a0a3a08b964d@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <042d5c3d-96fe-5466-3869-a0a3a08b964d@arm.com>
Content-Language: en-GB
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ruben Ayrapetyan <ruben.ayrapetyan@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org, Sudeep Holla <sudeep.holla@arm.com>, Brian Starkey <brian.starkey@arm.com>
List-Id: devicetree@vger.kernel.org

On 25/07/2019 16:15, Robin Murphy wrote:
> Hi Kevin,

Hi Robin,

> On 25/07/2019 15:50, Kevin Brodsky wrote:
>> It may be desirable on certain platforms, such as Android, to
>> use 32bpp buffers. Since there is no clear bandwidth limit for the
>> CLCD component on the fast model, let's increase
>> max-memory-bandwidth to allow using 32bpp buffers.
> Given that the property is optional anyway, would it hurt to just remove
> it? After trying to dig up any relevant internal email history, it's
> still far from clear how and why it got here in the first place.

Very good point, I hadn't realised it was an optional property. Removing it 
completely seems to work fine. I'll send a v2 removing it from both fvp-base-revc.dts 
and rtsm_ve-motherboard.dtsi. Thanks!

Kevin

> Robin.
>
>> Reported-by: Ruben Ayrapetyan <ruben.ayrapetyan@arm.com>
>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> ---
>>    arch/arm64/boot/dts/arm/fvp-base-revc.dts | 2 +-
>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/arm/fvp-base-revc.dts b/arch/arm64/boot/dts/arm/fvp-base-revc.dts
>> index 687707020ec1..3aee49ed6d88 100644
>> --- a/arch/arm64/boot/dts/arm/fvp-base-revc.dts
>> +++ b/arch/arm64/boot/dts/arm/fvp-base-revc.dts
>> @@ -269,7 +269,7 @@
>>    		motherboard {
>>    			iofpga@3,00000000 {
>>    				clcd@1f0000 {
>> -					max-memory-bandwidth = <130000000>; /* 16bpp @ 63.5MHz */
>> +					max-memory-bandwidth = <260000000>; /* 32bpp @ 63.5MHz */
>>    				};
>>    			};
>>    		};
>>
