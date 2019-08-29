From: Lokesh Vutla <lokeshvutla@ti.com>
Subject: Re: [PATCH v5 0/2] arm64: dts: ti: k3: Update the power-domain cells
Date: Thu, 29 Aug 2019 14:18:49 +0530
Message-ID: <1ad82ac9-b59b-3698-feca-f92a4be992a0@ti.com>
References: <20190729123023.32702-1-lokeshvutla@ti.com>
 <9aa7eeaf-36ee-3d5f-9654-d8fa37577877@ti.com>
 <4dab34ae-e7cc-6c6e-4adb-3a061027ab39@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <4dab34ae-e7cc-6c6e-4adb-3a061027ab39@ti.com>
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
To: Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: Device Tree Mailing List <devicetree@vger.kernel.org>, Sekhar Nori <nsekhar@ti.com>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Tero,

On 29/08/19 1:01 PM, Tero Kristo wrote:
> On 20/08/2019 15:48, Lokesh Vutla wrote:
>>
>>
>> On 29/07/19 6:00 PM, Lokesh Vutla wrote:
>>> Update the power-domains cells on all K3 based devices to reflect
>>> exclusive and shared permissions in each device.
>>
>> Gentle Ping on this series.
>>
>> Thanks and regards,
>> Lokesh
>>
> 
> This can't be merged until the driver portion is in. I could probably live with
> an immutable branch though.

Santosh already sent a pull request[0] with the driver changes. IMHO, dt changes
can be merged in. I don't think we need to wait for one release for DT changes
to get in or did I mis-understood your statement?

[0] https://lkml.org/lkml/2019/8/26/1124

Thanks and regards,
Lokesh

> 
> -Tero
> -- 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
