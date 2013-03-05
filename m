From: "Christian Daudt" <csd@broadcom.com>
Subject: Re: [PATCH] ARM: bcm281xx: Add L2 cache enable code
Date: Tue, 5 Mar 2013 14:56:12 -0800
Message-ID: <5136780C.7030801@broadcom.com>
References: <1362451632-18806-1-git-send-email-csd@broadcom.com>
 <51363770.5060201@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <51363770.5060201@wwwdotorg.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, devicetree-discuss@lists.ozlabs.org, csd_b@daudt.org, "arm@kernel.org" <arm@kernel.org>, linux-arm-kernel@lists.infradead.org, Olof Johansson <olof@lixom.net>, abhimanyu.kapur@outlook.com
List-Id: devicetree@vger.kernel.org

On 13-03-05 10:20 AM, Stephen Warren wrote:
> On 03/04/2013 07:47 PM, Christian Daudt wrote:
>> - Adds a module to provide calls into secure monitor mode
>> - Uses this module to make secure monitor calls to enable L2 cache.
>> diff --git a/Documentation/devicetree/bindings/misc/smc.txt b/Documentation/devicetree/bindings/misc/smc.txt
>> +Example:
>> +	smc@0x3404c000 {
>> +		compatible = "bcm,kona-smc";
> Both here in this example, and ...
>
>> diff --git a/arch/arm/boot/dts/bcm11351.dtsi b/arch/arm/boot/dts/bcm11351.dtsi
>> +	smc@0x3404c000 {
>> +		compatible = "bcm,kona-smc";
> Here in the actual .dts file, you should include the specific ID of the
> SoC too, so that if there are Soc-specific bugs, the compatible property
> that's required to determine this is present from the start. In other words,
>
> compatible = "bcm,bcm11351-smc", "bcm,kona-smc";
>
> (which SoC ID you use in the example is arbitrary, but it may as well
> match the .dts file you're editing in the patch).
>

ok. done.

  thanks,
    csd
