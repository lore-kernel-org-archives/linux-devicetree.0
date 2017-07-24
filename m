From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 1/8] mailbox: introduce ARM SMC based mailbox
Date: Mon, 24 Jul 2017 23:22:41 +0530
Message-ID: <CABb+yY0LYagAOet-KgP+PB__t26LdCSCnxtH6h_X+T37sq_5Wg@mail.gmail.com>
References: <20170630095608.24943-1-andre.przywara@arm.com>
 <20170630095608.24943-2-andre.przywara@arm.com>
 <CABb+yY18Aye3wr2A9-+jemqc=VSRyUA+xzKGo9s0G4KCt1ovyA@mail.gmail.com>
 <22d23c1d-ea8d-9829-4624-6305cd83ad4a@arm.com>
 <CABb+yY2hjfXdiCSZXd5TJf8=janwjWEo2oSqrxdoWc=1oUtteQ@mail.gmail.com>
 <0aaba7fb-2183-2d4d-ba04-64b30cd0ae10@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <0aaba7fb-2183-2d4d-ba04-64b30cd0ae10@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Devicetree List <devicetree@vger.kernel.org>, =?UTF-8?Q?Andr=C3=A9_Przywara?= <andre.przywara@arm.com>, Chen-Yu Tsai <wens@csie.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-sunxi@googlegroups.com, Rob Herring <robh+dt@kernel.org>, Icenowy Zheng <icenowy@aosc.xyz>, Maxime Ripard <maxime.ripard@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 24, 2017 at 11:08 PM, Sudeep Holla <sudeep.holla@arm.com> wrote:
> On 24/07/17 18:20, Jassi Brar wrote:

>>
>>> I see that the SCPI firmware driver (as the user of the mailbox API) is
>>> expecting the return value from a0 as returned above, translating the
>>> firmware error codes into Linux' ones.
>>>
>> I am afraid, SCPI driver is not the golden example for client drivers
>> to follow. It is supposed to work only with MHU, and then, it is
>> likely to break if some other protocol is running parallel to it.
>>
>
> Not sure why do you say it works only with ARM MHU ? AmLogic uses it
> with their mailbox driver. However they followed an interim version of
> the SCPI spec which is termed "legacy" in the driver.
>
Screw coding... Just tell me what stuff do you smoke? Must be really good!
