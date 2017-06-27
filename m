From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: stdout-path (was Re: [PATCH 3/3 v6] ARC: hsdk: initial port for HSDK
 board)
Date: Tue, 27 Jun 2017 07:25:39 +0300
Message-ID: <5abefbed-fd4d-0564-e99c-e17f6a1445b5@synopsys.com>
References: <20170626151118.19507-1-Eugeniy.Paltsev@synopsys.com>
 <20170626151118.19507-4-Eugeniy.Paltsev@synopsys.com>
 <CAL_JsqJBPL+AuYNP=JgXWOGNFxdenKY4Rt3_f6tG6MYDLncRNg@mail.gmail.com>
 <1498494334.28955.58.camel@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1498494334.28955.58.camel@synopsys.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Alexey.Brodkin@synopsys.com" <Alexey.Brodkin@synopsys.com>, "Eugeniy.Paltsev@synopsys.com" <Eugeniy.Paltsev@synopsys.com>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

On 06/26/2017 07:25 PM, Alexey Brodkin wrote:
>>> +
>>> +       chosen {
>>> +               bootargs = "earlycon=uart8250,mmio32,0xf0005000,115200n8 console=ttyS0,115200n8 debug print-fatal-signals=1";
>> Use stdout-path for the console. Really, the bootargs should be blank
>> and populated by the bootloader especially debug options.
> Agree but in case of devboards we quite often disable bootloader and
> load Linux image in memory via JTAG. So in that case bootargs make perfect sense IMH

FWIW, I tried this 2 years ago (v4.1 ish) per pestering by Arnd but at the time I 
had to add some hacks in early 8250 driver to get this working for ARC.

See,
http://www.spinics.net/lists/linux-serial/msg17742.html
http://www.spinics.net/lists/linux-serial/msg17747.html

We can certainly revisit this now.

-Vineet
