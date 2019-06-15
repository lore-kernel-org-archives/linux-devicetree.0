From: Peter Geis <pgwipeout@gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: improve rk3328-roc-cc rgmii
 performance.
Date: Sat, 15 Jun 2019 08:12:36 -0400
Message-ID: <71dc10a5-1024-d849-336e-476d183e5f46@gmail.com>
References: <20190607123731.8737-1-pgwipeout@gmail.com>
 <1559912295.22520.0@gmail.com>
 <CAMdYzYorvWr1YhmFKaMQUCditjop5AZp4d1tO79XsVr7m7HrMw@mail.gmail.com>
 <1560547631.1367.4@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1560547631.1367.4@gmail.com>
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
To: "Leonidas P. Papadakos" <papadakospan@gmail.com>
Cc: Jose Abreu <jose.abreu@synopsys.com>, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org



On 6/14/2019 5:27 PM, Leonidas P. Papadakos wrote:
> 
> 
>> The big change was actually snps,aal.
>> As per the TRM, DMA channels not address aligned have severe
>> limitations, if they work at all.
>>
>> Setting the DMA ops as address aligned fixed my 30mbps TX issue when
>> combined with your snps,txpbl = <0x4>.
> 
> Honestly, I don't notice any difference either way with aal. So what 
> happens without it? If You only use the 0x4 txpbl and having removed 
> thresh dma mode, (2 things then) do you get bad tx?
> 
> 

I'm unsure why, but I think there might be small variations in the 
different boards (Firefly, Libre).
On my board (Libre) with just 0x4 txpbl and thresh dma removed I get a 
whopping 30mbps.

Adding aal brought it up to 900 mbps.

I also had stability issues on rx, where it would bounce between 200 and 
400 mbps, which adding 0x4 rxpbl helped.
I still haven't been able to get rx above 400mpbs though.

It's definitely the MTU issue, since setting the max mtu to 1496 fixes 
most problems.

I have to wonder if the pl330 in the rk3328 is bugged, since all of the 
hardware that misbehaves (usb3, mmc, rgmii) require the dma engine.

If this works as a valid replacement for thresh dma mode, then I can 
submit it for merging.
I would like a few more people to test it first.

Anyone else with a rk3328-roc-cc board that can test this patch?
