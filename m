From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: condor: add EtherAVB pins
Date: Fri, 9 Mar 2018 20:26:03 +0300
Message-ID: <b1450eb7-4635-804a-ed8b-34d6c1942fa4@cogentembedded.com>
References: <88e52531-e538-8685-110a-1a2e79a3fe49@cogentembedded.com>
 <82c33f37-bfbb-e515-f996-83333cd26171@cogentembedded.com>
 <CAMuHMdVJkRuEvzmAJf2pWd9E+XVgmO122-2mHSgw7Y4aLXdfYA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAMuHMdVJkRuEvzmAJf2pWd9E+XVgmO122-2mHSgw7Y4aLXdfYA@mail.gmail.com>
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
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Rob Herring <robh+dt@kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hello!

On 03/09/2018 03:44 PM, Geert Uytterhoeven wrote:

>> Add the (previously omitted) EtherAVB pin data to the Condor board's
>> device tree.
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> According to the Condor schematics, the KSZ9031RNXVB is wired to
> GEther by default. So I guess you are using a modified board?

  Artemy told me they haven't been able to bring up the GEther (due to wrong
base address?), so they resoldered the reisitors. He also told me there are now
versions of the board that wire the PHY to EtherAVB. Go figure...

[...]

MBR, Sergei
