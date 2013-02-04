From: Srinivas KANDAGATLA <srinivas.kandagatla@st.com>
Subject: Re: [PATCH V7] kbuild: create a rule to run the pre-processor on
 *.dts files
Date: Mon, 04 Feb 2013 07:36:00 +0000
Message-ID: <510F64E0.6020808@st.com>
References: <1357152215-5845-1-git-send-email-swarren@wwwdotorg.org> <510B8480.7000507@st.com> <510BF281.1080309@gmail.com> <510BFB02.6000002@wwwdotorg.org> <510C169C.8050400@wwwdotorg.org>
Reply-To: srinivas.kandagatla@st.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <510C169C.8050400@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Rob Herring <robherring2@gmail.com>, Michal Marek <mmarek@suse.cz>, Stephen Warren <swarren@nvidia.com>, devicetree-discuss@lists.ozlabs.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, linux-kernel@vger.kernel.org, Scott Wood <scottwood@freescale.com>, Grant Likely <glikely@secretlab.ca>, Sam Ravnborg <sam@ravnborg.org>
List-Id: devicetree@vger.kernel.org

On 01/02/13 19:25, Stephen Warren wrote:
> On 02/01/2013 10:27 AM, Stephen Warren wrote:
>> On 02/01/2013 09:51 AM, Rob Herring wrote:
>>> On 02/01/2013 03:01 AM, Srinivas KANDAGATLA wrote:
>>>> Hi Stephen,
>>>> Not sure if you have already noticed this but,
>>>> I did try this patch on my 3.8, and it looks like the intermediate dts
>>>> file replaces all instances of linux with 1 because of predefined macros
>>>> in gcc.
>>>> As a result
>>>>     linux,stdout-path = "/soc/stm-asc2";
>>>> is changed to.
>>>>     1,stdout-path = "/soc/stm-asc2";
>>>>
>>>> On my version of compiler(gcc version 4.6.3) I have
>>>>
>>>> armv7-linux-gcc -E -dM - < /dev/null | grep -v _
>>>> #define unix 1
>>>> #define linux 1
>>>>
>>>> Which might be true with most compiler versions aswell.
>>>> As we are using linux as prefix for some device tree properties it makes
>>>> sense to undef the linux gcc define.
>>>> Adding -Ulinux to cmd_dtc_cpp should fix it.
>>>>
>>>> -cmd_dtc_cpp = $(CPP) $(cpp_flags) -D__DTS__ -x assembler-with-cpp -o
>>>> $(dtc-tmp) $< ; \
>>>> +cmd_dtc_cpp = $(CPP) $(cpp_flags) -D__DTS__  -Ulinux -x
>>>> assembler-with-cpp -o $(dtc-tmp) $< ; \
>>>>     $(objtree)/scripts/dtc/dtc -O dtb -o $@ -b 0 $(DTC_FLAGS) $(dtc-tmp)
>>> That's a hackish solution that seems fragile as well. Is there no way to
>>> turn off all built-in defines?
>> I'm pretty sure there is; I'll go find it.
> Hmmm. I can't actually find one.
There is another option(-undef) to turn of system-specific options and
keep standard macros like __ASSEMBLER__

|-undef||(|Do not predefine any system-specific or GCC-specific macros.
The standard predefined macros remain defined.
(http://gcc.gnu.org/onlinedocs/cpp/Standard-Predefined-Macros.html#Standard-Predefined-Macros))
This option also worked for me.

--srini

>
>> But we do want to keep some of the built-in defines. for example, -x
>> assembler-with-cpp turns on __ASSEMBLY__ or similar, which headers can
>> use to determine whether to only set up #defines, or also C-oriented
>> stuff like types/prototypes. So, at least that one would need to be
>> explicitly re-defined.
> I grep'd through the kernel's include/ and there are quite a few hits
> for some of the pre-define macros such as __linux__, __GNUC__,
> __STRICT_ANSI__, __KERNEL__, __arm__ (and presumably other arch macros),
> etc. I'd guess that an explicit blacklisting of -Dlinux and -Dunix might
> be the most manageable path. Thoughts?
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
>
>
