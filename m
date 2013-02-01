From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH V7] kbuild: create a rule to run the pre-processor on
 *.dts files
Date: Fri, 01 Feb 2013 10:51:13 -0600
Message-ID: <510BF281.1080309@gmail.com>
References: <1357152215-5845-1-git-send-email-swarren@wwwdotorg.org> <510B8480.7000507@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <510B8480.7000507@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: srinivas.kandagatla@st.com
Cc: Stephen Warren <swarren@wwwdotorg.org>, Grant Likely <glikely@secretlab.ca>, Michal Marek <mmarek@suse.cz>, Stephen Warren <swarren@nvidia.com>, Sam Ravnborg <sam@ravnborg.org>, Mark Brown <broonie@opensource.wolfsonmicro.com>, linux-kernel@vger.kernel.org, Scott Wood <scottwood@freescale.com>, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On 02/01/2013 03:01 AM, Srinivas KANDAGATLA wrote:
> Hi Stephen,
> Not sure if you have already noticed this but,
> I did try this patch on my 3.8, and it looks like the intermediate dts
> file replaces all instances of linux with 1 because of predefined macros
> in gcc.
> As a result
>     linux,stdout-path = "/soc/stm-asc2";
> is changed to.
>     1,stdout-path = "/soc/stm-asc2";
> 
> On my version of compiler(gcc version 4.6.3) I have
> 
> armv7-linux-gcc -E -dM - < /dev/null | grep -v _
> #define unix 1
> #define linux 1
> 
> Which might be true with most compiler versions aswell.
> As we are using linux as prefix for some device tree properties it makes
> sense to undef the linux gcc define.
> Adding -Ulinux to cmd_dtc_cpp should fix it.
>
> -cmd_dtc_cpp = $(CPP) $(cpp_flags) -D__DTS__ -x assembler-with-cpp -o
> $(dtc-tmp) $< ; \
> +cmd_dtc_cpp = $(CPP) $(cpp_flags) -D__DTS__  -Ulinux -x
> assembler-with-cpp -o $(dtc-tmp) $< ; \
>     $(objtree)/scripts/dtc/dtc -O dtb -o $@ -b 0 $(DTC_FLAGS) $(dtc-tmp)

That's a hackish solution that seems fragile as well. Is there no way to
turn off all built-in defines?

Rob
