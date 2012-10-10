From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: dtc: import latest upstream dtc
Date: Wed, 10 Oct 2012 12:42:14 -0600
Message-ID: <5075C186.1080609@wwwdotorg.org>
References: <1349827466.26044.16@snotra> <ADE80D65-5170-4A8E-8D90-29161F8DB3BB@bsdimp.com> <20121010072401.GA28467@truffula.fritz.box> <50759152.9050407@wwwdotorg.org> <5075954B.8030008@gmail.com> <5075A00B.2040509@wwwdotorg.org> <5075ADF3.4040407@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5075ADF3.4040407@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: David Gibson <david@gibson.dropbear.id.au>, Michal Marek <mmarek@suse.cz>, Stephen Warren <swarren@nvidia.com>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, Scott Wood <scottwood@freescale.com>
List-Id: devicetree@vger.kernel.org

On 10/10/2012 11:18 AM, Rob Herring wrote:
> On 10/10/2012 11:19 AM, Stephen Warren wrote:
>> On 10/10/2012 09:33 AM, Rob Herring wrote:
>>> On 10/10/2012 10:16 AM, Stephen Warren wrote:
>>>> On 10/10/2012 01:24 AM, David Gibson wrote:
>>>>> On Tue, Oct 09, 2012 at 10:43:50PM -0600, Warner Losh wrote:
>>>>>>
>>>>>> On Oct 9, 2012, at 6:04 PM, Scott Wood wrote:
>>>>>>
>>>>>>> On 10/09/2012 06:20:53 PM, Mitch Bradley wrote:
>>>>>>>> On 10/9/2012 11:16 AM, Stephen Warren wrote:
>>>>>>>>> On 10/01/2012 12:39 PM, Jon Loeliger wrote:
>>>>>>>>>>>
>>>>>>>>>>> What more do you think needs discussion re: dtc+cpp?
>>>>>>>>>>
>>>>>>>>>> How not to abuse the ever-loving shit out of it? :-)
>>>>>>>>>
>>>>>>>>> Perhaps we can just handle this through the regular patch review
>>>>>>>>> process; I think it may be difficult to define and agree upon exactly
>>>>>>>>> what "abuse" means ahead of time, but it's probably going to be easy
>>>>>>>>> enough to recognize it when one sees it?
>>>>>>>> One of the ways it could get out of hand would be via "include
>>>>>>>> dependency hell".  People will be tempted to reuse existing .h files
>>>>>>>> containing pin definitions, which, if history is a guide, will end up
>>>>>>>> depending on all sorts of other .h files.
>>>>>>>> Another problem I often face with symbolic names is the difficulty of
>>>>>>>> figuring out what the numerical values really are (for debugging),
>>>>>>>> especially when .h files are in different subtrees from the files that
>>>>>>>> use the definitions, and when they use multiple macro levels and fancy
>>>>>>>> features like concatenation.  Sometimes I think it's clearer just to
>>>>>>>> write the number and use a comment to say what it is.
>>>>>>>
>>>>>>> Both comments apply just as well to ordinary C code, and I don't think anyone would seriously suggest just using comments instead for C code.
>>>>>>
>>>>>> .h files include both structs and defines, which are fine for
>>>>>> ordinary C code, but problematic in this context.
>>>>>
>>>>> Right, cpp should be invoked with similar options to the way it's done
>>>>> for asm files which have the same problem.  I'm not sure if the
>>>>> current patch does so.
>>>>
>>>> That's probably a reasonable idea, although I imagined that people would
>>>> actually split out the portions of any header file they wanted to use
>>>> with dtc, so that any headers included by *.dts would only include
>>>> #defines. Those headers could be used by both dtc and other .h files (or
>>>> .c files).
>>>
>>> Used by what other files? kernel files? We ultimately want to split out
>>> dts files from the kernel, so whatever we add needs to be self
>>> contained. I don't see this as a huge issue though because the whole
>>> point of the DT data is to move that information out of the kernel. If
>>> it is needed in both places, then something is wrong.
>>
>> One example is the IDs of the GPIOs, e.g.:
>>
>> #define TEGRA_PIN_VI_GP6_PA0            _GPIO(0)
>> #define TEGRA_PIN_UART3_CTS_N_PA1       _GPIO(1)
>> #define TEGRA_PIN_DAP2_FS_PA2           _GPIO(2)
>> #define TEGRA_PIN_DAP2_SCLK_PA3         _GPIO(3)
>>
>> Those defines are useful to both the .dts files (so named constants can
>> be used) and the pinctrl driver. By using the same header file, we
>> guarantee that the .dts files and pinctrl driver use the exact same
>> naming for the pins; the pin naming/numbering being defined by the DT
>> binding more than anything else.
> 
> If pinctrl needs to get a matching name, then it should get it from the
> dtb. We should not have 2 sources of data. That is just broken.

Why? The data is static and there's zero need for it to be in the DTB.
We've been over this already many times.

This is just like /any/ other header file usage. Something defines the
legal values. Various things need to use them. So, we define the values
in a header file, and both *.dts and *.c include them.
