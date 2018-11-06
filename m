From: Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: r8a77990: Add SDHI device nodes
Date: Tue, 6 Nov 2018 21:47:26 +0100
Message-ID: <47570b8b-618b-d35e-c5a9-bfab545874cd@gmail.com>
References: <20181105214117.11734-1-marek.vasut+renesas@gmail.com>
 <OSBPR01MB229351FF35C839C4E9A7F19CD8CB0@OSBPR01MB2293.jpnprd01.prod.outlook.com>
 <7ab702f0-e78c-94c5-b74f-bac1803fb513@gmail.com>
 <CAMuHMdWkbqizvAtP=ka9tiirNqb=CzhRxGdWY3VcTT_8-UrG+Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAMuHMdWkbqizvAtP=ka9tiirNqb=CzhRxGdWY3VcTT_8-UrG+Q@mail.gmail.com>
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
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Takeshi Kihara <takeshi.kihara.df@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Wolfram Sang <wsa@the-dreams.de>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Marek Vasut <marek.vasut+renesas@gmail.com>
List-Id: devicetree@vger.kernel.org

On 11/06/2018 11:35 AM, Geert Uytterhoeven wrote:
> Hi Marek,

Hi,

> On Tue, Nov 6, 2018 at 11:32 AM Marek Vasut <marek.vasut@gmail.com> wrote:
>> On 11/06/2018 06:26 AM, Yoshihiro Shimoda wrote:
>>>> From: Marek Vasut, Sent: Tuesday, November 6, 2018 6:41 AM
>>>>
>>>> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>>>>
>>>> This patch adds SDHI{0,1,3} device nodes for the r8a77990 SoC.
>>>>
>>>> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>>>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>>>> Cc: Simon Horman <horms+renesas@verge.net.au>
>>>> Cc: Wolfram Sang <wsa@the-dreams.de>
>>>> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>>>> Cc: linux-renesas-soc@vger.kernel.org
>>>> Cc: linux-arm-kernel@lists.infradead.org
>>>> ---
>>>
>>> Thank you for the patch!
>>>
>>> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>>>
>>> I guess this patch and the 2/2 patch for ebisu have to be merged into a patch though.
>>
>> I wonder about that, 1/2 is adding SDHI DT nodes for an SoC, 2/2 is
>> enabling SDHI on a particular board, which I think should be separate.
> 
> The arm-soc maintainers tend to disagree, that's why Shimoda-san asked
> to combine them.

Combined patch is out.

-- 
Best regards,
Marek Vasut
