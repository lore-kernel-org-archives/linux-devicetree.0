From: Jon Hunter <jon-hunter-l0cyMroinI0@public.gmane.org>
Subject: Re: Regarding dtc+cpp support
Date: Thu, 18 Apr 2013 11:57:48 -0500
Message-ID: <5170260C.4000700@ti.com>
References: <CAAgF-BeFKxK4=myPjHHWt9VxsyYQFen8c5c_9mQkbPo3n1oqJw@mail.gmail.com>
 <517007F6.3010107@ti.com>
 <CAAgF-BefLWjRz3TXb6ESVQVA1Xno-z-WW2QVg6pNa+6_YW7AUg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAAgF-BefLWjRz3TXb6ESVQVA1Xno-z-WW2QVg6pNa+6_YW7AUg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Padma Venkat <padma.kvr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On 04/18/2013 11:21 AM, Padma Venkat wrote:
> Hi,
> 
> On Thu, Apr 18, 2013 at 8:19 PM, Jon Hunter <jon-hunter-l0cyMroinI0@public.gmane.org> wrote:
>>
>> On 04/18/2013 04:12 AM, Padma Venkat wrote:
>>> Hi Stephen,
>>>
>>> I am trying to add a header file for samsung audio subsystem clk
>>> definitions, which can be used in kernel and dt files.
>>> I applied following patches posted by you in my working tree.
>>>
>>>
>>> [1/7] kbuild: create an "include chroot" for DT bindings
>>> [2/7] kbuild: fixdep: support concatenated dep files
>>> [3/7] kbuild: cmd_dtc_cpp: extract deps from both gcc -E and dtc
>>> [4/7] kbuild: always run gcc -E on *.dts, remove cmd_dtc_cpp
>>> [5/7] ARM: dt: add header to define GPIO flags
>>> [6/7] ARM: dt: add header to define IRQ flags
>>> [7/7] ARM: dt: create a DT header for the GIC
>>>
>>> I created a header file in
>>> arch/arm/boot/dts/include/clk/samsung-audss-clk.h and I included this
>>> header in driver and dtsi files
>>>
>>> Please see the code snippet in dtsi below.
>>>
>>> #include <dt-bindings/clk/samsung-audss-clk.h>
>>> /include/ "skeleton.dtsi"
>>> /include/ "exynos5250-pinctrl.dtsi
>>
>> Try making all of the above "#include" ...
> 
> I haven't changed all dts files but I tried below with no success.

I should mentioned that you should also make any /include/ in the *.dtsi
above #include too.

Cheers
Jon
