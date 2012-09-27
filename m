From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RFC PATCH 0/3] ARM: use C pre-processor with dtc
Date: Thu, 27 Sep 2012 09:38:12 -0600
Message-ID: <506472E4.5060107@wwwdotorg.org>
References: <1348599998-2729-1-git-send-email-swarren@wwwdotorg.org>
 <20120927054038.GL17667@game.jcrosoft.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120927054038.GL17667-RQcB7r2h9QmfDR2tN2SG5Ni2O/JbrIOy@public.gmane.org>
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
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/26/2012 11:40 PM, Jean-Christophe PLAGNIOL-VILLARD wrote:
> On 13:06 Tue 25 Sep     , Stephen Warren wrote:
>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> This series adds some build rules to run cpp on *.dts-cpp prior to
>> invoking dtc, and converts Tegra to the new rule as an example. What do
>> people think?
>>
>> I assume that you've applied the dtc patches I sent yesterday. They
>> aren't in this series. See:
>>
>> https://lists.ozlabs.org/pipermail/devicetree-discuss/2012-September/020182.html
>> https://lists.ozlabs.org/pipermail/devicetree-discuss/2012-September/020183.html
>> https://lists.ozlabs.org/pipermail/devicetree-discuss/2012-September/020181.html
>>
>> Note: those patches are against upstream dtc. If you wish to test this
>> series, apply the dtc patches to upstream dtc, build it, and copy the
>> resultant dtc binary over the top of scripts/dtc/dtc.
>>
>> Stephen Warren (3):
>>   kbuild: introduce cmd_dtc_cpp
>>   ARM: use cmd_dtc_cpp for compilation of *.dts-cpp to *.dtb
>>   ARM: tegra: compile all DT files with cpp 
>
> I do not like the extention

It is a bit unwieldy. Perhaps *.dtsp, *.dtsip would be better.

> can we run gcc everytime?

Not without editing all the device tree files; any property (or node)
name the starts with a # must be escaped; changed from "#foo" to "\#foo"
to avoid cpp attempting to interpret it as a pre-processor directive.

> or just do as done for lds
> 
> *.dts.S

.S means assembly. (that's why I went with .dts-cpp rather than .dts.cpp).
