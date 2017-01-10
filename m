From: Milo Kim <woogyom.kim@gmail.com>
Subject: Re: [PATCH resend v4 2/3] ARM: dts: imx6: Support Savageboard dual
Date: Tue, 10 Jan 2017 13:31:38 +0900
Message-ID: <02b61197-c906-c072-1ee9-d6324a55f01d@gmail.com>
References: <20170104070436.3425-1-woogyom.kim@gmail.com>
 <20170110032736.GX20956@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170110032736.GX20956@dragon>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


On 01/10/2017 12:27 PM, Shawn Guo wrote:
> On Wed, Jan 04, 2017 at 04:04:36PM +0900, Milo Kim wrote:
>> Common savageboard DT file is used for board support.
>> Add the vendor name and specify the dtb file for i.MX6Q build.
>>
>> Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
>> Signed-off-by: Milo Kim <woogyom.kim@gmail.com>
>> ---
>>  .../devicetree/bindings/vendor-prefixes.txt        |  1 +
> The bindings change should be ideally a separate patch.  But since Rob
> seems to be fine with it this time, I just applied the whole series.

Got it. Thanks for taking this.

Best regards,
Milo
