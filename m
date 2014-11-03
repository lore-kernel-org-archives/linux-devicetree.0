From: Chris Zhong <zyw@rock-chips.com>
Subject: Re: [PATCH 1/2] regulator: Document binding for regulator suspend
 voltage
Date: Mon, 03 Nov 2014 08:27:17 +0800
Message-ID: <5456CBE5.9050209@rock-chips.com>
References: <1414813978-32233-1-git-send-email-dianders@chromium.org> <54549DBA.5020102@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54549DBA.5020102@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Doug Anderson <dianders@chromium.org>, Mark Brown <broonie@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Andrew Bresticker <abrestic@chromium.org>, Chanwoo Choi <cw00.choi@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, carlos@cgarcia.org, rdunlap@infradead.org, jkosina@suse.cz, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On 11/01/2014 04:45 PM, Javier Martinez Canillas wrote:
> Hello Doug,
>
> On 11/01/2014 04:52 AM, Doug Anderson wrote:
>> This patch builds upon (291d761 regulator: Document binding for
>> regulator suspend state for PM state) to allow setting the uV in
>> addition to the state at suspend time.
>>
>> Signed-off-by: Doug Anderson <dianders@chromium.org>
>> ---
>>   Documentation/devicetree/bindings/regulator/regulator.txt | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/regulator/regulator.txt b/Documentation/devicetree/bindings/regulator/regulator.txt
>> index aaad615..4e7ed76 100644
>> --- a/Documentation/devicetree/bindings/regulator/regulator.txt
>> +++ b/Documentation/devicetree/bindings/regulator/regulator.txt
>> @@ -28,6 +28,8 @@ Optional properties:
>>   - regulator-state-[mem/disk] node has following common properties:
>>   	- regulator-on-in-suspend: regulator should be on in suspend state.
>>   	- regulator-off-in-suspend: regulator should be off in suspend state.
>> +	- regulator-suspend-microvolt: regulator should be set to this voltage
>> +	  in suspend.
> The patch looks good to me:
>
> Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
>
> On thing I wonder is if the binding should say that the suspend voltage is
> independent of the runtime one and it may be outside of the runtime range?
>
> Best regards,
> Javier
>
>
>

Reviewed-by: Chris Zhong <zyw@rock-chips.com>
