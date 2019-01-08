From: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 2/5] arm64: dts: rockchip: Add DT for NanoPi M4
Date: Tue, 8 Jan 2019 22:35:40 +0000
Message-ID: <a9934783-7562-c872-fdcd-1f8e72e85881@arm.com>
References: <cover.1546981251.git.robin.murphy@arm.com>
 <324b75bbeef2552ddde62f4e1834ac908a45bebd.1546981251.git.robin.murphy@arm.com>
 <1755553.je4OVlYtzY@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1755553.je4OVlYtzY@phil>
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
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org, tomeu.vizoso@collabora.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Heiko,

On 2019-01-08 10:15 pm, Heiko Stuebner wrote:
> Hi Robin,
> 
> Am Dienstag, 8. Januar 2019, 22:57:24 CET schrieb Robin Murphy:
>> There are a number of subtle differences between the nanopi4 variants,
>> and where they disagree, the common DTSI currently follows the details
>> of NanoPi M4. In order to improve matters even more, let's add a
>> separate DTS for the M4 to which we can start splitting things out
>> appropriately. The third variant, NanoPi NEO4, is a lot closer to the M4
>> than either is to the larger T4, so arguably could get away with just
>> sharing the M4 DT for now (plus I have neither of the smaller boards to
>> actually test with).
>>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> 
> I'm not sure if Rob actually checks the devicetree list or relies on
> patches Cc'ed directly to him for binding review, so you might want
> to add the 2 dt maintainers explicitly.

Er, that's embarassing... I somehow failed to register that my mindless 
copy-paste job ends up adding a new binding that *isn't* the one Rob 
already reviewed :(

>> ---
>>   .../devicetree/bindings/arm/rockchip.yaml      |  5 +++++
>>   arch/arm64/boot/dts/rockchip/Makefile          |  1 +
>>   .../boot/dts/rockchip/rk3399-nanopi-m4.dts     | 18 ++++++++++++++++++
>>   3 files changed, 24 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dts
>>
>> diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
>> index bcc60c492a12..b4756e0cb7d0 100644
>> --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
>> +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
>> @@ -92,6 +92,11 @@ properties:
>>             - const: friendlyarm,nanopc-t4
>>             - const: rockchip,rk3399
>>   
>> +      - description: FriendlyElec NanoPi M4
>> +        items:
>> +          - const: friendlyarm,nanopi-m4
>> +          - const: rockchip,rk3399
>> +
> 
> When we hashed out the Rockchip yaml thingy, there also
> came up the possibility of grouping the similar boards together
> into an enum, see the rk3399-firefly or the rk3288-evb-* for example.
> 
> So the binding for both could possibly become:
> 
>        - description: FriendlyElec NanoPi
>          items:
> 	  - enum:
>            	- friendlyarm,nanopi-m4
>            	- friendlyarm,nanopi-t4
>            - const: rockchip,rk3399
> 
> We didn't come up with a hard rule for all cases, but the
> Nano PI feels like it qualifies ;-)

...but I completely agree with that idea anyway - as the commit log 
alludes to, this was really just somewhere to move the existing nodes to 
without much thought involved. I'll give it a day or two for any more 
comments, then respin at least this patch and make sure the binding 
update goes to the maintainers properly.

Cheers,
Robin.
