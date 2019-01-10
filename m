From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: Re: [PATCH v5 1/5] arm64: dts: rockchip: Add DT for NanoPC-T4
Date: Thu, 10 Jan 2019 15:18:37 +0100
Message-ID: <9978c094-d56f-51ca-77bf-023f69d160d5@collabora.com>
References: <cover.1546981251.git.robin.murphy@arm.com>
 <a92dd6f978b2b026557ca681610400c83ebf59b2.1546981251.git.robin.murphy@arm.com>
 <3242500.qteudgsQcv@phil> <b192edd9-7d08-3b7f-cae0-620e95a7bbce@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <b192edd9-7d08-3b7f-cae0-620e95a7bbce@arm.com>
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
To: Robin Murphy <robin.murphy@arm.com>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 1/10/19 2:42 PM, Robin Murphy wrote:
> On 10/01/2019 13:37, Heiko Stuebner wrote:
>> Am Dienstag, 8. Januar 2019, 22:57:23 CET schrieb Robin Murphy:
>>> From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
>>>
>>> This adds a device tree for the NanoPC-T4 SBC, which is based on the
>>> Rockchip RK3399 SoC and marketed by FriendlyELEC.
>>>
>>> Known working:
>>>
>>> - Serial
>>> - Ethernet
>>> - HDMI
>>> - USB 2.0
>>>
>>> All of the interesting stuff is in a .dtsi because there are at least
>>> two other boards that share most of it: NanoPi M4 and NanoPi NEO4.
>>>
>>> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>> [rm: various further cleanup]
>>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>>
>> nobody complained, the binding was reviewed and all looks good
>> so I've gone forward and applied this one for 5.1 already.
> 
> Awesome, thanks!
> 
> I'll probably follow up with a v2 of the rest of the patches next week, 
> after I've had the chance to play some more over the weekend.

Thanks a lot for picking this up!

Have given the whole series a try and haven't found any issues. I have 
booted with nfsroot and have only run a few OpenGL apps with panfrost, 
using ARM's GPU driver.

In case there's time for it:

Tested-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>

Cheers,

Tomeu
