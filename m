From: "Chaiken, Alison" <Alison_Chaiken@mentor.com>
Subject: RE: [PATCH 1/2] ARM: i.MX6: dts: change iomuxc pinctrl config to
 match Rev. 1 IMX6DQRM
Date: Tue, 3 Sep 2013 16:01:27 +0000
Message-ID: <60BA5429A0E1584BA3633194F6F993B502F2D8D2@NA-MBX-02.mgc.mentorg.com>
References: <521C40D9.3070802@freescale.com>
 <1377659855-9573-1-git-send-email-alison_chaiken@mentor.com>
 <1377659855-9573-2-git-send-email-alison_chaiken@mentor.com>,
 <52241BB3.5030909@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <52241BB3.5030909@freescale.com>
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
To: Huang Shijie <b32955@freescale.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "alison@she-devel.com" <alison@she-devel.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "olof@lixom.net" <olof@lixom.net>, Shawn Guo <shawn.guo@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

I wrote:
>> @@ -759,23 +759,23 @@
>>                               gpmi-nand {
>>                                       pinctrl_gpmi_nand_1: gpmi-nand-1 {
>>                                               fsl,pins = <
>> -                                                     MX6QDL_PAD_NANDF_CLE__NAND_CLE     0xb0b1
>> -                                                     MX6QDL_PAD_NANDF_ALE__NAND_ALE     0xb0b1
[ . . . ]
>>                                       };
>>                               };

Huang Shijie [b32955@freescale.com] responds:
>I tested this patch with the imx6q-ard board and imx6dl-ard board.
>For the gpmi nand test result:
>[1] imx6q-ard: We can pass the bonie++ stress test with the imx6q-ard board.
>[2] imx6dl-ard: But we fails to read the nand ID with the imx6dl-ard board.
>In other word, this gpmi can _not_ works with this patch.

Huang, I appreciate your speedy testing and sharing of results.   While I carefully and lengthily RTFM to create this patch, we can agree that making the hardware work well is the final goal!   We have tested the patch I sent on our hardware with our tests, but certainly any patch that renders some features of some boards inoperable is unacceptable.

The patch we are discussing is about 670 lines, and the NAND part is about 60.   What is your advice regarding the remaining ~600 lines?  

Best wishes,
Alison Chaiken
Mentor Embedded Software Division
Fremont, CA, USA
