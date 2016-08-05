From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH] ARM: dts: da850: Add basic DTS for the L138/C6748 Dev Kit
Date: Fri, 5 Aug 2016 19:30:11 +0530
Message-ID: <57A49BEB.7070503@ti.com>
References: <20160804144332.4841-1-kbeldan@baylibre.com>
 <m2popopcqu.fsf@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <m2popopcqu.fsf@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kevin Hilman <khilman@baylibre.com>, Karl Beldan <kbeldan@baylibre.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, karl.beldan+oss@gmail.com, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Friday 05 August 2016 12:45 AM, Kevin Hilman wrote:
>>  Documentation/devicetree/bindings/arm/davinci.txt |  4 ++
>>  arch/arm/boot/dts/Makefile                        |  1 +
>>  arch/arm/boot/dts/omapl138-lcdk.dts               | 71 +++++++++++++++++++++++
> 
> I think this should be called da850-lcdk.dts.
> 
> The OMAP prefix in the DT directory is just going to cause confusion,
> and the other DTs using this same SoC are already called da850.
> 
> Sekhar do you have any opinion here?

Prefer using da850 in file names and in code. The explanatory or help
text can contain rest of the part names.

For file names or code catering both to da850 and da830, da8xx should be
used.

I know documentation for da850 and da830 is not public, but thats what
the parts first came out as, and we want to be consistent with existing
code.

Regards,
Sekhar
