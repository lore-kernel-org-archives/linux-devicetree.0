From: Sergey Matyukevich <geomatsi@gmail.com>
Subject: Re: [PATCH v2 1/2] ARM: dts: orange-pi-zero: specify wifi interrupts
Date: Thu, 25 May 2017 11:38:08 +0300
Message-ID: <CAFGfvX79A0+Q3iPgfQ8tDG5BX78Gp_PCtbsk8ogiSCd9fC+mug@mail.gmail.com>
References: <20170524212433.14386-1-geomatsi@gmail.com>
 <20170524212433.14386-2-geomatsi@gmail.com>
 <CAGb2v647GTQW9-ZYrkWS7RoeYTu_7oTm8v4PDs0YD1pZ8oUohQ@mail.gmail.com>
 <20170525071055.xdd4sbpnzlkg7wa2@speedy.hunter>
 <CAGb2v671hWDaTqCAJiN0JAuiPynW+=XtN+Xr5WiyTPDSkk9-FQ@mail.gmail.com>
 <DAC099FE-6655-4EE2-A68A-AD2C5BBDDF76@aosc.io>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <DAC099FE-6655-4EE2-A68A-AD2C5BBDDF76@aosc.io>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Icenowy Zheng <icenowy@aosc.io>
Cc: devicetree <devicetree@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

>>> Those properties are optional. Driver works anyway, though it
>>complains about
>>> missing interrupts. IIUC xradio driver falls back to polling mode
>>only if
>>> xr819 interrupt configuraton is not specified.
>>
>>So it doesn't support in-band SDIO interrupts right now. Is that a
>>hardware
>>or driver limitation?
>
> The original driver code modified by me to mainline uses in-band interrupts.
>
> But dgp modified it to use out-of-band interrupts.

Current patch was intended to simplify using out of the box the following
out-of-tree driver: https://github.com/fifteenhex/xradio.

Could you please share a bit more details about the drivers you mention here.
Is there any xr819 mainlining efforts ongoing ?

Regards,
Sergey
