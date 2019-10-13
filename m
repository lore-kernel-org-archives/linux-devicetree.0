From: Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH v1 3/3] ARM: dts: bcm2711: Enable GENET support for the
 RPi4
Date: Sun, 13 Oct 2019 20:41:50 +0200
Message-ID: <c7fac096-4a0a-1d52-2284-4fe86554fbc8@gmx.net>
References: <20191011184822.866-1-matthias.bgg@kernel.org>
 <20191011184822.866-4-matthias.bgg@kernel.org>
 <a514751e-e82a-b5ea-34d3-46468c851a80@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <a514751e-e82a-b5ea-34d3-46468c851a80@gmail.com>
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
To: Florian Fainelli <f.fainelli@gmail.com>, matthias.bgg@kernel.org, "David S . Miller" <davem@davemloft.net>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Matthias Brugger <mbrugger@suse.com>, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, linux-kernel@vger.kernel.org, Eric Anholt <eric@anholt.net>, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Florian,

Am 11.10.19 um 21:31 schrieb Florian Fainelli:
> On 10/11/19 11:48 AM, matthias.bgg@kernel.org wrote:
>> From: Matthias Brugger <mbrugger@suse.com>
>>
>> Enable Gigabit Ethernet support on the Raspberry Pi 4
>> Model B.
>>
>> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
>>
>> ---
>>
>>  arch/arm/boot/dts/bcm2711-rpi-4-b.dts | 22 ++++++++++++++++++++++
>>  arch/arm/boot/dts/bcm2711.dtsi        | 18 ++++++++++++++++++
>>  2 files changed, 40 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/bcm2711-rpi-4-b.dts b/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
>> index cccc1ccd19be..958553d62670 100644
>> --- a/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
>> +++ b/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
>> @@ -97,6 +97,28 @@
>>  	status = "okay";
>>  };
>>
>> +&genet {
>> +	phy-handle = <&phy1>;
>> +	phy-mode = "rgmii";
> Can you check that things still work against David Miller's net-next?
> Tree, in particular the BCM54213PE PHY might be matched by the BCM54210E
> entry in drivers/net/phy/broadcom.c and I just fixed an issue in how
> RGMII delays were configured:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git/commit/?id=fea7fda7f50a6059220f83251e70709e45cc8040
>
> This might require you to change the 'phy-mode' property to what is
> appropriate.

i applied your changes, kept the phy-mode above and the interfaces cames
up. But there is a lot of packet loss using ping. After applying this
downstream patch [1] the packet loss doesn't occur.

Is the packet loss a possible cause of the wrong phy-mode and mentioned
patch only a workaround?

[1] -
https://github.com/raspberrypi/linux/commit/360c8e98883f9cd075564be8a7fc25ac0785dee4
