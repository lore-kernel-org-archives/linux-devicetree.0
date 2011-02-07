From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/4] ARM: DT: Add a basic dts file for SMDKV310 machine
Date: Mon, 07 Feb 2011 13:24:12 -0600
Message-ID: <4D5046DC.8010503@gmail.com>
References: <1296998250-21856-1-git-send-email-thomas.abraham@linaro.org>	<1296998250-21856-3-git-send-email-thomas.abraham@linaro.org>
	<20110207000412.GA28953@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <20110207000412.GA28953@yookeroo>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

David, Thomas,

On 02/06/2011 06:04 PM, David Gibson wrote:
> On Sun, Feb 06, 2011 at 06:47:28PM +0530, Thomas Abraham wrote:
>> This patch adds a basic dts file for Samsung's SMDKV310 machine.
>>
>> Signed-off-by: Thomas Abraham<thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>>   arch/arm/mach-s5pv310/mach-smdkv310.dts |   38 +++++++++++++++++++++++++++++++
>>   1 files changed, 38 insertions(+), 0 deletions(-)
>>   create mode 100755 arch/arm/mach-s5pv310/mach-smdkv310.dts
>>
>> diff --git a/arch/arm/mach-s5pv310/mach-smdkv310.dts b/arch/arm/mach-s5pv310/mach-smdkv310.dts
>> new file mode 100755
>> index 0000000..74d80bf
>> --- /dev/null
>> +++ b/arch/arm/mach-s5pv310/mach-smdkv310.dts
>> @@ -0,0 +1,38 @@
>> +/dts-v1/;
>> +
>> +/ {
>> +	model = "smdkv310";
>> +	compatible = "samsung,smdkv310";
>> +	#address-cells =<1>;
>> +	#size-cells =<1>;
>> +
>> +	memory {
>> +		device_type = "memory";
>> +		reg =<0x40000000 0x08000000>;
>> +	};
>
> Uh.. where are the cpus?
>

But for ARM, all the details of the cpu are probe-able. So what would we 
gain by putting cpu info in the DTS?

>> +	chosen {
>> +		bootargs = "root=/dev/ram0 rw ramdisk=8192 initrd=0x41000000,8M console=ttySAC1,115200 init=/linuxrc";
>> +	};
>> +
>> +	soc {
>> +		#address-cells =<1>;
>> +		#size-cells =<1>;
>> +		compatible = "simple-bus";
>
> It's generally a good idea to list the specific soc model before "simple-bus".
>
>> +		ranges =<0x00000000 0x00000000 0xFFFFFFFF>;

For no translation, you can do just:

ranges;

Rob
