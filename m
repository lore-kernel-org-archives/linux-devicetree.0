From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v2 19/19] ARM64: dts: r8a77965: Add EtherAVB device node
Date: Wed, 21 Feb 2018 21:53:58 +0300
Message-ID: <eaf3c72b-a482-86cf-88e7-4af457f74558@cogentembedded.com>
References: <1519139541-18783-1-git-send-email-jacopo+renesas@jmondi.org>
 <1519139541-18783-20-git-send-email-jacopo+renesas@jmondi.org>
 <cf157266-5ea7-6795-1e31-0d1ccf85e7e8@cogentembedded.com>
 <20180221100716.GF7203@w540>
 <cbeb1b6b-1b02-7665-0f1f-847ab8de69e3@cogentembedded.com>
 <20180221173106.vgyshbz3kkc4p3cu@verge.net.au>
 <321c6c8c-8853-ac00-7567-c0be82b510f4@cogentembedded.com>
 <35959135-cb3b-040a-1944-26845e0c07b0@cogentembedded.com>
 <20180221182340.wvdvgtv5pw7pvd3v@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180221182340.wvdvgtv5pw7pvd3v@verge.net.au>
Content-Language: en-MW
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Simon Horman <horms@verge.net.au>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jacopo mondi <jacopo@jmondi.org>, magnus.damm@gmail.com, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, geert@linux-m68k.org, Jacopo Mondi <jacopo+renesas@jmondi.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 02/21/2018 09:23 PM, Simon Horman wrote:

> ...
> 
>>>>>>>> +			clocks = <&cpg CPG_MOD 812>;
>>>>>>>> +			power-domains = <&sysc 32>;
>>>>>>>> +			resets = <&cpg 812>;
>>>>>>>> +			phy-mode = "rgmii-txid";
>>>>>>>
>>>>>>>    Why not just "rgmii"? TX delay is a board specific detail, no?
>>>>>>>
>>>>>> I admit I took this one straight from r8a7796 dtsi.
>>>>>> Would you like to me resend and change this?
>>>>>
>>>>>    Yes, unless Simon would fix it while merging...
>>>>
>>>> Can I confirm the desired change is s/rgmii-txid/rgmii/ ?
>>>
>>>    Yes.
>>
>>    Apparently that means that this prop should be overridden in the board file
>> (which may not be an easy task given the board is Salvator-XS again).
>>
>> [...]
> 
> Can we override it in r8a77965-salvator-x.dts or r8a77965-salvator-xs.dts?

   In salvator-common.dtsi most probably -- it has the PHY data for Ether AVB.

> I feel that I'm missing an important point here.

   Well, r8a779{5|6}.dtsi also have phy-mode = "rgmii-txid" (which was unjustified
in my current understanding). Thus such board override wouldn't hurt them. But we lack
a patch modifying salvator-common.dtsi in htis series, so I'm now thinking a respin of
this series is needed anyway... sorry for being unclear. :-)

MBR, Sergei
