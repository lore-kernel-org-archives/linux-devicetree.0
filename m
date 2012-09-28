From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: bcm2835: implement machine restart hook
Date: Fri, 28 Sep 2012 08:57:20 -0600
Message-ID: <5065BAD0.1030105@wwwdotorg.org>
References: <1348805280-7647-1-git-send-email-swarren@wwwdotorg.org>
 <20120928103140.GZ17667@game.jcrosoft.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120928103140.GZ17667-RQcB7r2h9QmfDR2tN2SG5Ni2O/JbrIOy@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/28/2012 04:31 AM, Jean-Christophe PLAGNIOL-VILLARD wrote:
> On 22:08 Thu 27 Sep     , Stephen Warren wrote:
>> Implement the machine restart hook using the SoC's watchdog timer module.
>> To support this, define a DT binding for the watchdog module, and add it
>> to the device tree.
>>
>> The downstream rpi-split branch contains a full watchdog timer driver
>> implementation, which also implements the restart hook. However, the
>> restart function is largely separate from the watchdog driver, so for
>> simplicity, the restart hook is implemented here directly in the main
>> machine source file.

>> +++ b/Documentation/devicetree/bindings/watchdog/brcm,bcm2835-pm-wdog.txt

>> +Example:
>> +
>> +intc: interrupt-controller {
>> +	compatible = "brcm,bcm2835-pm-wdog";
>
> it's seems everyone use -wdt

That is true. "-wdog" is what was in the downstream patch, but I guess
it makes sense to fix it up to be consistent with everything already in
the kernel.
