From: Meador Inge <meador_inge-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/4] ARM: DT: Add a basic dts file for SMDKV310 machine
Date: Mon, 07 Feb 2011 13:34:25 -0600
Message-ID: <4D504941.3010507@mentor.com>
References: <1296998250-21856-1-git-send-email-thomas.abraham@linaro.org>	<1296998250-21856-3-git-send-email-thomas.abraham@linaro.org>	<20110207000412.GA28953@yookeroo>
	<4D5046DC.8010503@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4D5046DC.8010503-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 02/07/2011 01:24 PM, Rob Herring wrote:
> David, Thomas,
>
> On 02/06/2011 06:04 PM, David Gibson wrote:
>> On Sun, Feb 06, 2011 at 06:47:28PM +0530, Thomas Abraham wrote:
>>> This patch adds a basic dts file for Samsung's SMDKV310 machine.
>>>
>>> Signed-off-by: Thomas Abraham<thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>> ---
>>>    arch/arm/mach-s5pv310/mach-smdkv310.dts |   38 +++++++++++++++++++++++++++++++
>>>    1 files changed, 38 insertions(+), 0 deletions(-)
>>>    create mode 100755 arch/arm/mach-s5pv310/mach-smdkv310.dts
>>>
>>> diff --git a/arch/arm/mach-s5pv310/mach-smdkv310.dts b/arch/arm/mach-s5pv310/mach-smdkv310.dts
>>> new file mode 100755
>>> index 0000000..74d80bf
>>> --- /dev/null
>>> +++ b/arch/arm/mach-s5pv310/mach-smdkv310.dts
>>> @@ -0,0 +1,38 @@
>>> +/dts-v1/;
>>> +
>>> +/ {
>>> +	model = "smdkv310";
>>> +	compatible = "samsung,smdkv310";
>>> +	#address-cells =<1>;
>>> +	#size-cells =<1>;
>>> +
>>> +	memory {
>>> +		device_type = "memory";
>>> +		reg =<0x40000000 0x08000000>;
>>> +	};
>>
>> Uh.. where are the cpus?
>>
>
> But for ARM, all the details of the cpu are probe-able. So what would we
> gain by putting cpu info in the DTS?

Perhaps there are use cases where the system designer wants to lock in a 
certain configuration.  Hardware partitioning is one such case.  For 
example, say you have a multicore ARM platform and you only want your 
kernel to know about certain cpus.  One way to do that is by pulling the 
cpus you don't want the kernel to know about out of the device tree.

-- 
Meador Inge     | meador_inge AT mentor.com
Mentor Embedded | http://www.mentor.com/embedded-software
