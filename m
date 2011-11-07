From: Dirk Behme <dirk.behme-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] distclean: Remove generated .dtb files
Date: Mon, 07 Nov 2011 07:25:19 +0100
Message-ID: <4EB779CF.4040007@googlemail.com>
References: <1320473955-4500-1-git-send-email-dirk.behme@de.bosch.com>
	<20111106183802.GB2546@ponder.secretlab.ca>
	<CACxGe6vK24j=L_WQWf5eqmdKXf0gCD=waAbJj4eq9d63O8mbvA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <CACxGe6vK24j=L_WQWf5eqmdKXf0gCD=waAbJj4eq9d63O8mbvA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06.11.2011 19:42, Grant Likely wrote:
> On Sun, Nov 6, 2011 at 11:38 AM, Grant Likely<grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>  wrote:
>> On Sat, Nov 05, 2011 at 07:19:15AM +0100, Dirk Behme wrote:
>>> The patch 'arm/dt: Add dtb make rule' adds support to
>>> create a .dtb file. But this is never removed afterwards.
>>> Remove the generated .dtb file if 'distclean' is called.
>>>
>>> Signed-off-by: Dirk Behme<dirk.behme-V5te9oGctAVWk0Htik3J/w@public.gmane.org>
>>> CC: Rob Herring<rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>>> CC: Shawn Guo<shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>>> CC: Jason Liu<jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>> CC: Grant Likely<grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>>
>> Acked-by: Grant Likely<grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>
> ... although why are only the .dtb files needed in the clean list?
> How are the other built files cleaned?  'make clean' does remove the
> other images, but I don't know what the mechanism is.

A lot of stuff is removed by the top level Makefile [1]. But as the 
patch "arm/dt: Add dtb make rule" adds the .dtb generation to 
arch/arm/boot/Makefile, we thought it would be a good place to add the 
removal of that file there, too.

Hmm, not sure if this answers your question, though ;)

Best regards

Dirk

[1] 
http://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git;a=blob;f=Makefile;h=ed25c5b35470dc2035f8b024994fa6cb7cecaca6;hb=HEAD#l1188

>>
>>> ---
>>>   arch/arm/boot/Makefile |    2 ++
>>>   1 files changed, 2 insertions(+), 0 deletions(-)
>>>
>>> diff --git a/arch/arm/boot/Makefile b/arch/arm/boot/Makefile
>>> index 1cd9b0a..08f0d35 100644
>>> --- a/arch/arm/boot/Makefile
>>> +++ b/arch/arm/boot/Makefile
>>> @@ -71,6 +71,8 @@ $(obj)/%.dtb: $(src)/dts/%.dts
>>>
>>>   $(obj)/dtbs: $(addprefix $(obj)/, $(dtb-y))
>>>
>>> +clean-files := *.dtb
>>> +
>>>   quiet_cmd_uimage = UIMAGE  $@
>>>         cmd_uimage = $(CONFIG_SHELL) $(MKIMAGE) -A arm -O linux -T kernel \
>>>                   -C none -a $(LOADADDR) -e $(STARTADDR) \
>>> --
>>> 1.7.0.4
>>>
>>
>
>
>
