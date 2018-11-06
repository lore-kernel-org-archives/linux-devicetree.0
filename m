From: Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: r8a77990: ebisu: Enable SDHI interfaces
Date: Tue, 6 Nov 2018 10:18:01 +0100
Message-ID: <3e933acf-33d1-ca27-e463-57345c79396a@gmail.com>
References: <20181105214117.11734-1-marek.vasut+renesas@gmail.com>
 <20181105214117.11734-2-marek.vasut+renesas@gmail.com>
 <20181106083450.GB1054@kunai>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181106083450.GB1054@kunai>
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
To: Wolfram Sang <wsa@the-dreams.de>
Cc: devicetree@vger.kernel.org, Takeshi Kihara <takeshi.kihara.df@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-renesas-soc@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>, linux-arm-kernel@lists.infradead.org, Marek Vasut <marek.vasut+renesas@gmail.com>
List-Id: devicetree@vger.kernel.org

On 11/06/2018 09:34 AM, Wolfram Sang wrote:
> 
>> +	sdhi3_pins: sd3 {
>> +		groups = "sdhi3_data8", "sdhi3_ctrl";
>> +		function = "sdhi3";
>> +		power-source = <1800>;
>> +	};
>> +
>> +	sdhi3_pins_uhs: sd3_uhs {
>> +		groups = "sdhi3_data8", "sdhi3_ctrl";
>> +		function = "sdhi3";
>> +		power-source = <1800>;
>> +	};
> 
> Shouldn't we have only one pinctrl config here, like you did recently
> for the other Gen3 SoCs?

We should, thanks for pointing it out, fixed in V2.

-- 
Best regards,
Marek Vasut
