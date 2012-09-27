From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RFC PATCH 1/3] kbuild: introduce cmd_dtc_cpp
Date: Thu, 27 Sep 2012 09:39:28 -0600
Message-ID: <50647330.9030306@wwwdotorg.org>
References: <1348599998-2729-1-git-send-email-swarren@wwwdotorg.org>
 <1348599998-2729-2-git-send-email-swarren@wwwdotorg.org>
 <20120927054438.GM17667@game.jcrosoft.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120927054438.GM17667-RQcB7r2h9QmfDR2tN2SG5Ni2O/JbrIOy@public.gmane.org>
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

On 09/26/2012 11:44 PM, Jean-Christophe PLAGNIOL-VILLARD wrote:
> On 13:06 Tue 25 Sep     , Stephen Warren wrote:
>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> cmd_dtc_cpp runs the C pre-processor on the input .dts file before
>> passing it to dtc for final compilation. This allows used of #define
>> within the .dts file.
>>
>> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>  scripts/Makefile.lib |    3 +++
>>  1 files changed, 3 insertions(+), 0 deletions(-)
>>
>> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
>> index 0be6f11..e3a149e 100644
>> --- a/scripts/Makefile.lib
>> +++ b/scripts/Makefile.lib
>> @@ -266,6 +266,9 @@ $(obj)/%.dtb.S: $(obj)/%.dtb
>>  quiet_cmd_dtc = DTC     $@
>>  cmd_dtc = $(objtree)/scripts/dtc/dtc -O dtb -o $@ -b 0 $(DTC_FLAGS) -d $(depfile) $<
>>  
>> +quiet_cmd_dtc_cpp = DTC+CPP $@
>> +cmd_dtc_cpp = $(CC) -E -Wp,-MD,$(depfile) -xc $< | $(objtree)/scripts/dtc/dtc -O dtb -o $@ -b 0 $(DTC_FLAGS) -
>
> this should go to Makefile.build

Hmm. Consistency with the existing cmd_dtc right above would dictate
otherwise.

> and we should keep the same nomecalture as lds with lds.S
> 
> here dts.S

I don't agree; see my previous response to the same assertion.

> and is it possible to cmd with it

I don't understand the question.
