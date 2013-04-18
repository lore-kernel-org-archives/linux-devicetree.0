From: Padma Venkat <padma.kvr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Regarding dtc+cpp support
Date: Thu, 18 Apr 2013 21:51:46 +0530
Message-ID: <CAAgF-BefLWjRz3TXb6ESVQVA1Xno-z-WW2QVg6pNa+6_YW7AUg@mail.gmail.com>
References: <CAAgF-BeFKxK4=myPjHHWt9VxsyYQFen8c5c_9mQkbPo3n1oqJw@mail.gmail.com>
 <517007F6.3010107@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <517007F6.3010107-l0cyMroinI0@public.gmane.org>
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
To: Jon Hunter <jon-hunter-l0cyMroinI0@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, Apr 18, 2013 at 8:19 PM, Jon Hunter <jon-hunter-l0cyMroinI0@public.gmane.org> wrote:
>
> On 04/18/2013 04:12 AM, Padma Venkat wrote:
>> Hi Stephen,
>>
>> I am trying to add a header file for samsung audio subsystem clk
>> definitions, which can be used in kernel and dt files.
>> I applied following patches posted by you in my working tree.
>>
>>
>> [1/7] kbuild: create an "include chroot" for DT bindings
>> [2/7] kbuild: fixdep: support concatenated dep files
>> [3/7] kbuild: cmd_dtc_cpp: extract deps from both gcc -E and dtc
>> [4/7] kbuild: always run gcc -E on *.dts, remove cmd_dtc_cpp
>> [5/7] ARM: dt: add header to define GPIO flags
>> [6/7] ARM: dt: add header to define IRQ flags
>> [7/7] ARM: dt: create a DT header for the GIC
>>
>> I created a header file in
>> arch/arm/boot/dts/include/clk/samsung-audss-clk.h and I included this
>> header in driver and dtsi files
>>
>> Please see the code snippet in dtsi below.
>>
>> #include <dt-bindings/clk/samsung-audss-clk.h>
>> /include/ "skeleton.dtsi"
>> /include/ "exynos5250-pinctrl.dtsi
>
> Try making all of the above "#include" ...

I haven't changed all dts files but I tried below with no success.

>
> #include <dt-bindings/clk/samsung-audss-clk.h>
> #include "skeleton.dtsi"
> #include "exynos5250-pinctrl.dtsi
>
>> In driver it is compiling successfully but in dtsi files I am getting
>> the follwing compilation error.
>>
>> Error: arch/arm/boot/dts/exynos5250.dtsi:21.1-9 syntax error
>> FATAL ERROR: Unable to parse input tree
>> make[1]: *** [arch/arm/boot/dts/exynos5250-arndale.dtb] Error 1
>> make[1]: *** Waiting for unfinished jobs....
>>   DTC     arch/arm/boot/dts/exynos5250-snow.dtb
>> Error: arch/arm/boot/dts/exynos5250.dtsi:21.1-9 syntax error
>> FATAL ERROR: Unable to parse input tree
>> make[1]: *** [arch/arm/boot/dts/exynos5250-smdk5250.dtb] Error 1
>> Error: arch/arm/boot/dts/exynos5250.dtsi:21.1-9 syntax error
>> FATAL ERROR: Unable to parse input tree
>> make[1]: *** [arch/arm/boot/dts/exynos5250-snow.dtb] Error 1
>> make: *** [dtbs] Error 2
>> make: *** Waiting for unfinished jobs....
>>
>> where "#include <dt-bindings/clk/samsung-audss-clk.h>" is the 21st
>> line in the dtsi file.
>>
>> Please let me know if any extra patches are required to solve this
>> compilation error?
>
> I was seeing some compile errors when I had a mixture of /include/ and
> #include.
>
> Cheers
> Jon

Thanks
Padma
