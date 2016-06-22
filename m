From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH] ARM: dts: r8a7794: add SMP support
Date: Wed, 22 Jun 2016 13:08:32 +0300
Message-ID: <adbc6358-d3fb-c608-15c2-c425332435f3@cogentembedded.com>
References: <14666252.G84Ipxe6EL@wasted.cogentembedded.com>
 <27171008.uuY7altQup@wasted.cogentembedded.com>
 <CAMuHMdWcVRBxZO85_MhYVvODcbi-GYDNKfQH9LJEcrJRd=p7Vw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAMuHMdWcVRBxZO85_MhYVvODcbi-GYDNKfQH9LJEcrJRd=p7Vw@mail.gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-renesas-soc@vger.kernel.org, Simon Horman <horms@verge.net.au>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 6/22/2016 10:20 AM, Geert Uytterhoeven wrote:

>> Add the device tree node for the Advanced Power Management Unit (APMU).
>> Use the "enable-method" prop to  point out that the APMU should be used
>> for the SMP support.
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
>> SMP/PM basically works but you can't offline CPU0 (system hangs)...
>
> On #renesas-soc you said it hangs on SILK only, and succeeds on Porter,
> with a WARNING in the clk core (which one?) during suspend?

    Porter is based on R8A7791 (WARNING seemed to be caused by the CAN 
driver). :-)

> Thanks!
>
> Gr{oetje,eeting}s,
>
>                         Geert

MBR, Sergei
